#!/bin/bash
#
# slogger purpose is to timetrack your day
# via CLI
#
# usage: 
#	>slogger.sh write whatever you want
# be careful with special symbols in arguments (string after slogger.sh), 
# I'll fix it later
#

#import config
source slogger.conf

function add_2history {
	echo -e "\n${time}\n${*}\n" >> $history
}

function update {
	echo $today > $day_flag
	echo -e "---\n$today" >> $history
}

time=`date "+%H:%M"`
today=`date "+%D"`

#checking history file status
if [ ! -f $history ];
then
	touch $history
fi

#checking date change
if [ -f $day_flag ];
then
	if [ `cat $day_flag` != $today ];
	then
		update
	fi
else
	update
fi

#add to history file all of arguments
add_2history $*
