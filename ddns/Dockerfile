FROM alpinelinux/docker-compose:latest

RUN apk update && apk upgrade && apk add wget && apk add bash

ENTRYPOINT ["/bin/bash"]
CMD ["/config/update.sh"]
