# see https://hub.docker.com/r/squidfunk/mkdocs-material/tags
FROM squidfunk/mkdocs-material AS base

WORKDIR /docs/

# copy files from local repo
COPY ./docs ./docs
COPY ./server ./server
COPY ./mkdocs.yml ./mkdocs.yml
COPY ./build-docs.sh ./build-docs.sh
COPY ./package.json ./package.json

# install dependencies
RUN pip3 install mkdocs-video \
	&& apk add --update nodejs npm zip bash \
	&& npm install

# build the docs
RUN chmod +x ./build-docs.sh \
	&& bash ./build-docs.sh

# uncomment to hang and debug the image
# ENTRYPOINT [ "tail", "-f", "/dev/null" ]

# run the express server
ENTRYPOINT ["node"]
CMD ["server/app.js"]