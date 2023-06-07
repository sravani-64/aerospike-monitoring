#!/bin/bash

aerolab cluster create -n dc1 -c 3 --instance e2-medium --zone us-central1-a --disk pd-balanced:20 --disk pd-ssd:40 --disk pd-ssd:40
aerolab cluster create -n dc2 -c 3 --instance e2-medium --zone us-central1-a --disk pd-balanced:20 --disk pd-ssd:40 --disk pd-ssd:40
aerolab cluster add exporter -n dc1 -o ape1.toml
aerolab cluster add exporter -n dc2 -o ape2.toml

if [ "$1" != "" ]
then
    aerolab client create ams -n ams -s dc1,dc2 --instance e2-medium --zone us-central1-a --disk pd-balanced:20 
else
    aerolab client create ams -n ams -s dc1,dc2 -e 3000:3000
fi
