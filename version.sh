#!/bin/bash

echo "$(gn --version | sed 's/[^(]*(\(.*\))/\1/g')" > version;