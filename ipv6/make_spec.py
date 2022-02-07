#!/usr/bin/env python3
import sys, json, base64, jinja2, os
import argparse
from jinja2 import Template

ap = argparse.ArgumentParser()
ap.add_argument("-u", "--userdata", required=True, help="path to userdata file")
args = vars(ap.parse_args())

data = json.load(sys.stdin)
kv=dict()
for el in data:
  kv[el['OutputKey']]=el['OutputValue']

#print (kv)


ud = open(args['userdata'], 'rb')

template = Template("""{
  "UserData": "{{ user_data }}",
  "ImageId": "{{ image_id }}",
  "KeyName": "{{ key_name }}",
  "InstanceType": "{{ instance_type }}",
  "Monitoring": {
    "Enabled": false
  },
  "IamInstanceProfile": {
    "Arn": "{{ instance_profile }}"
  },
  "NetworkInterfaces": [
    {
      "DeviceIndex": 0,
      "SubnetId" : "{{ subnet_id }}",
      "Groups"   : [ "{{ security_group_id }}" ],
      "AssociatePublicIpAddress": false,
      "Ipv6AddressCount": 2
    }
  ]
}
""")

print (template.render(
              user_data = base64.b64encode(ud.read()).decode("ascii"), 
              # image_id = 'ami-06d8dc7de2805917d', - amazon linux 2, arm
              image_id = 'ami-0f387ed70a4960190', # RHEL 8.3 BYOL              RHEL-8.3.0_HVM_BETA-20200701-arm64-2-Access2-GP2"

              instance_profile =  kv['InstanceProfileIPV6'],
              subnet_id = kv['SubnetId2'],
              security_group_id = kv['InstanceSecurityGroup'],
              key_name = os.environ['AWS_DEFAULT_REGION'],
              instance_type = os.environ['INSTANCE_TYPE']
              ))


