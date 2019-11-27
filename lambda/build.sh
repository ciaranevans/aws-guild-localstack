#!/bin/sh

mkdir ./deps
cp guild-function.py ./deps
cd ./deps
zip -qr guild-function.zip .
mv guild-function.zip ../guild-function.zip
rm -rf ./deps
