FROM fedora:latest

RUN dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
 && dnf install -y ffmpeg \
 && dnf install -y python3-pip git \
 && pip3 install -U --pre "yt-dlp[default]" \
 && dnf history undo last -y \
 && dnf clean all
WORKDIR /wdir

ENTRYPOINT [ "yt-dlp" ]
