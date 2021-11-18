

helm repo add bitnami https://charts.bitnami.com/bitnami

helm install mongo-release bitnami/mongodb -f mongo-values.yaml

echo -n 'mongodb://u1:p1thnth@mongo-release-mongodb.default.svc.cluster.local/db1' | base64 -w0 ; echo >> secret-local.yaml
