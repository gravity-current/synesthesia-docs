# see https://hub.docker.com/r/squidfunk/mkdocs-material/tags
FROM squidfunk/mkdocs-material AS base

WORKDIR /docs/

# copy files from local repo
COPY ./package.json ./package.json

# install dependencies
RUN pip3 install mkdocs-video \
	&& apk add --update nodejs npm zip bash \
	&& npm install

# copy code/docs after installing dependencies to improve
# build cache performance.
COPY ./docs ./docs
COPY ./server ./server
COPY ./mkdocs.yml ./mkdocs.yml
COPY ./build-docs.sh ./build-docs.sh

# build the docs
RUN chmod +x ./build-docs.sh \
	&& bash ./build-docs.sh

FROM node:20-alpine AS deploy

WORKDIR /docs/

# Copy built docs and runtime dependencies (server/node_modules).
# Ignore build time tools.
COPY --from=base /docs/build ./build
COPY --from=base /docs/server ./server
COPY --from=base /docs/node_modules ./node_modules
# uncomment to hang and debug the image
# ENTRYPOINT [ "tail", "-f", "/dev/null" ]

# run the express server
ENTRYPOINT ["node"]
CMD ["server/app.js"]
