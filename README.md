# Clone Launchpad repositories

## Build the Docker image

Install Docker and run:

```shell
docker build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -t git-clone-lp-repo .
```

## Clone a Launchpad repository

```shell
mkdir clone-area
cd clone-area/
docker run --rm --volume $PWD:/app/clone-area --workdir /app/clone-area git-clone-lp-repo git clone "bzr::lp:schooltool" schooltool
```
