#!/system/bin/sh

TSP_INPUT="/sys/class/sec/tsp/enabled"
TSP_CMD="/sys/class/sec/tsp/cmd"

if [ -w "$TSP_INPUT" ]; then
	echo 1,0 > "$TSP_INPUT"
fi

if [ -w "$TSP_CMD" ]; then
	echo aot_enable,1 > "$TSP_CMD"
fi
