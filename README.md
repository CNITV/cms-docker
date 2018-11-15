# cms-docker

Run [CMS](https://cms-dev.github.io) in a Docker container.

## Usage

1. Edit the environment variables in `docker-compose.yaml` and the configuration files under `config/` to reflect your desired environment configuration.
2. `docker-compose run --rm admin /init.sh` (make sure you write down the generated admin password)
3. `docker-compose up admin` and configure your contest(s).
4. `docker-compose up`

## Caveats

* Running a worker in Docker is not recommended because it induces run-time variability and requires running the container in privileged mode.
* Due to the nature of Docker networking and DNS resolution of container hostnames, running worker nodes on dedicated hosts outside of the Docker network is possible only if the hostnames of the CMS containers (`core`, `contest`, `admin`, `db`) are statically mapped in each worker host's `/etc/hosts` file to the *Docker machine*'s exterior-facing IP address.