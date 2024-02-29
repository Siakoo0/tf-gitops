ARG TERRAFORM_VERSION=1.7.3

ARG REPO_URL
ARG COMMIT_SHA

FROM debian:stable-slim AS dependencies

ARG TERRAFORM_VERSION

RUN apt-get update -y && apt-get install unzip wget -y
RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

FROM google/cloud-sdk:465.0.0-alpine

ARG REPO_URL
ARG COMMIT_SHA

RUN mkdir /workspace
WORKDIR /workspace

COPY --from=dependencies /terraform /bin/terraform

COPY . .