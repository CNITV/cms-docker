#!/bin/bash -e

name() {
	n="$(printf "%02d" "$1")"
	echo $n*
}

echo "Initializing cms..." >&2

total="$(ls ./scripts | wc -l)"
test ! -e /tasks && mkdir /tasks

last="$(ls /tasks | wc -l)"

if [ $last -eq $total ]; then
	echo "Already initialized." >&2
else
	cd ./scripts
	for i in $(seq $((last + 1)) $total); do
		echo "!!! Running $(echo $(name $i))" >&2
		source ./$(name $i) >&2
		:> /tasks/$i
	done
	echo "Initialization complete." >&2
fi

echo "Starting services..." >&2
cmsResourceService -a
