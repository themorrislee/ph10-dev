#!/bash/bin

####Variables
TITLE="Reading HR Characteristic"
CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Last Updated on $(date +"%x %r %Z") by $USER"

####Functions
function desc()
{
	sudo gatttool -t random -b D0:CC:52:23:AE:4D --char-desc 0x000e 0x0013	
}

function read()
{
	sudo gatttool -t random -b D0:CC:52:23:AE:4D --char-write-req 0x0011 0100
}

function displayTitle()
{
	echo $TITLE "	" $CURRENT_TIME
	echo "System Uptime"
	uptime
	echo $TIME_STAMP
}

####Main
displayTitle
desc
read
