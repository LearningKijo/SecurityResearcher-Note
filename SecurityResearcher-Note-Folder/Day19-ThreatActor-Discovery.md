# Day 19 - Threat actor, discovery techniques

Hello, all defenders,

During the holidays, I had a chance to read Microsoft Security blogs about Secret Blizzard, Russia-based nation-state threat actor. 
In Part 2 of the blog, I noticed they used a batch file to collect device information, and the commands were excessively long. 
This time, I would like to break down each command. Additionally, I'd like to explore how other threat actors have used discovery techniques.

## Secret Blizzard
Microsoft's Security blog provides insights into attacks linked to the Russian nation-state actor, which Microsoft tracks as **Secret Blizzard** and other security vendors called as Turla, Waterbug, Venomous Bear, Snake, Turla Team, or Turla APT Group.
According to the blog, Secret Blizzard is recognized for targeting diverse industries, with a particular focus on ministries of foreign affairs, embassies, government agencies, defense organizations, and defense-related enterprises globally.
Secret Blizzard aims to maintain long-term access to systems for intelligence gathering. They use multiple backdoors, including peer-to-peer and C2 communication tools. During attacks, they steal documents, PDFs, and email content.

- December 4, 2024, [Frequent freeloader part I: Secret Blizzard compromising Storm-0156 infrastructure for espionage](https://www.microsoft.com/en-us/security/blog/2024/12/04/frequent-freeloader-part-i-secret-blizzard-compromising-storm-0156-infrastructure-for-espionage/)
- December 11, 2024, [Frequent freeloader part II: Russian actor Secret Blizzard using tools of other groups to attack Ukraine](https://www.microsoft.com/en-us/security/blog/2024/12/11/frequent-freeloader-part-ii-russian-actor-secret-blizzard-using-tools-of-other-groups-to-attack-ukraine/)

***Blog Part II*** mentions that the attacker used a reconnaissance tool, a batch file to collect device information. However, the command used is incredibly long, and I will deep dive into each command. 

### Command :

![image](https://github.com/user-attachments/assets/9436fe51-0d45-4a76-b528-dd26a7906f02)

```cmd
ver & systeminfo & ipconfig -all & ipconfig /displaydns & route print & arp -a & netstat -a -n & net share & net use & net user & whoami /all & wmic useraccount get name,sid & net localgroup & net accounts & net config & net time \\127.0.0.1 & set & netsh firewall show portopening & netsh firewall show allowedprogram & netsh firewall show config & tasklist /v & tasklist /svc & echo . | powershell get-hotfix & reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /s & reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA & dir /x c:\ & dir /x c:\users\ & dir %tmp% & dir "c:\program files (x86)" /x & dir "c:\program files" /x & tree "%UserProfile%\Desktop" /A & tree "%UserProfile%\Documents" /A & tree "%UserProfile%\Downloads" /A & reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run & reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run & reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce & reg query HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run & reg query HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\RunOnce & dir /x "c:\windows\microsoft.net\framework"
```

### Techniques tables
| Command               | Description                          | Attacker's Purpose                   |
|:----------------------|:-------------------------------------|:-------------------------------------|
| ver                   | Displays the Windows version.        | Identifies the OS version to tailor attacks (e.g., compatible exploits). |
| systeminfo            | Lists detailed system information, including OS build, hardware, and hotfixes. | Gathers information on installed patches, hardware, and OS for vulnerability identification. |
| ipconfig              | Shows network configuration details like IP address, DNS, and gateway. | Collects network information to locate targets or misconfigured systems. |
| route                 | Displays the routing table for network traffic.	 | Identifies network routes to understand potential pathways for lateral movement. |
| arp                   | Displays the ARP table (MAC-to-IP mappings). | Maps connected devices in the network to identify targets. |
| netstat               | Shows active network connections, listening ports, and their states. | Discovers open ports and active connections for reconnaissance or pivoting. |
| net                   | A suite of subcommands for managing network resources and users | Gathers user, group, and shared resource details to find misconfigurations or potential entry points. | 
| whoami                | Displays the current user and security group memberships. | Confirms privileges and checks group memberships for possible privilege escalation. |
| wmic                  | Queries system management information (e.g., user accounts, processes). | Enumerates users, processes, and services to identify vulnerabilities or attack opportunities. |
| set                   | Displays environment variables. | Finds useful environment variables for potential exploitation (e.g., paths, credentials, or temporary files). |
| netsh                 | Manages network and firewall settings. | Checks firewall rules to identify allowed programs or open ports for bypassing security. |
| tasklist              | Displays running processes and associated services. | Identifies active processes for privilege escalation or identifying security software. |
| powershell get-hotfix | Lists installed updates on the system. | Identifies missing updates for known vulnerabilities to exploit. |
| reg query             | Queries registry keys and values. | Inspects critical registry entries for persistence mechanisms, security settings, or misconfigurations. |
| dir                   | Lists the contents of directories, including file names and attributes. | Finds sensitive files, such as configurations or credentials. |
| tree                  | Displays the directory structure in a tree format. | Quickly maps the folder hierarchy to locate valuable files or paths. |

### Breakdown with discovery sub category :

**1) System Information Gathering**

    ver
    systeminfo
    set

    
**2) Network Configuration and Connectivity**

    ipconfig -all
    ipconfig /displaydns
    route print
    arp -a
    netstat -a -n

**3) User Enumeration**

    Here are the details of each command from the top.
    - List current user and associated privileges
    - Retrieve all local user accounts and their SIDs
    - Retrieve local user account details
    - List local groups and group memberships
    --------------------------------------------------
    whoami /all 
    wmic useraccount get name,sid 
    net user
    net localgroup


**4) Shared Resources and Connections**

     Here are the details of each command from the top.
    - Enumerate shared resources
    - List mapped network drives and active SMB connections
    --------------------------------------------------
    net share
    net use

**5) System Configuration**

     Here are the details of each command from the top.
    - Retrieve account policies such as password policies
    - List workstation or server configurations
    - Query the system time of the local machine
    -------------------------------------------------
    net accounts
    net config
    net time \\127.0.0.1

**6) Firewall and Security Policies**

    netsh firewall show portopening
    netsh firewall show allowedprogram
    netsh firewall show config
     
**7) Process and Service Enumeration**
    
    tasklist /v
    tasklist /svc
    
**8) Patch and Hotfix Information**
    
    echo . | powershell get-hotfix

**9) Registry Enumeration**

    Here are the details of each command from the top.
    - List all registry values in the System policies section
    - Check the status of User Account Control (UAC)
    - List startup programs for the current user
    - List startup programs for all users
    - List one-time startup programs
    - List 32-bit startup programs for all users
    - List one-time 32-bit startup programs
    --------------------------------------------------
    reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /s
    reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA
    reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run
    reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run
    reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce
    reg query HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run
    reg query HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\RunOnce

**10) File and Directory Enumeration**

    Here are the details of each command from the top.
    - List files and directories on the root of the C drive (with short names)
    - List files and directories in the Users folder
    - List files and directories in the temporary folder
    - List files in the Program Files (x86) folder
    - List files in the Program Files folder
    - Display a tree structure of the user's desktop folder
    - Display a tree structure of the user's documents folder
    - Display a tree structure of the user's downloads folder
    - List files in the .NET Framework directory
    --------------------------------------------------
    dir /x c:\
    dir /x c:\users\
    dir %tmp%
    dir "c:\program files (x86)" /x
    dir "c:\program files" /x
    List files in the Program Files folder.
    tree "%UserProfile%\Desktop" /A
    tree "%UserProfile%\Documents" /A
    tree "%UserProfile%\Downloads" /A
    dir /x "c:\windows\microsoft.net\framework"

## Storm-0270
Microsoft's threat intelligence teams have linked several ransomware campaigns to DEV-0270, also known as Nemesis Kitten, a subgroup of the Iranian actor PHOSPHORUS.
In DEV-0270, some of the discovery techniques can be seen to discovery domain, email and network information by using WMI and powershell. 

- September 7, 2022, [Profiling DEV-0270: PHOSPHORUS’ ransomware operations](https://www.microsoft.com/en-us/security/blog/2022/09/07/profiling-dev-0270-phosphorus-ransomware-operations/)

![image](https://github.com/user-attachments/assets/98dc7d8e-10c7-4d76-a054-a83e88010b35)
> Figure 1. Typical DEV-0270 attack chain

> [!Note]  
> • PHOSPHORUS is now tracked as Mint Sandstorm • DEV-0270 is now tracked as Storm-0270

### Command :
```cmd
wmic computersystem get domain
whoami
net user
```

```powershell
# Retrieves the primary SMTP email address (SmtpAddress) of the first recipient in the list and displays it in a clean table format without headers.
Get-Recipient | Select Name -ExpandProperty EmailAddresses -first 1 | Select SmtpAddress |  ft -hidetableheaders
```

```powershell
# Finds domain controller information in the network using PowerShell.
powershell.exe /c Get-WMIObject Win32_NTDomain | findstr DomainController
```
```cmd
rem Searches for "DomainController" in a file or command output.
findstr.exe DomainController
```

## Mango Sandstorm

### Command :
```cmd
cmd.exe /C whoami
cmd.exe /C powershell -exec bypass -w 1 -enc UwB….
cmd.exe /C hostname
cmd.exe /C ipconfig /all
cmd.exe /C net user
cmd.exe /C net localgroup administrators
cmd.exe /C net user admin * /add
cmd.exe /C net localgroup Administrators admin /add
cmd.exe /C quser
```

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
