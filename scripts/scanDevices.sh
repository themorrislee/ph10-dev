#!/bin/bash

####Variables
TITLE="Scanning for Bluetooth Devices"
CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Last Updated on $(date +"%x %r %Z") by $USER"

####Functions
function listDevices()
{
	sudo hcitool dev
}

function scanforDevices()
{
	sudo hcitool -i hci1 lescan
}

function displayTitle()
{
	echo $TITLE "	" $CURRENT_TIME
	echo "System Uptime"
	uptime
	echo $TIME_STAMP
}

function displayNote()
{
	echo "Press Ctrl+C to terminate scanning"
}

####Main
displayTitle
listDevices
displayNote
scanforDevices
