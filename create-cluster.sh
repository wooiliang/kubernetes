#!/bin/bash

gcloud container \
clusters create "tutorial" \
--zone "us-central1-a" \
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
--network "default" \
--enable-cloud-logging \
--enable-cloud-monitoring \
--subnetwork "default" \
--enable-autoupgrade
