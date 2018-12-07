#!/bin/sh

find . -name "*.retry" -type f -exec rm {} \;

#find . -name "*.swp" -type f -mtime +2 -exec rm {} \;

