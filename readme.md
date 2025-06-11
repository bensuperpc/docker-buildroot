# docker-buildroot

## _Buildroot in docker_

Buildroot in a docker container.

## Table of contents

## Features

- Buildroot

## Requirements

### Software requirements

| Software | Minimum | Recommended |
| -------- | ------- | ----------- |
| Linux    | Any     | Any         |
| Docker   | 19.x    | 20.x        |
| Make     | 4.x     | 4.x         |

### Hardware requirements

|       Hardware        |  Minimum  |   Recommended    |
| :-------------------: | :-------: | :--------------: |
|          CPU          |   2c/2t   |      6c/12t      |
| Instruction set (x86) | x86-64-v2 |    x86-64-v3     |
| Instruction set (ARM) |   armv8   |      armv8       |
|          RAM          |   8 GB    |      32 GB       |
|          GPU          |     -     | Hardware enc/dec |
|      Disk space       |   4 GB    |      16 GB       |
|       Internet        |  10 Mbps  |     100 Mbps     |

## How to use docker-buildroot

Clone this repository

```bash
git clone --recurse-submodules https://github.com/bensuperpc/docker-buildroot.git
```

Now run the script to use docker-buildroot:

```bash
./docker-buildroot.sh
```

or with command line arguments:

```bash
./docker-buildroot.sh ls
```


## License

[MIT](LICENSE)
