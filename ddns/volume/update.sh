#!/bin/bash

while true; do

	wget -O /config/dynulog -4 $DDNS_URL

	sleep 3600

done
