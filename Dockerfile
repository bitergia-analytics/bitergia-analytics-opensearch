FROM opensearchproject/opensearch:1.2.4

LABEL maintainer="Santiago Dueñas <sduenas@bitergia.com>"
LABEL org.opencontainers.image.title="Bitergia Analytics OpenSearch"
LABEL org.opencontainers.image.description="Bitergia Analytics OpenSearch service"
LABEL org.opencontainers.image.url="https://bitergia.com/"
LABEL org.opencontainers.image.documentation="https://github.com/bitergia/bitergia-analytics-opensearch/"
LABEL org.opencontainers.image.vendor="Bitergia"
LABEL org.opencontainers.image.authors="sduenas@bitergia.com"

#
# Setup
#

WORKDIR /usr/share/opensearch

ENV PATH=/usr/share/opensearch/bin/:$PATH

#
# Plugins installation
#
# Secrets and keys can be configured once the container
# is running using 'opensearch-keystore' command.
#
RUN opensearch-plugin install --batch repository-s3 && \
    opensearch-plugin install --batch repository-gcs
RUN opensearch-keystore create

# Remove plugins not supported on this release
RUN opensearch-plugin remove --purge opensearch-alerting && \
    opensearch-plugin remove --purge opensearch-anomaly-detection && \
    opensearch-plugin remove --purge opensearch-asynchronous-search && \
    opensearch-plugin remove --purge opensearch-knn && \
    opensearch-plugin remove --purge opensearch-observability && \
    opensearch-plugin remove --purge opensearch-reports-scheduler && \
    opensearch-plugin remove --purge opensearch-sql
