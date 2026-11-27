# ddtfoam-arm64

[ddtFoam](https://sourceforge.net/p/ddtfoam/code/) (DDT / detonation solver for OpenFOAM 2.1.x)
compiled for ARM64 on top of `ghcr.io/<your-username>/openfoam211` (see the openfoam211-arm64 repo).

## Build
Actions tab -> `build-ddtfoam-arm64` -> Run workflow. Image: `ghcr.io/rezamarzban/ddtfoam:latest`
(set the package to Public). Build log inside the image: `/opt/ddtfoam-build.log`.

## Use
```
podman pull ghcr.io/rezamarzban/ddtfoam:latest
podman run -it --rm -v $HOME/work:/work ghcr.io/rezamarzban/ddtfoam:latest
```
Source is in `/root/OpenFOAM/root-2.1.x/ddtfoam-code`; edit and rebuild with `wmake` / `./Allwmake`.
