# ROS-II humble docker container

This repo contains bootstrap code for starting a ROS-II humble docker container for development.

# NOTE
_This is not a repository designed for reproducible builds._

The container maps the whole home from the container to the host which includes the build and install directory.

The password for the user humble is 'humble'.


# Usage
## prerequisites
- docker
- user in docker group for non-root usage
- root access for the subuid/subgid changes


## Onetime setup (only when not already setup)
For the docker container to map with the correct UID and GID the /etc/subuid and /etc/subgid files as well as the /etc/docker/daemon.json file need to be edited.
These changes are made by running:

```
sudo ./dev/runonce_docker.sh
```

_This should only be done once as this script currently does not check if these changes are already present_

## Start container

To start the container one of the following methods can be used:

```
./dev/bootstrap.sh
```

To set the ROS ID directly use:
```
./dev/bootstrap.sh --rid=<ROS_ID>
```
Optionally use --name=<Container name> to name the container.


