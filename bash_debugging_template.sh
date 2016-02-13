#!/bin/bash
#
# Template for debugging bash scripts
#


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ++++++ ENVIROMENT ++++++++++++++++++++++++++++++++++++++++
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# set debug mode
readonly DEBUG=1

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ++++++ DECLARATIONS ++++++++++++++++++++++++++++++++++++++
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# Set working directory use actual directory
readonly WORKDIR=$(pwd)

# get scriptname and remove dir part
readonly SCRIPTNAME_WITH_EXTENTION=${0##*/} 

# remove extension from scriptname
readonly SCRIPTNAME=${SCRIPTNAME_WITH_EXTENTION%.*} 

# set logfile name with daily suffix  
readonly LOGFILE=${WORKDIR}/${SCRIPTNAME}$(date +'_%Y_%m_%d').log 

# set working file name for multiple run prevention
# use scriptname with _working suffix
readonly WORKING_FILE=${WORKDIR}/.${SCRIPTNAME}_working

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ++++++ FUNCTIONS +++++++++++++++++++++++++++++++++++++++++
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# debug printig
#
# Parameter:
# $1 string which is printed with timestamp in debug mode
#
# Info:
# 1. if global DEBUG is 1 print debug message
# 2. if global DEBUG is 0 do nothing
#
function decho(){

local STRING=$1

if [ $DEBUG -eq 1 ]
	then :
	echo -e "$(date '+%F %T'): ${STRING}"
	echo -e "$(date '+%F %T'): ${STRING}" >>${LOGFILE}
fi

unset STRING
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ++++++ MAIN ++++++++++++++++++++++++++++++++++++++++++++++
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# debug print
decho "This is a debug message"

echo "This is a normal message"
