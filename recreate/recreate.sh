#!/bin/bash

PYTHON_VERSION=$1
if [ "$PYTHON_VERSION" == "" ]; then
    echo "Please specify the python version, i.e. run 'bash recreate.sh 3.13'  to run with python3.13"
    exit 1
fi

if ! uvx --help > /dev/null; then
    echo "please install uv, https://docs.astral.sh/uv/getting-started/installation/"
    exit 1
fi

echo PYTHON_VERSION="$PYTHON_VERSION"


echo "The terraform module 'crashtfparse' will cause a golang runtime panic and python will segfault."
echo "lets run it and see!"
sleep 2

uvx --with tfparse==0.6.15 --python  "$PYTHON_VERSION" python -c 'import tfparse; tfparse.load_from_path("crashestfparse")'


echo "was that a panic"? 

sleep 2

echo "this will be OK"

sleep 2

uvx --with tfparse==0.6.15 --python  "$PYTHON_VERSION" python -c 'import tfparse; print(tfparse.load_from_path("doesntcrashtfparse"))'

echo "that parsed OK, right"?


echo "what about the latest?"

echo "lets run it and see!"
sleep 2

echo "this crashed on 0.6.15, does it crash on 0.6.16"?
sleep 2
uvx --with tfparse==0.6.16 --python  "$PYTHON_VERSION" python -c 'import tfparse; tfparse.load_from_path("crashestfparse")'
echo "this was OK on 0.6.15, is it OK on 0.6.16"?
sleep 2
uvx --with tfparse==0.6.16 --python  "$PYTHON_VERSION" python -c 'import tfparse; print(tfparse.load_from_path("doesntcrashtfparse"))'

