#!/usr/bin/bash
# @ Author: Lucas Glasner (lgvivanco96@gmail.com)
# @ Create Time: 2012-07-25 14:20:37
# @ Modified by: Lucas Glasner, 
# @ Modified time: 2024-01-22 17:45:57
# @ Description:
# @ Dependencies:
#       UNIX: tree, tr, column, grep, etc 

pname=PROJECT
tdir=$1
odir=$2
t_extensions=".doc .prj .hdf .xls .dwg .dxf .xlsx .docx .xlsx .jpg .png .tif .tiff .shp .nc .py .ipynb .sh .txt .md"
# ---------------------------------------------------------------------------- #
echo Target directory: "'$tdir'" 
cd $tdir
if test -d "$tdir"; then
    treename="$odir"/${pname}_tree
    if test -f "$treename.tree"; then
        :
    else
        echo Scrapping "$tdir" tree ...
        tree -fF "$tdir" &> $treename.tree
        tree -ifF --du "$tdir" &> ${treename}_files.csv
    fi
    echo ''

    ttail=$(tail -n 1 $treename.tree | sed 's/[[:alpha:][:blank:]]//g')
    ndir=$(echo $ttail  | awk -F',' '{print $1}')
    nfiles=$(echo $ttail | awk -F',' '{print $2}')
    printf "Statistics\n---\n" | column -t -s ":"
    printf "N°Directories:$ndir\nN°Files:$nfiles" | column -t -s ":"
    echo '---'
    for ext in $t_extensions; do
        output=$odir/T-${ext//.}.csv
        findings=$(cat ${treename}_files.csv | grep $ext)
        echo "$findings" | awk '$1=$1' | cut -c 2- | column -t -s']' | \
        sort -nk1 -r &> $output 

        if [ -s $output ]; then
            :
        else
            rm -f $output
        fi

        nextf=$(echo "$findings" | wc -l)
        nextf=$(($nextf-1))
        printf "N° ${ext} files:$nextf:" | column -t -s ":"
    done
    echo '---'


else
    echo "$tdir": No such file or directory
    exit
fi
touch $odir/STATS.txt
echo ''
echo Done
exit