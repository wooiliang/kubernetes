# kubernetes

#### Create cluster
`./create-cluster.sh`

#### Get authentication credentials for the cluster
`gcloud container clusters get-credentials tutorial`

#### Apply manifest
`kubectl apply -f manifests/hello-world.yaml`

#### Kubernetes UI
`kubectl proxy`
To get access token - `kubectl config view`

## Links
scopes - https://cloud.google.com/sdk/gcloud/reference/container/clusters/create
