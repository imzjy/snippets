#!/bin/bash

FFCMD='/cygdrive/c/work-dir/ffmpeg/ffmpeg.exe'  # path to ffmpe tools

#echo "$0"
#check output directory exist
if ! test -d $2;
then
  mkdir $2
fi

#convert flv to avi
for f in $(ls $1/*.flv);
do
  if test -f $f
  then
    echo -e "\nConverting $f"
    FILENAME=$(basename $f | cut -d '.' -f 1)
    #echo $FILENAME
    $FFCMD -i $f -r 25 -b 750k -y $FILENAME.avi 2>> log.txt
    mv -f $FILENAME.avi $2
  else
      echo -e "\nSkipping $f - not a regular file";
  fi
done  
