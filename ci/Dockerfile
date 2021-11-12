FROM rocker/r-base

# Install external dependencies
RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

RUN install2.r --error rhub knitr xml2 tinytest remotes covr

RUN rm -rf /tmp/downloaded_packages/ /tmp/*.rds

#COPY resources/validated_emails.csv /root/.local/share/rhub/validated_emails.csv
