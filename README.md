# ph10-dev
Scripts involving the Polar H10 Heart Rate Monitor
//Morris Lee
//Ubuntu Terminal, Polar H10
//Display Real Time Heart Rate Data from manual bluetooth connection

//Lists devices
$ sudo hcitool dev

//Runs BluetoothLE Scan for devices in range
$ sudo hcitool -i hcil lescan
//ctrl+C to stop scan

$ sudo gatttool -t random -b <DEVICE_MAC> -I
	//connects to device
	> Connect

	//lists services 
	> primary

	//Battery Serivce
	> char-desc 0x003f 0x0042
	> char-read-hnd 0x0042

	//Heart Rate
	> char-desc 0x000e 0x0013
	> char-write-req 0x0011 0100
	//to turn off notifications
	> char-write-req 0x0011 0000

//output into external doc
$ <COMMAND> > output1.txt
$ <COMMAND> >> output2.txt

$ script
$ <NAME> > text
<YOUR_TEXT_HERE>
$ exit



//POTENTIAL ERRORS

//removes and unpairs device to restart process
$ bluetoothctl
	# devices
	# remove <DEVICE_MAC>
	# quit
$ sudo service bluetooth restart

//Disconnected
Command Failed: Disconnected
	>Connect
	//Simply connect again

//Scan Parameters Failed
Set scan parameters failed: Input/output error
	hciconfig hci0 down
	hciconfig hci0 up
	//or if it doesn't work
	service bluetooth restart
	service dbus restart


//Connection Refusal
Error connect: Connection refused (111)
	copy the following into /etc/bluetooth/main.conf
	
		EnableLE = true		//enables LE support as default is false
		AttributeServer = true	//enable the GATT attribute server as default is false
		DisablePlugins = pnat

//Glib warning
(gatttool:2404): Glib-WARNING **: Invalid file descriptor.
	$ sudo hciconfig <ADAPTER> up 	//<ADAPTER> is default hci0
	$ hcitool
	$ hciconfig hci0 piscan

//Device Busy
Error: connect: Device or Resource busy (16)
