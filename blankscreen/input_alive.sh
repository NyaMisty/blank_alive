#!/bin/sh

#set -x 
cd "$(dirname "$0")"
cycript -p backboardd input_alive.cy
