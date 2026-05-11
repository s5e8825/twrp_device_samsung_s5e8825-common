#!/system/bin/sh

TSP_INPUT="/sys/class/sec/tsp/enabled"

if [ -w "$TSP_INPUT" ]; then
	echo 2,1 > "$TSP_INPUT"
fi
