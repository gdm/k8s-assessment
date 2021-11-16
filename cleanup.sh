# from https://github.com/aws-quickstart/quickstart-amazon-eks/issues/208
aws cloudformation deregister-type --type RESOURCE --type-name AWSQS::EKS::Cluster --version-id 00000001
aws cloudformation deregister-type --type RESOURCE --type-name AWSQS::EKS::Cluster --version-id 00000002
aws cloudformation deregister-type --type RESOURCE --type-name AWSQS::EKS::Cluster --version-id 00000003
aws cloudformation deregister-type --type RESOURCE --type-name AWSQS::EKS::Cluster
aws cloudformation deregister-type --type RESOURCE --type-name AWSQS::Kubernetes::Helm --version-id 00000001
aws cloudformation deregister-type --type RESOURCE --type-name AWSQS::Kubernetes::Helm
aws cloudformation deregister-type --type RESOURCE --type-name AWSQS::Kubernetes::Resource --version-id 00000001
aws cloudformation deregister-type --type RESOURCE --type-name AWSQS::Kubernetes::Resource
aws cloudformation deregister-type --type RESOURCE --type-name AWSQS::Kubernetes::Get --version-id 00000001
aws cloudformation deregister-type --type RESOURCE --type-name AWSQS::Kubernetes::Get
