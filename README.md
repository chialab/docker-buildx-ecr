<p align="center">
  <strong>Docker + buildx + AWS ECR images</strong>
</p>

<p align="center">
    <a href="https://github.com/chialab/docker-buildx-ecr/actions/workflows/main.yml"><img alt="Build status" src="https://github.com/chialab/docker-buildx-ecr/actions/workflows/main.yml/badge.svg"></a>
    <a href="https://www.chialab.it"><img alt="Authors link" src="https://img.shields.io/badge/Authors-Chialab-lightgrey.svg?style=flat-square"></a>
    <a href="https://github.com/chialab/docker-buildx-ecr/blob/main/LICENSE"><img alt="License" src="https://img.shields.io/github/license/chialab/docker-buildx-ecr.svg?style=flat-square"></a>
</p>

---

Docker image built on top of [official Docker image](https://hub.docker.com/_/docker),
with the addition of a [helper binary](https://github.com/chialab/aws-ecr-get-login-password) to get a login token for AWS ECR.

This image is mostly useful in CI/CD pipelines to build and publish Docker images to AWS ECR,
but can easily be used to publish on other registries.

## Usage

### Login to ECR

The machine on which this command is run must be authenticated to the desired AWS account and have an associated IAM policy granting
it permission to obtain the token (see the binary's repository for more information).

```shell
aws-ecr-get-login-password | docker login -u AWS --password-stdin "${ECR_REGISTRY}"
```

### Build container

For a multi-architecture image with buildx, run these commands:

```shell
docker run --privileged tonistiigi/binfmt --install all
docker context create multi-arch
docker --context multi-arch buildx create --use
docker --context multi-arch buildx build --platform 'linux/amd64,linux/arm64' -t "${IMAGE_NAME}:${IMAGE_TAG}" .
```
