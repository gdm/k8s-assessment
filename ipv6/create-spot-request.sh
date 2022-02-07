#!/bin/bash -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# ------------------ This part can be separated as common
function MSG () {
  printf "%(%FT%H:%M:%S%z)T [%s] %s %s\n" -1 $1 $HOSTNAME "$2"
}

function INFO () {
  MSG INFO "$1"
}

trap "INFO 'Completed ${BASH_SOURCE[0]}'" EXIT
# ------------------ end of common part

INFO "Started ${BASH_SOURCE[0]}"
export AWS_DEFAULT_REGION=eu-central-1
export INSTANCE_TYPE=t4g.nano
LIMIT=0.02

BASE_DOMAIN=sentia.contrall.info
TAG=$BASE_DOMAIN

STACK_NAME=IPV6

mkdir -p tmp
cd tmp
function create_spot_instance () {
  aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs' --output json > ./stack.json
  $DIR/make_spec.py --userdata $DIR/userdata.sh < stack.json > spec_new_instance.json

  REQUEST_OUTPUT=$(aws ec2 request-spot-instances --instance-count 1 \
         --instance-interruption-behavior stop \
         --spot-price "$LIMIT" \
         --type persistent     \
         --launch-specification file://spec_new_instance.json)

  echo "$REQUEST_OUTPUT" > spot_request.json
}

create_spot_instance

REQUEST_ID=$(jq  --raw-output '.[][0].SpotInstanceRequestId' spot_request.json)
INFO "Request ID is ${REQUEST_ID}"

# create tag for spot request (checks also success of the previous step)
aws ec2 create-tags --resources ${REQUEST_ID} --tags Key=Name,Value=${TAG}


INSTANCE_ID=
function fetch_instance_id () { 
  INSTANCE_ID=`aws ec2 describe-spot-instance-requests --spot-instance-request-ids ${REQUEST_ID} | jq --raw-output '.SpotInstanceRequests[0].InstanceId'`; 
}

# TODO: use loop
function fetch_instance_id_with_waiting () {
  INFO "Start waiting for fulfillment ..."
  sleep 20
  fetch_instance_id 
  if [ -z $INSTANCE_ID ]; then
    INFO "No instance id, will try again"
    sleep 20
    fetch_instance_id
    test -n $INSTANCE_ID || exit 2
  fi
}

fetch_instance_id_with_waiting

aws ec2 describe-instances --instance-ids $INSTANCE_ID > describe-instance-output.json
PUBLIC_IP=$(jq --raw-output '.Reservations[0].Instances[0].PublicIpAddress' describe-instance-output.json)
echo "public ip is $PUBLIC_IP"
echo "instance id is $INSTANCE_ID"

aws ec2 create-tags --resources ${INSTANCE_ID} --tags Key=Name,Value=${TAG} Key=Hostname,Value=${BASE_DOMAIN}

## OBSOLETE
# try to assign IPv6 address
#NETWORK_IFACE_ID=$(jq --raw-output '.Reservations[0].Instances[0].NetworkInterfaces[0].NetworkInterfaceId' describe-instance-output.json)
# get network ID
#aws ec2 assign-ipv6-addresses --ipv6-address-count 1 --network-interface-id $NETWORK_IFACE_ID > ipv6-assignment.json
#IPV6_ASSIGNED=$(jq --raw-output '.AssignedIpv6Addresses[0]' ipv6-assignment.json)
#echo "IPv6: $IPV6_ASSIGNED"

echo ""
#echo "ssh ec2-user@${PUBLIC_IP}"
echo "ssh ec2-user@${PUBLIC_IP}"


exit 0


---- termination
aws ec2 cancel-spot-instance-requests --spot-instance-request-ids sir-b8t8tnfg
aws ec2 terminate-instances --instance-ids i-0679bee1e1a8e939c
... # wait for status of volume 
aws ec2 describe-volumes --volume-ids vol-086eff046dc58d443 | jq '.Volumes[0].State'
"available"
aws ec2 delete-volume --volume-id vol-086eff046dc58d443
