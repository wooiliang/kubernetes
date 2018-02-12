#!/bin/bash

gcloud container clusters get-credentials jenkins-cd

kubectl delete -f jenkins/continuous-deployment-on-kubernetes/jenkins/k8s/lb/ingress.yaml

kubectl delete secret tls --namespace jenkins

kubectl delete -f jenkins/continuous-deployment-on-kubernetes/jenkins/k8s/

kubectl delete secret jenkins --namespace=jenkins

kubectl delete ns jenkins

gcloud container clusters delete "jenkins-cd" --quiet

gcloud compute disks delete jenkins-home --quiet

gcloud compute images delete jenkins-home-image --quiet

gcloud compute networks delete jenkins --quiet
