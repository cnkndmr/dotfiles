#!/bin/sh
for i in $(seq 2 9)
do
	i3-msg workspace "$i"
	i3-msg move workspace to output left
done
