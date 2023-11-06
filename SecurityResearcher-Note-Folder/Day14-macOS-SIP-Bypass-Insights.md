# Day 14 - macOS SIP Bypass insights
Hi there !! Thank you for visiting [@SecurityResearch-Note](https://github.com/LearningKijo/SecurityResearcher-Note). 
Last time, I had the opportunity to delve deeper into macOS exploitation, specifically focusing on ***"SIP Bypass"***. 
However, macOS is relatively new to me, with features like SIP (System Integrity Protection), entitlements, TCC (Transparency, Consent, and Control), and more. 
That's why, I was considering that creating a super brief summary would be beneficial for someone new to macOS.

## What is SIP ?
SIP is one of the security features in macOS designed to protect critical system files and processes from being tampered with or modified by unauthorized users or malicious software. 

**Let's consider disabling SIP from a red team perspective....**

On macOS, even the root user is not allowed to modify important system files under the SIP protection and this is called ***"Rootless"***.
Therefore, in terms of privilege escalation and attackers, gaining root user access on macOS doesn't provide much for exploitation because of SIP. 
Not to mention, there is [a legitimate way to disable SIP](https://developer.apple.com/documentation/security/disabling_and_enabling_system_integrity_protection#3599244), but it requires booting into recovery mode, which would be difficult for an attacker to accomplish.
I would say ***"SIP provides a robust level of protection on macOS"***.

As we may have observed, disabling SIP is not easy and cannot be accomplished with just a few bash commands. 
I couldn't even find any publicly available penetration testing tools for it. 
In the end, when elevating privilege, the focus should be on ***"macOS vulnerabilities"***.

> [!Note]
> System Integrity Protection includes protection for these parts of the system:
> - /System, /usr, /bin, /sbin, /var
> - Apps that are pre-installed with the Mac operating system
>   
> > [About System Integrity Protection on your Mac](https://support.apple.com/en-us/102149#:~:text=System%20Integrity%20Protection%20is%20a%20security%20technology%20designed%20to%20help,and%20folders%20on%20your%20Mac.)


## SIP & Entitlement
After learning about the SIP security feature, I have a better understanding of how challenging it is for attackers to exploit the critical system, thanks to its robust protection. 
That's why, attackers often seek ways to bypass SIP without disabling it. 
While I was reading through Microsoft security blog - [Shrootless](https://www.microsoft.com/en-us/security/blog/2021/10/28/microsoft-finds-new-macos-vulnerability-shrootless-that-could-bypass-system-integrity-protection/), I came across a key sentence that explains ***"the relationship between SIP and entitlements"***, which has a significant impact on SIP bypass attack.

![image](https://github.com/LearningKijo/Malware-Analysis/assets/120234772/2ed0f115-2cc8-42ec-b054-4adcd2b1b852)

***"In short, if there is a process with entitlements that allow it to modify the critical system, it is possible to bypass SIP on macOS."***

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/fbe77589-a3a7-47fc-bcd3-0acbf1b30885)

> e.g. ‘Shrootless’ - system_installd entitlements

> [!Important]
According to Apple's documentation, an [entitlements](https://developer.apple.com/documentation/bundleresources/entitlements) is a right or privilege that grants an executable particular capabilities.

## SIP Bypass case
Shrootless and Migraine are great examples of SIP bypass, both discovered by Microsoft Threat Intelligence team, Microsoft.
As each blog covers the details, I would like to share a high-level insight with a summary below.

### Shrootless
On October 21, 2021, [Microsoft](https://www.microsoft.com/en-us/security/blog/2021/10/28/microsoft-finds-new-macos-vulnerability-shrootless-that-could-bypass-system-integrity-protection/) discovered a new macOS vulnerability, known as [CVE-2021-30892](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-30892) or Shrootless, which has the potential to bypass System Integrity Protection.
While examining macOS processes with SIP bypass entitlements, ***Microsoft found 'system_installd,' which had a powerful 'com.apple.rootless.install.heritable' entitlement, allowing child processes to bypass SIP restrictions.***
When installing an Apple-signed package, 'system_installd' handles the installation. 
If the package contains post-install scripts, they're executed using the 'zsh' shell, which ***automatically runs commands from the '/etc/zshenv' file***, even in non-interactive mode. 
This creates a potential avenue for attackers to perform arbitrary operations by creating a malicious '/etc/zshenv' file and waiting for 'system_installd' to invoke 'zsh'.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/5462c1bb-434f-4b19-936f-930acb5e77e9)


### Migraine
After the discovery of Shrootless (CVE-2021-30892), [Microsoft](https://www.microsoft.com/en-us/security/blog/2023/05/30/new-macos-vulnerability-migraine-could-bypass-system-integrity-protection/) identified a new macOS vulnerability with similarities, referred to as [CVE-2023-32369](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-32369) or Migraine, on May 30, 2023. 
This vulnerability also has the potential to bypass System Integrity Protection. The attack can be initiated by starting the migration process through the Migration Assistant, which is one of the processes with entitlements to bypass SIP security checks. The Migration Assistant, in turn, interacts with other processes that have the necessary entitlements. ***Among these processes are bash and perl, which are interpreters capable of executing arbitrary code.***

As a result, an attacker can exploit this flow to run suspicious or malicious code by leveraging the Migration Assistant's interaction with these processes. 
By executing arbitrary code within the context of these trusted processes, the attacker can effectively bypass SIP protections and carry out actions that could compromise system integrity or install persistent malware.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/502ba15f-83f2-4728-a20f-ff04f3c7d9c3)

If you are interested in the details, I highly recommend reading the blogs, and you can find the links in the Reference section.

## Reference
- October 28, 2021, [Microsoft finds new macOS vulnerability, Shrootless, that could bypass System Integrity Protection](https://www.microsoft.com/en-us/security/blog/2021/10/28/microsoft-finds-new-macos-vulnerability-shrootless-that-could-bypass-system-integrity-protection/)
- May 30, 2023, [New macOS vulnerability, Migraine, could bypass System Integrity Protection](https://www.microsoft.com/en-us/security/blog/2023/05/30/new-macos-vulnerability-migraine-could-bypass-system-integrity-protection/)

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
