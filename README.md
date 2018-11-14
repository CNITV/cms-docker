# cms-docker

Run [CMS](https://cms-dev.github.io) in a Docker container.

## Usage

1. Edit the environment variables in `docker-compose.yaml` and the configuration files under `config/` to reflect your desired environment configuration.
2. `docker-compose up`

## Caveats

Running a worker in Docker is not recommended because it induces run-time variability and requires running the container in privileged mode. Please run worker nodes on dedicated machines.