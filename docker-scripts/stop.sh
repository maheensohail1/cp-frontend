#!bin/bash

if [ $( docker ps -a | grep frontend | wc -l ) -gt 0 ]; then
  docker stop frontend
  docker rm frontend
  docker rmi 786014450157.dkr.ecr.ca-central-1.amazonaws.com/frontend:latest
fi

exit 0