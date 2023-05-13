# Day 4 - Mango Sandstorm Attack techniques & insights
WIP xxxxxxxx

1. August 25, 2022, Mango Sandstorm
2. April 7, 2023, Mango Sandstorm & Storm-1084

## August 25, 2022, Mango Sandstorm
#### Short Summary
Mango Sandstorm, previously known for using Log4j 2 exploits to attack VMware apps, has recently been targeting SysAid apps using the same technique. Once they gain initial access, the group establishes persistence, moves laterally within the network using custom and well-known hacking tools, and dumps credentials.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/f67bb7ac-2cc3-4a6e-ab31-06b8db9ce991)
> **Note** : [MERCURY leveraging Log4j 2 vulnerabilities in unpatched systems to target Israeli organizations](https://www.microsoft.com/en-us/security/blog/2022/08/25/mercury-leveraging-log4j-2-vulnerabilities-in-unpatched-systems-to-target-israeli-organizations/)

#### What is Log4j ?
Log4j is a widely used Java logging library that allows developers to log events and messages in their applications. It provides flexibility in categorizing and controlling logging output, enabling effective debugging and monitoring of applications.

#### Why was Log4j 2 exploited ?
Log4j 2, an updated version of Log4j, is a widely used and powerful logging framework in Java. However, it had a critical vulnerability called Log4Shell (CVE-2021-44228, CVE-2021-45046, CVE-2021-44832), ***which allowed attackers to remotely execute code by exploiting its deserialization functionality.*** Regarding the details of Log4j 2, you can refer to [Guidance for preventing, detecting, and hunting for exploitation of the Log4j 2 vulnerability](https://www.microsoft.com/en-us/security/blog/2021/12/11/guidance-for-preventing-detecting-and-hunting-for-cve-2021-44228-log4j-2-exploitation/).

#### What commands were executed through the Log4j 2 exploit?
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

## April 7, 2023, Mango Sandstorm & Storm-1084
Mango Sandstorm, previously known for using Log4j 2 exploits and targeting on-premises environments, has now expanded its focus to include both on-premises and cloud environments. After gaining initial access through known vulnerabilities, the attack has been linked to Storm-1084 (formerly known as DEV-1084).
> **Note** : [MERCURY and DEV-1084: Destructive attack on hybrid environment](https://www.microsoft.com/en-us/security/blog/2023/04/07/mercury-and-dev-1084-destructive-attack-on-hybrid-environment/)
