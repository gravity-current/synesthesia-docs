#!/usr/bin/env bash
#
while getopts e:t:p: flag
do
    case "${flag}" in
        t) tag=${OPTARG};;
        p) push=${OPTARG};;
    esac
done

if [ -z "$tag" ]; then
  echo "Must add tag with -t" 1>&2
  exit 1
fi

image=docs:$tag

docker buildx build --platform linux/amd64 -f Dockerfile -t "registry.digitalocean.com/syn/$image" . --push

# echo "Built image. Run the image locally with command 'docker run --rm --name docs -p 9000:8000 -it $image' and access it at 'http://localhost:9000/docs/'"
