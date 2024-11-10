#!/bin/bash

if [[ ! $(pidof wlogout) ]]; then
	wlogout --buttons-per-row 3 \
		--column-spacing 50 \
		--row-spacing 50 \
		--margin-top 290 \
		--margin-bottom 290 \
		--margin-left 300 \
		--margin-right 300
else
	pkill wlogout
fi
