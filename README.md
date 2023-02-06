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
with the addition of [buildx](https://docs.docker.com/buildx/working-with-buildx/) binary and
a [helper binary](https://github.com/chialab/aws-ecr-get-login-password) to get a login token for AWS ECR.

This image is mostly useful in CI/CD pipelines to build and publish Docker images to AWS ECR,
but can easily be used to publish on other registries.
