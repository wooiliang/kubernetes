#!/bin/bash

gcloud container clusters get-credentials jenkins-cd

kubectl delete -f jenkins/continuous-deployment-on-kubernetes/jenkins/k8s/lb/ingress.yaml

kubectl delete secret tls --namespace jenkins

kubectl delete -f jenkins/continuous-deployment-on-kubernetes/jenkins/k8s/

kubectl delete secret jenkins --namespace=jenkins

kubectl delete ns jenkins

gcloud compute disks delete jenkins-home

gcloud compute images delete jenkins-home-image

gcloud container clusters delete "jenkins-cd"

gcloud compute networks delete jenkins
