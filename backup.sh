#!/bin/bash

clear

DATE=$(date '+%Y%m%d.%H%M%S')
HOST=$(hostnamectl hostname)
LOGFILE=_$HOST.$DATE.log
BAKPATH=/home/$USER/tmp/$HOST.$DATE/
LZ4FILE=/home/$USER/tmp/$HOST.$DATE.tar.lz4
EXSTOREPATH=/run/media/$USER/backup/$HOST

# check if external drive is connected...
echo checking for external backup drive...
if ! [ -d /run/media/$USER/backup/ ]; then
    echo ERROR: external drive not connected...
    exit 1
else
    echo extenal backup drive found successfully...
fi

#check if we have rsync installed...
echo checking for rsync...
if ! test -f "/usr/bin/rsync"
then
    echo ERROR: please install rsync and try again...
    exit 1
else
    echo rsync found successfully...
fi

# check for ~/tmp/<hostname> folders
if ! [ -d $BAKPATH ]; then
    mkdir -p $BAKPATH
fi 

# start log file...
echo -$HOST-$DATE | tee $BAKPATH$LOGFILE

# backup /home/sysadm/data folder...
rsync -az --log-file=$BAKPATH$LOGFILE --exclude={'.git','.github','.vscode','node_modules','lost+found','.Trash*','debug','.venv','build','dist'} /home/sysadm/data $BAKPATH

# backup selected files/folders from /home/sysadm/...
rsync -az --log-file=$BAKPATH$LOGFILE --include={'.bashrc','.gitconfig','.gitmessage','.bash_aliases','.local/','.local/bin/***'} --exclude=* /home/sysadm/ $BAKPATH

echo -backup completed sucessfully... | tee -a $BAKPATH$LOGFILE

# compress the new folder to an LZ4 file...
tar -I lz4 -cf $LZ4FILE $BAKPATH

# move LZ4 file to external storage...
rsync $LZ4FILE $EXSTOREPATH

# verify LZ4 files before deleting local...
echo -verifying backup files...
lz4localsz=$(wc -c $LZ4FILE | awk '{print $1}')
lz4localln=$(wc -l $LZ4FILE | awk '{print $1}')
lz4extsz=$(wc -c $EXSTOREPATH/$HOST.$DATE.tar.lz4 | awk '{print $1}')
lz4extln=$(wc -l $EXSTOREPATH/$HOST.$DATE.tar.lz4 | awk '{print $1}')
if [ $lz4localsz -eq $lz4extsz ] && [ $lz4localln -eq $lz4extln ]
then
    echo -backup file moved successfully...
    echo -cleaning up local files...
    rm -rf /home/$USER/tmp/*
else
    echo -ERROR: backup files do not match!
    exit 2
fi

echo -backup process complete...

# MOVE BACKUP TO GCS
# echo MOVING backup to GCS...
# gsutil -q -m rsync -r tmp gs://hex50archive

# REMOVE local files
#sleep 15
#echo REMOVING local files
#rm -rf /home/sysadm/tmp/$HOST
#rm /home/sysadm/tmp/$HOST-$DATE-LOG.txt
