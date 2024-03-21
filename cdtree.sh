#!/usr/bin/bash
# @ Author: Lucas Glasner (lgvivanco96@gmail.com)
# @ Create Time: 2012-07-25 14:20:37
# @ Modified by: Lucas Glasner, 
# @ Modified time: 2024-01-22 17:45:57
# @ Description:
# @ Dependencies:
#       UNIX: tree, tr, column, grep, etc 

if test -d "$2"; then
    :
else
    mkdir "$2"
fi
bash remotedir_stats.sh $1 $2 > $2/STATS.txt