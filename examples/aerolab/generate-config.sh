#!/bin/bash

aerolab attach asadm \
--name="dc1" -- \
-e asadm \
-U user1 \
-P Wmr4gJgh \
-e 'generate config with node 10.128.15.206:3000 | asconfig convert -a 6.3.0 > aerospike.yaml'

aerolab files download --name="dc1" -l 1 /root/aerospike.yaml .

code aerospike.yaml