#!/bin/bash
# Recommend syntax for setting an infinite while loop
while :
do
	ssh -v -N -R 12345:localhost:22 simon@elisya.org
	sleep 2
done

