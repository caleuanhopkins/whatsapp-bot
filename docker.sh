#! bin/bash

#docker run -v data:/root/.yowsup -it corrector/yowsup-docker demos --login 447482726437:6ZFwh408KwwAokNZdwAxn2qxBEY= --yowsup 
docker run -v data:/root/.yowsup corrector/yowsup-docker demos --login LOGIN:PASSWORD -s GROUP ID "message"