#!/bin/bash

aerolab cluster create -n dc1 -c 3
aerolab cluster create -n dc2 -c 3
aerolab cluster add exporter -n dc1,dc2
aerolab client create ams -n ams -s dc1,dc2 -e 3000:3000
aerolab client configure ams -n ams -s dc1,dc2
aerolab client list
