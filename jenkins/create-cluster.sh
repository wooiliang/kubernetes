#!/bin/bash

gcloud compute networks create jenkins

gcloud container \
clusters create "jenkins-cd" \
--zone "asia-southeast1-a" \
--username "admin" \
--cluster-version "1.9.2-gke.1" \
--machine-type "f1-micro" \
--image-type "COS" \
--disk-size "10" \
--scopes \
"https://www.googleapis.com/auth/compute",\
"https://www.googleapis.com/auth/devstorage.read_only",\
"https://www.googleapis.com/auth/logging.write",\
"https://www.googleapis.com/auth/monitoring",\
"https://www.googleapis.com/auth/servicecontrol",\
"https://www.googleapis.com/auth/service.management.readonly",\
"https://www.googleapis.com/auth/trace.append" \
--num-nodes "3" \
--network "jenkins" \
--enable-cloud-logging \
--enable-cloud-monitoring \
--subnetwork "jenkins" \
--enable-autoupgrade

gcloud container clusters get-credentials jenkins-cd

gcloud compute images create jenkins-home-image --source-uri https://storage.googleapis.com/solutions-public-assets/jenkins-cd/jenkins-home-v3.tar.gz

gcloud compute disks create jenkins-home --image jenkins-home-image --zone asia-southeast1-a

kubectl create ns jenkins

kubectl create secret generic jenkins --from-file=jenkins/continuous-deployment-on-kubernetes/jenkins/k8s/options --namespace=jenkins

kubectl apply -f jenkins/continuous-deployment-on-kubernetes/jenkins/k8s/

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /tmp/tls.key -out /tmp/tls.crt -subj "/CN=jenkins/O=jenkins"

kubectl create secret generic tls --from-file=/tmp/tls.crt --from-file=/tmp/tls.key --namespace jenkins

kubectl apply -f jenkins/continuous-deployment-on-kubernetes/jenkins/k8s/lb/ingress.yaml
