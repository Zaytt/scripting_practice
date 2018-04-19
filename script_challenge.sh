#!/bin/bash

NAME=ivan-chavez-backups
CURRENT_DATE=$(date "+%m-%d-%Y")
BUCKETNAME="$CURRENT_DATE-$NAME"
echo "Creating bucket: $BUCKETNAME:"

aws s3 mb s3://$BUCKETNAME

cd /Users/ivan/Documents/CodingNomads/scripts/

echo "Copying files to AWS S3 - $BUCKETNAME"

aws s3 cp /User/ivan/Documents/CodingNomads/scripts/scripting_challenge  s3://$BUCKETNAME/ --recursive --exclude "*" --include "*.jpg" --include "*.txt"

echo "AWS S3 transfer complete."

echo "Deleting files of current directory..."
rm -rf  /Users/ivan/Documents/CodingNomads/scripts/scripting_challenge/

echo "Creating new directory $CURRENT_DATE..."

mkdir /Users/ivan/Documents/CodingNomads/scripts/$CURRENT_DATE

echo "Moving into new directory..."

cd /Users/ivan/Documents/CodingNomads/scripts/$CURRENT_DATE

echo "Copying files from AWS S3://$BUCKETNAME to local directory $CURRENT_DATE" 

aws s3 cp  s3://$BUCKET_NAME . --recursive

echo "Transfer complete."

echo "END OF SCRIPT"




