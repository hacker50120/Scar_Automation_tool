#!/bin/bash
#removing Scar tool script
rm scar-*
#Define some imp variables
i=1
temp_pass=$(cat .temp_password.sh)
frag=2
sleep_time=250

BLINK='\e[5m'
BOLD='\e[1m'
GREEN='\e[92m'
YELLOW='\e[93m'
CYAN='\e[96m'
RESET='\e[0m'
RED='\e[31m'
UNDERLINE='\e[4m'
PURPLE='\e[95m'
BLUE="\e[94m"

logo(){
	echo -e """ ${BOLD}${YELLOW} 	 
					       ${RESET} ${BOLD}${GREEN}	          
 __                    _         _                        _   _             
  ██████ ▄████▄  ▄▄▄      ██▀███      ▄▄▄      █    ██▄▄▄█████▓▒█████  ███▄ ▄███▓▄▄▄    ▄▄▄█████▓██▓▒█████  ███▄    █ 
▒██    ▒▒██▀ ▀█ ▒████▄   ▓██ ▒ ██▒   ▒████▄    ██  ▓██▓  ██▒ ▓▒██▒  ██▓██▒▀█▀ ██▒████▄  ▓  ██▒ ▓▓██▒██▒  ██▒██ ▀█   █ 
░ ▓██▄  ▒▓█    ▄▒██  ▀█▄ ▓██ ░▄█ ▒   ▒██  ▀█▄ ▓██  ▒██▒ ▓██░ ▒▒██░  ██▓██    ▓██▒██  ▀█▄▒ ▓██░ ▒▒██▒██░  ██▓██  ▀█ ██▒
  ▒   ██▒▓▓▄ ▄██░██▄▄▄▄██▒██▀▀█▄     ░██▄▄▄▄██▓▓█  ░██░ ▓██▓ ░▒██   ██▒██    ▒██░██▄▄▄▄█░ ▓██▓ ░░██▒██   ██▓██▒  ▐▌██▒
▒██████▒▒ ▓███▀ ░▓█   ▓██░██▓ ▒██▒    ▓█   ▓██▒▒█████▓  ▒██▒ ░░ ████▓▒▒██▒   ░██▒▓█   ▓██▒▒██▒ ░░██░ ████▓▒▒██░   ▓██░
▒ ▒▓▒ ▒ ░ ░▒ ▒  ░▒▒   ▓▒█░ ▒▓ ░▒▓░    ▒▒   ▓▒█░▒▓▒ ▒ ▒  ▒ ░░  ░ ▒░▒░▒░░ ▒░   ░  ░▒▒   ▓▒█░▒ ░░  ░▓ ░ ▒░▒░▒░░ ▒░   ▒ ▒ 
░ ░▒  ░ ░ ░  ▒    ▒   ▒▒ ░ ░▒ ░ ▒░     ▒   ▒▒ ░░▒░ ░ ░    ░     ░ ▒ ▒░░  ░      ░ ▒   ▒▒ ░  ░    ▒ ░ ░ ▒ ▒░░ ░░   ░ ▒░
░  ░  ░ ░         ░   ▒    ░░   ░      ░   ▒   ░░░ ░ ░  ░     ░ ░ ░ ▒ ░      ░    ░   ▒   ░      ▒ ░ ░ ░ ▒    ░   ░ ░ 
      ░ ░ ░           ░  ░  ░              ░  ░  ░                ░ ░        ░        ░  ░       ░     ░ ░          ░ 
        ░       
        							${RESET}${BOLD}${CYAN}Developed By | Security Eng. Abhishek Kanaujia${RESET}	


""" 

}

logo


while true;do
	echo -e "\n"
	echo -e "${GREEN}Welcome to the Scar Automation Tool${RESET}"
	echo -e "Press ${CYAN}1${RESET} to save the temporary password"
	echo -e "Press ${CYAN}2${RESET} to install necessary tool "
	echo -e "Press ${CYAN}3${RESET} to CIDR Range Scan"
	echo -e "Press ${CYAN}4${RESET} to Advanced Nmap with Single IP Scan"
	echo -e "Press ${CYAN}5${RESET} to Nmap with Range Scan"
	echo -e "Press ${CYAN}6${RESET} to remove the installed tools"
	echo -e "Press ${CYAN}7${RESET} to run Nmap on Found CIDR IPs"
	echo -e "Press ${CYAN}0 | [Ctr+ C]${RESET} to Exit \n"
	
	read -p "Enter your Choise Please: " test
	echo -e "\n"


	#For Dated-Result
	date=$(date +'%e-%B-%T')

	#touch test.sh 

	#Saving temp Pass
	password(){
		read -p "Please Enter your Password" pass
		echo "$pass" > .temp_password.sh
		temp_pass=$pass
		echo "temp_password is: $temp_pass"
		# sudo -i < echo "$pass"
	}

	Automation(){
		echo "Test"
		#one time running with terminator:
		#terminator -x "echo Apple@123 | sudo -S nmap -A -sV -sC -Pn -T4 -vv -sS -p- $i -oN $output_dir; sh"
		#terminator -x "cat .temp_password.sh | sudo -S sudo $1 ;bash"
	}


	check_command () {
	    	command -v "$1" >/dev/null
	}

	#Some Basic Tools Installation
	installation_tool(){

		#nano installation
		if ! check_command nano; then
		    echo "Installing nano"
			sudo apt-get install nano
		else
		    echo  "[NANO IS ALREADY INSTALLED]"
		fi

		#Terminator installation
		if ! check_command terminator; then
		    echo "Installing terminator"
		    sudo add-apt-repository ppa:gnome-terminator
			sudo apt-get update
			sudo apt-get install terminator
		else
		    echo  "[TERMINATOR IS ALREADY INSTALLED]"
		fi

		#Nmap
		if ! check_command nmap; then
		    echo "Installing nmap"
		    sudo apt-get install nmap
		else
		    echo  "[NMAP IS ALREADY INSTALLED]"
		fi

		#Angry Ip Scanner
		if ! check_command ipscan; then
		    echo "Installing Ipscanner"
			wget 'https://github.com/angryip/ipscan/releases/download/3.7.6/ipscan_3.7.6_amd64.deb'
		  	terminator -x "cat .temp_password.sh | sudo -S sudo dpkg -i ipscan_3.7.6_amd64.deb ;bash | exit"
		 	rm ipscan_3.7.6_amd64.deb
		else
		    echo  "[Ipscanner IS ALREADY INSTALLED]"
		fi

		#linpeas Installation
		FILE=linpe.sh
		if [[ -f "$FILE" ]]; then
		    echo "$FILE exists."
		else
			curl https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/linPEAS/linpeas.sh > linpe.sh
			terminator -x "cat $temp_pass | sudo -S sudo chmod +x linpe.sh ;bash | exit"
		fi

	}

	#For Removing all the Installed Tools
	removing_tool(){
		echo "Removing the tools"
		#for Terminator 
		#sudo apt remove terminator
	}

	#For Angry Ip-Scanner
	tool_run_ipscan(){
		echo -e "Following range will be like: <Start IP> <End IP> | 192.168.1.1 192.168.1.255 \n"
		read -p "Please enter Starting range of IP: " start
		read -p "Please enter End range of IP: " end
		#regex to check the correct IP Address
		ip=1.2.3.4
		if ( expr "$start" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null; ) && ( expr "$end" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null ); then
		  	# echo "success"
			ipscan -s -q -f:range $start $end -o ipscan_result_${date}.txt
			cat ipscan_result_${date}.txt | awk 'NR > 7 { print }' | grep -i 'ms' | awk '{print $1}' > Live_CIDR_running_IP.txt
		else
		  echo "Please Enter the Correct IP Address...!"
		  echo "You have Entered Wrong Ip Addr: [$start] & [$end]"
		fi
		
	}

	tool_run_nmap_for_found_CIDR(){
		echo "Your CIDR IP Address:"
		cat Live_CIDR_running_IP.txt
		echo "Default no of fragment/threshold to run the scan: " 
		frag=3
		echo "Default sleep time for the scan: " 
		sleep_time=250
		
		k=$(cat Live_CIDR_running_IP.txt | wc -l)
		k=$((k+1))
		count=0  
		for i in $(cat Live_CIDR_running_IP.txt)
		do 
			terminator -x "echo $temp_pass | sudo -S nmap -A -sV -sC -Pn -T4 -vv -sS $i -oN nmap_CIDR_$i.txt; sh"

			if [ $(( $count % $frag )) -eq 0 ];then
				echo "sleeping for $sleep_time seconds"
				sleep $sleep_time
			fi	
			count=$((count+1))
		done

	}

	

	#For Nmap Single IP | host
	tool_run_nmap_advanced(){
		read -p "Please enter the IP | Host name: " start	
		  	terminator -x "echo $temp_pass | sudo -S nmap -A -sV -sC -Pn -T4 -vv -sS -p- $start -oN nmap_Advanced_$date.txt; sh"
			#ipscan -s -q -f:range $start $end -o ipscan_result_${date}.txt

	}

	#For Nmap Ranges IP
	tool_run_nmap_range(){
		echo "Please enter all the IP Address:"
		nano .ip_ranges.txt
		read -p "Please Enter the no of fragment/threshold to run the scan: " frag
		read -p "Please Enter the sleep time for the scan: " sleep_time
		
		k=$(cat .ip_ranges.txt | wc -l)
		k=$((k+1))
		count=0  
		for i in $(cat .ip_ranges.txt)
		do 
			terminator -x "echo $temp_pass | sudo -S nmap -A -sV -sC -Pn -T4 -vv -sS $i -oN nmap_Advanced_$i.txt; sh"

			if [ $(( $count % $frag )) -eq 0 ];then
				echo "sleeping for $sleep_time seconds"
				sleep $sleep_time
			fi	
			count=$((count+1))
		done

	}


	#Switch Statements for Controling Loop
	case $test in

	  1 ) password	;;
      
      2 ) installation_tool	;;
      
      3 ) tool_run_ipscan	;;
      
      4 ) tool_run_nmap_advanced	;;
      
      5 ) tool_run_nmap_range	;;
      
      6 ) removing_tool	;;
	
	  7 ) tool_run_nmap_for_found_CIDR	;;
		
	  0 ) echo -e "${RED}Thanks for using..${RESET}"; break	;;

	  *) 	i=$((i+1))
			if [ $i == 5 ] ;then 
				echo -e "${RED}You have exceed your limit..!${RESET}"
				exit 
			else 
				echo  "Please Choose Valid one!" ;fi
			echo $i 	
	esac	

done
