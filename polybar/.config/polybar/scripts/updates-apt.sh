#!/bin/bash

((updates=$(apt list --upgradable 2> /dev/null | wc -l)-1))

if [ "$updates" -gt 0 ]; then
    echo " $updates"
else
    echo ""
fi
