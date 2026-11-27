# ddtFoam on top of the OpenFOAM 2.1.x arm64 image
ARG BASE=ghcr.io/rezamarzban/openfoam211:latest
FROM ${BASE}

# $WM_PROJECT_USER_DIR = $HOME/OpenFOAM/$USER-2.1.x  ->  /root/OpenFOAM/root-2.1.x
ENV USER=root
SHELL ["/bin/bash", "--rcfile", "/etc/bash.bashrc", "-ci"]

RUN mkdir -p $WM_PROJECT_USER_DIR && cd $WM_PROJECT_USER_DIR \
    && git clone https://git.code.sf.net/p/ddtfoam/code ddtfoam-code \
    && cd ddtfoam-code \
    && (./Allwmake 2>&1 | tee /opt/ddtfoam-build.log | tail -40); \
    ls $FOAM_USER_APPBIN 2>/dev/null | grep -q . || (echo "DDTFOAM BUILD FAILED"; tail -80 /opt/ddtfoam-build.log; exit 1)

SHELL ["/bin/sh", "-c"]
WORKDIR /root/OpenFOAM/root-2.1.x/ddtfoam-code
CMD ["/bin/bash", "--rcfile", "/etc/bash.bashrc"]
