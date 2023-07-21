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
A web shell is a malicious code implanted on web servers, written in web development programming languages like ...

***ASP, PHP, JSP,*** Python, Perl, Bash

### Entry points (web shell installation)
Web Shells are installed through:

1. Exploiting ***vulnerabilities*** on Internet-facing web servers.
2. Exploiting ***misconfigurations or weak configurations*** on Internet-facing web servers.

**E.g.**   SQL injection, Cross-site scripting (XSS), Local File Inclusion (LFI), Remote file inclusion (RFI), Unpatched Internet-facing web servers

## Web Shell breach
Web shells are commonly leveraged by attackers as an initial access in various types of attacks. Let me introduce some attack scenarios involving the use of web shells.

### A BlackByte ransomware
In this attack, the attacker utilized a variety of tools and techniques to carry out their objective of deploying BlackByte 2.0 ransomware. They gained initial access by exploiting [ProxyShell vulnerabilities](https://techcommunity.microsoft.com/t5/exchange-team-blog/proxyshell-vulnerabilities-and-your-exchange-server/ba-p/2684705) and targeted unpatched Microsoft Exchange Servers to install the web shell.

**ProxyShell** : refers to three Exchange vulnerabilities discovered and patched by Microsoft in 2021. When combined, these flaws enable unauthenticated remote code execution, granting attackers full control over the Exchange server and potential access to other parts of the organization's network.

| CVE            | MSRC - Microsoft Exchange Server | NVD / NIST |
|:---------------|:-------|:----------|
| CVE-2021-34473 | [Remote Code Execution Vulnerability](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-34473) | [CVE-2021-34473 Detail](https://nvd.nist.gov/vuln/detail/CVE-2021-34473) |
| CVE-2021-34523 | [Elevation of Privilege Vulnerability](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-34523) | [CVE-2021-34523 Detail](https://nvd.nist.gov/vuln/detail/CVE-2021-34523) |
| CVE-2021-31207 | [Security Feature Bypass Vulnerability](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-31207) | [CVE-2021-31207 Detail](https://nvd.nist.gov/vuln/detail/CVE-2021-31207) |

> July 6, 2023, [The five-day job: A BlackByte ransomware intrusion case study](https://www.microsoft.com/en-us/security/blog/2023/07/06/the-five-day-job-a-blackbyte-ransomware-intrusion-case-study/)

### Cadet Blizzard

## Reference
- September 23, 2020, [Web shell attack deep dive | Microsoft Security](https://www.youtube.com/watch?v=jvGUahJGJnY)
- February 11, 2021, [Web shell attacks continue to rise | Microsoft Security blog](https://www.microsoft.com/en-us/security/blog/2021/02/11/web-shell-attacks-continue-to-rise/)


#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
