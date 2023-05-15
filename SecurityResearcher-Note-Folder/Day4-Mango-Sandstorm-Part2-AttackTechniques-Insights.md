# Day 4 - Mango Sandstorm Attack techniques & insights
While I am tracing back the history of Mango Sandstorm, formerly known as MERCURY, I have a few questions, and I hope that these questions and my curiosity will help someone with their security incident response.

|#|Title|About|
|:---|:---|:---|
| Part 1 | Day4-Mango-Sandstorm-Part1-Overview.md   | Mango Sandstorm overview |
| Part 2 | Day4-Mango-Sandstorm-Part2-AttackTechniques-Insights.md  (wip)|August 25, 2022, Mango Sandstorm |
| Part 3 | Day4-Mango-Sandstorm-Part2-AttackTechniques-Insights.md (wip) |April 7, 2023, Mango Sandstorm & Storm-1084 |

## August 25, 2022, Mango Sandstorm
#### Short Summary
Mango Sandstorm, previously known for using Log4j 2 exploits to attack VMware apps, has recently been targeting SysAid apps using the same technique. Once they gain initial access, the group establishes persistence, moves laterally within the network using custom and well-known hacking tools, and dumps credentials.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/f67bb7ac-2cc3-4a6e-ab31-06b8db9ce991)
> **Note** : [MERCURY leveraging Log4j 2 vulnerabilities in unpatched systems to target Israeli organizations](https://www.microsoft.com/en-us/security/blog/2022/08/25/mercury-leveraging-log4j-2-vulnerabilities-in-unpatched-systems-to-target-israeli-organizations/)

#### What is Log4j?
Log4j is a widely used Java logging library that allows developers to log events and messages in their applications. It provides flexibility in categorizing and controlling logging output, enabling effective debugging and monitoring of applications.

#### Why was Log4j 2 exploited?
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

#### In persistence, what does the attacker do?
According to the Microsoft blog, it has been observed that attackers utilize the following techniques for persistence:
- Dropping a web shell to establish and maintain effective and continuous access to the compromised device.
- Creating a new user account and elevating its privileges to the local administrator level.
- Adding leveraged tools to the startup folders and ASEP registry keys to ensure their persistence even after device reboots.
- Using a credential theft tool such as Mimikatz.

#### In lateral movement, what does the attacker do?
The attackers utilize WMI (Windows Management Instrumentation) for maliciously executing commands, as well as a remote access tool (leveraging RemCom) to run encoded PowerShell commands within the organization.

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
