#!/bin/bash

for run in {1..5}
do
  status=$(curl -I -s -o /dev/null -w "%{http_code}" http://www.bbc.com)
  if [ $status -eq '200' ]; then
    echo "status OK"
    exit 0
  fi
  echo "Status code was ${status} retrying ${run}"
  sleep 5
done
echo "failed to reach server"
exit 1
