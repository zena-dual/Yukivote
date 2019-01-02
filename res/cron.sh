#!/bin/bash

count=`ps aux | grep main.py | grep -vE '(grep|engine)' | wc -l`

if [ ${count} = 0 ] ; then
  source ../venv/bin/activate
  cd ../src
  python3 ./main.py
fi
