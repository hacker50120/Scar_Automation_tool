#!/bin/bash

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

install(){
		#Terminator installation
		if ! check_command terminator; then
		    echo "Installing terminator"
		    #sudo add-apt-repository ppa:gnome-terminator
			#sudo apt-get update
			sudo apt-get install terminator
		else
		    echo  "[TERMINATOR IS ALREADY INSTALLED]"
		fi
}

download_tool(){
	curl http://161.117.85.147/tool/scar-tool --output scar-tool	
}

run(){
	read -sp "Please enter the password to run the Automation Tool: " passd

	cat scar-tool | openssl aes-256-cbc -pbkdf2 -d -a -pass pass:$passd > scar-tool.sh
	chmod +x scar-tool.sh
	./scar-tool.sh
	rm scar-*
}


install
download_tool
run
