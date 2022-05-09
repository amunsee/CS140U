#!/bin/bash

todays_date=$(date +%Y-%m-%d)

to_backup=/home/alex/Desktop/hw
echo $to_backup "location"

backup_dest=/home/alex/Desktop/backup
echo $backup_dest "destination"

log=/home/alex/Desktop/backup/backup_log

echo $todays_date > $log

for file in $(find $to_backup -printf "%P\n"); do #for each file in the folder do below
   if [ -f $backup_dest/$file ] ; then #check if file already exists
      if [ $to_backup/$file -nt $backup_dest/$file ] ; then #if so check if anything changed
                  #if so then copy it over andd add to log
         cp -R ${to_backup}/${file} $backup_dest/$file #copy the file source to dest
	#add to the log now
	  echo "$to_backup/$file updated">> $log

       else  #just add to the log it wasnt added
	   echo "$to_backup/$file already up to date" >> $log
       fi
else
   #if file doesnt exist yet..
   cp -R ${to_backup}/${file} $backup_dest/$file #copy the file source to dest
   #add to log that the file was added
   echo "$to_backup/$file has been added to backup" >> $log
	#done
fi

done

echo "backup done"

