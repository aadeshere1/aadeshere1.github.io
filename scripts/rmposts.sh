#!/bin/bash

count=`ls -1 *.md 2>/dev/null | wc -l`
if [ $count != 0 ]
then 
echo true
echo "Removing all md files"
rm *.md
fi 
