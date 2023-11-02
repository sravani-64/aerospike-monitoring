#!/bin/bash

# create 6.4 
aerolab cluster create -n seven -c 1 -s n -o aerospike-7.conf --instance e2-standard-2 --zone us-central1-a --disk pd-balanced:20 --disk pd-ssd:40 --disk pd-ssd:40
# upload 7.0 deb
aerolab files upload -n seven aerospike-server-enterprise_7.0.0.0-rc3-1ubuntu22.04_arm64.deb /opt/asd7.deb
# install the deb
 aerolab attach shell -n seven -- dpkg -i /opt/asd7.deb

# start aerospike
aerolab aerospike start -n seven
aerolab cluster create -n six -c 3 --instance  e2-standard-2 --zone us-central1-a --disk pd-balanced:20 --disk pd-ssd:40 --disk pd-ssd:40


aerolab xdr connect -S six -D seven -M test,bar

aerolab cluster add exporter -n six -o ape1.toml
aerolab cluster add exporter -n seven -o ape2.toml

aerolab client create ams -n ams-test -s six,seven --instance e2-medium --zone us-central1-a --disk pd-balanced:20 -e 3000:3000
aerolab client attach  -n ams-test -- grafana-cli plugins install grafana-polystat-panel
aerolab client attach  -n ams-test -- grafana-cli plugins install jdbranham-diagram-panel
aerolab client attach  -n ams-test -- service grafana-server restart
