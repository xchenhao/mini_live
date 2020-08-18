#!/bin/sh
git diff HEAD^ HEAD --name-only | xargs tar -rf update.tar
