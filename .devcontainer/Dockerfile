# FROM ghcr.io/dbt-labs/dbt-bigquery:1.3.0
FROM python:3.10-buster

# dbt-bigqueryのためにgitをinstall
RUN apt update && apt install -y git \
  apt-transport-https ca-certificates gnupg curl \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

# dbt認証用gcloudのinstall
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
  && apt-get update -y && apt-get install google-cloud-cli -f -y \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

ENV DBT_DIR /usr/app/dbt
WORKDIR $DBT_DIR
COPY ./requirements.lock $DBT_DIR/requirements.lock
RUN pip install -r requirements.lock
