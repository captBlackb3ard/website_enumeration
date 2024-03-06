                                                                                                                                        
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
- Fast website fuzzer (ffuf)

# Arguments
The script takes to arguments - domain or IP address, and wordlist.
Users can amend the script to specify the file extensions to be enumerated within the script.


# Results
The script will attempt to create directory named after the domain/IP address, and store the results under a sub-directory named 'recon'.
The results of each tool are stored in a separate file.
