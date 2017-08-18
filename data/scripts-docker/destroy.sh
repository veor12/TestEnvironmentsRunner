#!/usr/bin/env sh
echo Executing operation: terraform env select $1
docker run -i -v $PWD:/data --workdir=/data -v /var/run/docker.sock:/var/run/docker.sock $2  workspace select $1 -no-color

echo Executing operation: terraform destroy
docker run -i -v $PWD:/data --workdir=/data -v /var/run/docker.sock:/var/run/docker.sock $2 destroy -force -no-color

echo Executing operation: terraform env select default
docker run -i -v $PWD:/data --workdir=/data -v /var/run/docker.sock:/var/run/docker.sock $2  workspace select default -no-color

echo Executing operation: terraform env delete $1
docker run -i -v $PWD:/data --workdir=/data -v /var/run/docker.sock:/var/run/docker.sock $2  workspace delete $1 -no-color