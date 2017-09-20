#!/bin/bash

for item in update upgrade autoremove autoclean clean;
do
    sudo apt-get $item
done

