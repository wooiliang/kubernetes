# kubernetes

#### Create cluster
`./create-cluster.sh`

#### Get authentication credentials for the cluster
`gcloud container clusters get-credentials tutorial`

#### Apply manifest
`kubectl apply -f manifest.yaml`

#### Kubernetes UI
`kubectl proxy`
To get access token - `kubectl config view`
