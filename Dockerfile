# https://docs.docker.com/samples/library/alpine/
FROM alpine:3.10.2 AS builder

ENV TERRAFORM_VERSION=0.12.8

RUN apk add --update wget unzip git bash && \
    wget -q -O /terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip /terraform.zip -d /bin

FROM alpine:3.10.2

ARG work_dir

COPY --from=builder /bin/terraform /bin/terraform

# Terraform needs CURL to download plugins
RUN apk add --update curl bash

WORKDIR $work_dir

ENTRYPOINT ["tail", "-f", "/dev/null"]
