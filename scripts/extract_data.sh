#!/bin/bash

# raw csv files downloaded directly into Linux folder from https://divvy-tripdata.s3.amazonaws.com/index.html
# create destination safely
mkdir -p data/raw_csv

echo "Extracting zip files..."

for z in data/raw_zips/*.zip; do
  echo "Unzipping $z"
  unzip -n "$z" -d data/raw_csv
done

echo "Done extracting data."
