#!/bin/sh -xe

cp -a /src /build
cd /build
git clean -fdx || :

#cp -a /packages .
nuget restore

# test     
msbuild
nunit-console test/test.csproj

# build
cd conjur-api
msbuild \
  /property:DelaySign=true \
  /property:KeyOriginatorFile=/src/conjur-sn.pub \
  /property:Configuration=Release
