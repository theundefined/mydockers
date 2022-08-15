#!/bin/sh
docker build -t ssbuilder .
docker run -v "$(pwd)/build-amd64/":/build ssbuilder

