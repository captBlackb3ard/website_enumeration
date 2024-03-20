                                                                                                                                        
# Basic Bash Website Enumeration Script
```

 ██████ ██    ██ ██████  ███████ ██████  ███████ ███████  ██████  ██████  ██████  ██████  ████████    ██████  ██       █████   ██████ ██   ██ 
██       ██  ██  ██   ██ ██      ██   ██ ██      ██      ██      ██      ██    ██ ██   ██    ██       ██   ██ ██      ██   ██ ██      ██  ██  
██        ████   ██████  █████   ██████  ███████ █████   ██      ██      ██ ██ ██ ██████     ██       ██████  ██      ███████ ██      █████   
██         ██    ██   ██ ██      ██   ██      ██ ██      ██      ██      ██ ██ ██ ██         ██       ██   ██ ██      ██   ██ ██      ██  ██  
 ██████    ██    ██████  ███████ ██   ██ ███████ ███████  ██████  ██████  █ ████  ██         ██    ██ ██████  ███████ ██   ██  ██████ ██   ██ 
                                                                                                                                                                                                                                                                                      
```
## Tools
Script uses the following tools:
- dirsearch
- feroxbuster
- gobuster
- Fast web fuzzer (ffuf)

## Arguments
The script takes to arguments - domain or IP address, and wordlist.
Users can amend the script to specify the file extensions to be enumerated within the script.


## Results
The script will attempt to create directory named after the domain/IP address, and store the results under a sub-directory named 'recon'.
The results of each tool are stored in a separate file.

## Usage
**NOTE**: Ensure all the above tools are installed and up to date.
Execute the following commands: 
- chmod +x web_dir_enum.sh
- ./web_dir_enum.sh $domain_or_ip_add $wordlist
