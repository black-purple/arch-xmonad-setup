#!/bin/bash

killall conky
sleep 2s
		
conky -c $HOME/.config/conky/Enif/Enif.conf &> /dev/null &
