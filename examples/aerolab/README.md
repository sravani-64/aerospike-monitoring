# Aerolab Monitoring Stack Deploy
This provides a a reference architecture of using aerolab to
deploy 2 Aerospike clusters that share a single Monitoring Instance.
This is helpful for testing multi cluster dashboards.

## Create Clusters 
To test locally using docker.
```text
./create.sh
```

To use aws or gcp
```text
./create.sh GCP|AWS
```

## Destroy Cluster
```
./destroy.sh
```

