#!/bin/bash
  
echo "starting backup procedure..."

current_time=$(date "+%Y.%m.%d-%H.%M.%S")
echo "Current Time : $current_time"

echo "starting mysqldump..."

filename=$"$current_time-stocktwits"

mysqldump --user= --password= StockTwits > /Users/ivan/Documents/CodingNomads/databases/dumps/$filename.sql

echo "mysqldump complete."

echo "starting s3 transfer..."

aws s3 cp /Users/ivan/Documents/CodingNomads/databases/dumps/$filename.sql s3://zaytt.test.bucket

echo "s3 transfer complete! backup can be found at s3://zaytt.test.bucket$filename.sql"

echo "complete."
