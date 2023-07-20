# Day 8 - Web shell attack insights
Web shell is a malicious software tool that hackers use to gain unauthorized access to a website or web server. It is like a "backdoor" that allows them to control and manipulate the website remotely.

Once the hackers have installed a web shell on a website, they can perform various malicious activities as follows.
- Upload, download, and modify files on the website
- Execute commands on the server, giving them control
- Steal sensitive information from the website or server
- Deface the website by changing its appearance
- Launch additional attacks or use the compromised server for illegal activities

**MITRE ATT&CK**

Persistence > Server Software Component, ***T1505.003, [Web Shell](https://attack.mitre.org/techniques/T1505/003/)***

<img src="https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/e986e761-d8a1-43c6-ba4b-63e4389d11d4" width="800" />

> [Web shell attack deep dive](https://www.youtube.com/watch?v=jvGUahJGJnY), Microsoft Security 

### Programming language
***ASP, PHP, JSP,*** Python, Perl, Bash

### Entry points (Web shell installation)
Web Shells are installed through:

1. Exploiting ***vulnerabilities*** on Internet-facing web servers.
2. Exploiting ***misconfigurations or weak configurations*** on Internet-facing web servers.

**E.g.**   SQL injection, Cross-site scripting (XSS), Local File Inclusion (LFI), Remote file inclusion (RFI), Unpatched Internet-facing web servers

### Threat Actors

## Reference
- September 23, 2020, [Web shell attack deep dive | Microsoft Security](https://www.youtube.com/watch?v=jvGUahJGJnY)
- February 11, 2021, [Web shell attacks continue to rise | Microsoft Security blog](https://www.microsoft.com/en-us/security/blog/2021/02/11/web-shell-attacks-continue-to-rise/)


#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
