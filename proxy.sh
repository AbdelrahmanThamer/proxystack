ENV_BRANCH="master"
ENV_MONOREPO="traefik_stack5"

# On play-with-docker, install common apps
apk update && apk upgrade && apk add --no-cache               \
    nano bash git curl wget unzip openssl tar ca-certificates && \
rm -rf /var/cache/apk/* /tmp*                                 && \
docker swarm init --advertise-addr $(hostname -i)             && \
git clone https://github.com/pascalandy/docker-stack-this.git && \
cd docker-stack-this                                          && \
git checkout ${ENV_BRANCH}                                    && \
cd ${ENV_MONOREPO}                                            && \
./runup.sh;