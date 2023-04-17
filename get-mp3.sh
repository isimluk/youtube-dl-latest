#!/bin/bash

set -e -o pipefail

podman build -t latest-youtube-dl .
podman run -it --rm \
	-v $(pwd):/wdir \
	latest-youtube-dl \
	--extract-audio --audio-format mp3 $@
