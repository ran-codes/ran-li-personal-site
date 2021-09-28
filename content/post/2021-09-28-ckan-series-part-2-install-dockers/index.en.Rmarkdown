---
title: 'CKAN Series Part 2: Docker Basics'
author: Ran Li
date: '2021-09-28'
slug: ckan-series-part-2-docker-basic
categories:
  - CKAN Series
tags:
  - Docker
subtitle: ''
summary: ''
authors: []
lastmod: '2021-09-28T10:17:30-04:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers. These containers are portable environments that allows for seamless collaborative development as well as a production ready product; by seamless I mean we avoid dependency issues (either at the OS or software level) when collaborating because we share the entire dev environment as a self-contained package. This post will cover how I installed dockers on a PC (OS: Windows 10 Home) and some Docker basics.

Credits: This blog are basically my notes from TechWorld with Nana's [docker tutorial](https://www.youtube.com/watch?v=3c-iBn73dDE&t=174s&ab_channel=TechWorldwithNana).

# Installation

### System Requirements

-   Checked Windows OS requirement (Needs Windows 10+)
-   Enable WSL 2 feature on window: WSL stands for Windows Subsystem for Linux. The base layer for most Docker images is Linux OS. Why Linux? Its open sourced thus allows for free development but it is also stable/fast. Follow the instructions from [windows](https://docs.microsoft.com/en-us/windows/wsl/install) but don't forget to run your command terminal as an administer. FYI... Linux is the kernel (operating system) and Ubuntu is the distribution (OS bundled with utilities/interfaces); good metaphor is Linus is the engine and Ubuntu is the car. Also Linux/Ubuntu takes a while 15+ minutes to install, so have a stretch and grab a coffee.
-   Check hardware requirement: Be sure to check that Virtualization is [enabled](https://docs.docker.com/desktop/windows/troubleshoot/#virtualization-must-be-enabled).
-   Install Linux kernel updater package: follow these [windows instructions](https://docs.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package).

### Docker Desktop

Download the installer EXE from the [docker website](https://docs.docker.com/desktop/windows/install/) the run it. Relatively straightforward.

# Basic Docker Commands

-   **docker pull**: pulls a docker image from dockerHub.

-   **docker images**: checks current images on machine.

-   **docker run {image_name}**: creates a container for a certain image.

    -   detached mode: 'docker run {image_name} -d'

    -   container ports are specified by image and since containers are separate it is fine to have overlapping container specific ports. By default when a container is run it isn't running on any host port meaning you can't connect to that particular applications. However if you want to interact with you apps you have to assign them a host port (these cannot be overlapping). You do this by 'docker run-p{host_port}:{container_port} {image_name}'. For example 'docker run -p6000:6379 redis -d' runs a detached container of redis on host port 6000.

    -   name of container: add '--name {custom-container-name}. This is useful if you don't want to keep referring to contains via id; you can give more intuitive names such as 'redis-old' vs 'redis-new'

-   **docker start {container_id/names}**: this will restart an existing container with all of the attributes (name, host ports ...ETC). Note that docker run is the one that initializes a container and accepts the attributes where as docker start is just used to restart a stopped container.

-   **docker ps**: list all running containers. you can list all containers running/not running history: with 'docker ps -a'

-   **docker stop {container_id/names}**: stops container based on id. You can restart a previous container by checking history then start the id.

-   **docker logs {container_id/name}**: provides logs for each container for debugging.

-   **docker exec -it {container_id/name}**: goes into the terminal of each container. You can navigate fills, check config files, envorinoment... ETC. type exit to get out.
