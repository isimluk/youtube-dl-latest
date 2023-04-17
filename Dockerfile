FROM fedora:latest

RUN dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
 && dnf install -y ffmpeg \
 && dnf install -y python3-pip git \
 && pip3 install git+https://github.com/ytdl-org/youtube-dl \
 && dnf history undo last -y \
 && dnf clean all
WORKDIR /wdir

ENTRYPOINT [ "youtube-dl" ]
