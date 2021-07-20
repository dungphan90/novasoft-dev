#!/bin/bash

USERNAME=$1
DOCKERHUBUSERNAME=$2

MOUNTSOURCE=${PWD}/novasoft
MOUNTTARGET=/home/${USERNAME}/novasoft

cp templates/Dockerfile-template Dockerfile
sed -i "s,username,${USERNAME},g" Dockerfile

cp templates/build.sh.template build.sh
sed -i "s,DOCKERHUBUSERNAME,${DOCKERHUBUSERNAME},g" build.sh

cp templates/run.sh.template run.sh
sed -i "s,DOCKERHUBUSERNAME,${DOCKERHUBUSERNAME},g" run.sh
sed -i "s,MOUNTSOURCE,${MOUNTSOURCE},g" run.sh
sed -i "s,MOUNTTARGET,${MOUNTTARGET},g" run.sh

cp templates/novasoft_mrb.sh.template novasoft/novasoft_mrb.sh
sed -i "s,username,${USERNAME},g" novasoft/novasoft_mrb.sh