#!/bin/bash

function listDirectoriesSize {
	for FILE in `ls -la`
	do
		if test -d $FILE; then 
			du -cksh $FILE
		fi
	done
}

echo "Computing sizes..."
listDirectoriesSize | sort -n | grep -v total 
