#!/bin/bash -e

export BRANCH=master
export IMAGE_NAME=drydock/u16javall
export RES_DOCKER_CREDS=docker-creds
export RES_REPO=u16javall-repo
export RES_IMAGE=u16javall-img
export UP_IMAGE=u16all-img

findUpstreamBaseVersion() {
  echo "Find Latest Version for" $UP_IMAGE
  export versionName=$(cat ./IN/$UP_IMAGE/version.json | jq -r '.version.versionName')
  echo "Completed find Latest Version for" $UP_IMAGE
}

dockerLogin() {
  echo "Extracting docker creds"
  . ./IN/$RES_DOCKER_CREDS/integration.env
  echo "logging into Docker with username" $username
  docker login -u $username -p $password -e $email
  echo "Completed Docker login"
}

checkIfTagBuild() {
  echo "Check Tag Version for" $RES_REPO
  export IS_GIT_TAG=$(cat ./IN/$RES_REPO/version.json | jq -r '.version.propertyBag.shaData.isGitTag')

  if [ "$IS_GIT_TAG" = true ]; then
    echo "This is a TAG build"
    export GIT_TAG=$(cat ./IN/$RES_REPO/version.json | jq -r '.version.propertyBag.shaData.gitTagName')
    export GIT_TAG_MSG=$(cat ./IN/$RES_REPO/version.json | jq -r '.version.propertyBag.shaData.gitTagMessage')
    echo "Tag Name: " $GIT_TAG
    echo "Tag Message: " $GIT_TAG_MSG
  fi
  echo "Completed check for Tag, GIT_TAG: " $GIT_TAG
}

createImage() {
  if [ "$IS_GIT_TAG" = true ]; then
    echo "Pulling " $IMAGE_NAME:tip
    sudo docker pull $IMAGE_NAME:tip
    sudo docker tag -f $IMAGE_NAME:tip $IMAGE_NAME:$GIT_TAG
    #sudo docker tag -f $IMAGE_NAME:tip $IMAGE_NAME:prod
  else
    echo "Starting Docker build for" $IMAGE_NAME:tip
    cd ./IN/$RES_REPO/gitRepo
    sed -i "s/{{%TAG%}}/$versionName/g" Dockerfile
    sudo docker build -t=$IMAGE_NAME:tip .
    echo "Completed Docker build for" $IMAGE_NAME:$GIT_TAG
  fi
}

dockerPush() {
  if [ "$IS_GIT_TAG" = true ];
  then
    echo "Pushing Tag " $IMAGE_NAME:prod
    sudo docker push $IMAGE_NAME:$GIT_TAG
    #sudo docker push -f $IMAGE_NAME:prod
    echo "Completed Pushing Tag" $IMAGE_NAME:prod
  else
    echo "Pushing Tag " $IMAGE_NAME:tip
    sudo docker push $IMAGE_NAME:tip
    echo "Completed Pushing Tag" $IMAGE_NAME:tip
  fi
}

createOutState() {
  # this is to make sure we don't trigger if tag build happens
  if [ "$IS_GIT_TAG" = true ]; then
    echo "Creating a state file for" $RES_IMAGE
    echo versionName=$GIT_TAG > /build/state/$RES_IMAGE.env
    cat /build/state/$RES_IMAGE.env
    echo "Completed creating a state file for" $RES_IMAGE
  fi
}

main() {
  findUpstreamBaseVersion
  dockerLogin
  checkIfTagBuild
  createImage
  dockerPush
  createOutState
}

main
