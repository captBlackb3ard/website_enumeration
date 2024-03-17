#!/bin/bash

: "

 ██████ ██    ██ ██████  ███████ ██████  ███████ ███████  ██████  ██████  ██████  ██████  ████████    ██████  ██       █████   ██████ ██   ██ 
██       ██  ██  ██   ██ ██      ██   ██ ██      ██      ██      ██      ██    ██ ██   ██    ██       ██   ██ ██      ██   ██ ██      ██  ██  
██        ████   ██████  █████   ██████  ███████ █████   ██      ██      ██ ██ ██ ██████     ██       ██████  ██      ███████ ██      █████   
██         ██    ██   ██ ██      ██   ██      ██ ██      ██      ██      ██ ██ ██ ██         ██       ██   ██ ██      ██   ██ ██      ██  ██  
 ██████    ██    ██████  ███████ ██   ██ ███████ ███████  ██████  ██████  █ ████  ██         ██    ██ ██████  ███████ ██   ██  ██████ ██   ██ 

**********************************************************************************************************************************************
			            WEBSITE DIRSEARCH/FEREOXBUSTER/GOBUSTER/FFUF ENUMERATION SCRIPT
**********************************************************************************************************************************************
"
#https://hacklido.com/blog/452-directory-bruteforcing-on-web-server-automation-with-bash-scripting

#Script Variables

url=$1
wordlist=$2

#web_ext=".asp,.aspx,.cfm,.swf,.htm,.html,.shtml,.xhtml,.java,.jsp,.jspx,.pdf,.pl,.php,.phphtml,.php3,.php4,.py,.rb,.rhtml,.xml,.cgi,.dll"
ffuf_ext=".cgi,.html,.php,.py,.rb,.txt,.xml"
web_ext="cgi,html,php,py,rb,xml,txt"

# If website is not live exit
check_website() {
	local url=$1
	if ! curl -s --head $url >/dev/null;then
		#Website is not live - exit script
		echo "Website is not responding. Please check the domain or IP address."
		exit 1
	fi
	
	if wget --spider https://$url 2>/dev/null; then
		target="https://$url"
	else
		target="http://$url"
	fi
	echo "$target website live and active. Directory and file enumeration will proceed."
}

#Confirm website is live &  HTTP protocol
http=$(check_website $url)

if wget --spider https://$url 2>/dev/null; then
	target="https://$url"
else
	target="http://$url"
fi

#Check if dirsearch is installed
if [ ! -x "$(command -v dirsearch)" ]; then
   echo "[-] ffuf required to run script"
   exit 1
fi

#Check if Gobuster is installed
if [ ! -x "$(command -v gobuster)" ]; then
   echo "[-] ffuf required to run script"
   exit 1
fi

#Check if FFUF is installed
if [ ! -x "$(command -v ffuf)" ]; then
   echo "[-] ffuf required to run script"
   exit 1
fi
#Check if Feroxbuster is installed
#GitHub Repo: https://github.com/epi052/feroxbuster

if [ ! -x "$(command -v feroxbuster)" ]; then
   echo "[-] ffuf required to run script"
   exit 1
fi

#Check if Recon Directory and File Present; create if necessary
if [ ! -d "$url" ]; then
	mkdir $url
fi

if [ ! -d "$url/recon" ]; then
	mkdir $url/recon
fi

#Create files to store results
if [ ! -f "$url/recon/ffuf_enumeration.txt" ];then
	
	touch $url/recon/ffuf_enumeration.txt
	touch $url/recon/dirsearch_enumeration.txt
	touch $url/recon/gobuster_enumeration.txt
	touch $url/recon/feroxbuster_enumeration.txt
fi

#Required checks passed; proceed with enumeration

#Dirsearch Enumeration
echo "[+] Enumerating website with Dirsearch...."

if ! dirsearch -e $dirsearch_ext -w $wordlist -u "$target" -o $url/recon/dirsearch_enumeration.txt; then
	echo "An error occurred while running ffuf."
	exit 1
else
	echo "dirsearch completed successfully. Results stored in $url/recon/dirsearch_enumeration.txt."
fi


#Feroxbuster Enumeration
echo "[+] Enumerating website with Feroxbuster...."

if ! feroxbuster -x $web_ext --wordlist $wordlist --url "$target" -o $url/recon/feroxbuster_enumeration.txt; then
	echo "An error occurred while running Feroxbuster."
	exit 1
else
	echo "Feroxbuster completed successfully. Results stored in $url/recon/feroxbuster_enumeration.txt."
fi

#Gobuster Enumeration
echo "[+] Enumerating website with Gobuster...."

if ! gobuster dir -x $web_ext -w $wordlist --url "$target" -o $url/recon/gobuster_enumeration.txt --exclude-length 0; then
	echo "An error occurred while running Gobuster."
	exit 1
else
	echo "Gobuster completed successfully. Results stored in $url/recon/gobuster_enumeration.txt."
fi

#Ffuf Enumeration
echo "[+] Enumerating website with Ffuf...."

if ! ffuf -e $web_ext -w $wordlist -u "$target/FUZZ" >> $url/recon/ffuf_enumeration.txt; then
	echo "An error occurred while running ffuf."
	exit 1
else
	echo "ffuf completed successfully. Results stored in $url/recon/ffuf_enumeration.txt."
fi
