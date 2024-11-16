Afraid of AI takeover on your machine?

This repository contains a Docker setup for running [Exponent](https://docs.expo.dev/versions/latest/introduction/installation/) in a containerized environment.

Note: this is not Exponent's official Docker setup.

## Prerequisites

- Docker
- Docker Compose

## Configuration

0. Clone this repository to your host machine.

1. Make sure you have a valid Exponent configuration file at `~/.config/exponent/config.json` on your host machine.
You can obtain it by running `exponent login` in your terminal.

2. Set the `VOLUME_PATH` environment variable to specify the directory you want to mount in the container:

   ```bash
   VOLUME_PATH=/path/to/your/directory docker compose up --build
   ```

   For example:
   ```bash
   VOLUME_PATH=/home/yourname/projects/git_repository docker compose up --build
   ```

## Running the Container


The docker `compose up` command will:
- Set the volume path to your project directory
- Build the Docker image (using the Dockerfile)
- Start the container

To stop the container:

```bash
docker compose down
```

## Volume Mounts

The Docker Compose setup includes two volume mounts:

- Your working directory (specified by `VOLUME_PATH`) is mounted to `/app` in the container
- Your Exponent config file is mounted read-only from `~/.config/exponent/config.json`

## Notes

- The container automatically runs `exponent run` with the 'Y' confirmation flag
- To modify the command being run, edit the `command` field in `docker-compose.yml`