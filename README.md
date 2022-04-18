# Bitergia Analytics OpenSearch

Bitergia Analytics Docker image for OpenSearch.


## Using the image

Pull the image using the next command:

```
docker pull bitergia/bitergia-analytics-opensearch:latest
```

Then, run a container with the command:

```
docker run -p 9200:9200 -p 9600:9600 -e "discovery.type=single-node" bitergia/bitergia-analytics-opensearch:latest
```
