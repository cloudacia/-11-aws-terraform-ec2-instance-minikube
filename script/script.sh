#!/bin/bash

###############################################
# Install Kubectl                             #
###############################################
function InstallKubectl(){
  google_repo="https://storage.googleapis.com/kubernetes-release/release"
  local_path="/bin/linux/amd64/kubectl"

  curl -LO "$google_repo"/`curl -s "$google_repo"/stable.txt`"$local_path"
  chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin/kubectl
}

###############################################
# Install Docker Daemon                       #
###############################################
function InstallDocker(){
  sudo apt-get update &&
  sudo apt-get install docker.io -y
}

###############################################
# Install Minikube dependencies               #
###############################################
function InstallDepencencies(){
  sudo apt-get install -y conntrack
}

###############################################
# Install Minikube                            #
###############################################
function InstallMinikube(){
  google_path="https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
  local_path="/usr/local/bin/"

  curl -Lo minikube "$google_path"
  chmod +x minikube
  sudo mv minikube $local_path
}

###############################################
# Install Start Minikube                      #
###############################################
function StartMinikube(){
  sudo minikube start --vm-driver=none
}

##################
# Script worflow #
##################

InstallKubectl
InstallDocker
InstallDepencencies
InstallMinikube
StartMinikube
