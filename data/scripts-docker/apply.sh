#!/usr/bin/env sh
echo Executing operation: terraform init
docker run --rm -i -v $4:$3 --workdir=$PWD -v /var/run/docker.sock:/var/run/docker.sock $2  init -no-color

echo Executing operation: terraform get
docker run --rm -i -v $4:$3 --workdir=$PWD -v /var/run/docker.sock:/var/run/docker.sock $2  get -no-color

echo Executing operation: terraform env new $1
docker run --rm -i -v $4:$3 --workdir=$PWD -v /var/run/docker.sock:/var/run/docker.sock $2  workspace new $1 -no-color

echo Executing operation: terraform env select $1
docker run --rm -i -v $4:$3 --workdir=$PWD -v /var/run/docker.sock:/var/run/docker.sock $2  workspace select $1 -no-color

echo Executing operation: terraform apply
docker run --rm -i -v $4:$3 --workdir=$PWD -v /var/run/docker.sock:/var/run/docker.sock $2 apply -no-color