#!/bin/bash
set -x


# Use bash scripting, AWS CLI and jq.
# The CSV file should contain EC2 instance ID, image ID and state of EC2 i.e. Running, Stopped etc.


# aws ec2 describe-instances --region us-east-1 --output json | jq '.Reservations'
# aws ec2 describe-instances --region us-east-1 --output json | jq '.Reservations' | jq -r '.[].Instances[] | .ImageId + " " + .InstanceId'

aws ec2 describe-instances --region $1 --output json | jq '.Reservations' | jq -r '.[].Instances[] | .ImageId + "," + .InstanceId +"," + .State.Name' > instance-report.csv

sed -i -e '1iImageId,InstanceId,InstanceState' instance-report.csv 