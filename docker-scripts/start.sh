#!/bin/bash

aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 786014450157.dkr.ecr.ca-central-1.amazonaws.com

docker pull 786014450157.dkr.ecr.ca-central-1.amazonaws.com/frontend:latest

docker run --env-file /opt/devops-monitoring/frontend/.env -dit -p 4000:4000 --restart on-failure:5 --name frontend 786014450157.dkr.ecr.ca-central-1.amazonaws.com/frontend:latest