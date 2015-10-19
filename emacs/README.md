# Emacs 24 docker container

1. Based on Debain emacs24-lucid 
  * the emacs (without lucid) uses GTK and cuases issues with X11 and docker
1. It has my opionated emacs configuration in .emacs
1. It uses the emacs package mechanism 
  * see emacs.d for current list of pre-installed packages
1. By default it has a /workdir directory 
    * data-container and host volumes  may be mounted there or elsewhere
  
  
  
# Usage

## With GUI
```bash
docker run --rm \
  -e DISPLAY=${DISPLAY} \
  -v /tmp/.X11-unix:/tmp/.X11-unix  \
  -v /tmp/:/workdir \
  renzok/emacs
```



## On terminal
```bash
docker run --rm \
  -it
  -v /tmp/:/workdir \
  renzok/emacs
```
