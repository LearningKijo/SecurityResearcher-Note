# Day 2 - APT29, Cozy Bear - YTTRIUM #WIP
While I am tracing back the history of the APT29 attack(YTTRIUM), I have a few questions, and I hope that these questions and my curiosity will help someone with their security incident response.

#### What is APT29 ?
APT29 (Advanced Persistent Threat 29), also known as Cozy Bear, is a cyber espionage group believed to be operating on behalf of the Russian government
that has been involved in high-profile cyber attacks against various targets, including government agencies and critical infrastructure. The group is known for using advanced hacking techniques, such as spear phishing and zero-day exploits, as well as social engineering tactics. 

#### What are attack techniques of APT29 ?
1. Spear-phishing emails
2. Watering hole attacks
3. Zero-day exploits
4. Remote access tools <Gh0st RAT>
5. Malware attacks <CozyDuke Hammertoss and SeaDuke>

Overall, APT29 is a highly sophisticated threat group that uses a combination of social engineering, advanced hacking techniques, and custom malware to gain access to target systems and steal sensitive information.

#### What is YTTRIUM ? 
When you look at APT29, Microsoft Security blog, you might see "YTTRIUM". This is an excerpt from [a security blog](https://www.microsoft.com/en-us/security/blog/2018/12/03/analysis-of-cyberattack-on-u-s-think-tanks-non-profits-public-sector-by-unidentified-attackers/) - "Third-party security researchers have attributed the attack to a threat actor named APT29 or CozyBear, which largely overlaps with the activity group that Microsoft calls YTTRIUM"

> **Note** :
> Yttrium and Nobelium are two separate threat groups that have been linked to **APT29 (Cozy Bear) in the past**, but they are not the same group. 


## YTTRIUM Attack Chain 
APT29, also known as YTTRIUM, initiated their cyber attack through a combination of **spear-phishing email attacks** and **social engineering**. The malicious links in the emails, if clicked by the recipients, led to a series of exploits that ultimately resulted in the installation of a DLL backdoor. This backdoor gave the attackers remote access to the victims' machines.
  
<img src="https://user-images.githubusercontent.com/120234772/228781349-a582f5e1-9721-404f-ae49-b15787592d64.png" width="70%">

> [Analysis of cyberattack on U.S. think tanks, non-profits, public sector by unidentified attackers](https://www.microsoft.com/en-us/security/blog/2018/12/03/analysis-of-cyberattack-on-u-s-think-tanks-non-profits-public-sector-by-unidentified-attackers/)


#### What is LNK file?
A link file, also known as a shortcut file, is a type of file used in computer operating systems to provide quick access to a file, folder, or program.

## Reference

MITRE ATT&CK®, [Home > Groups > APT29](https://attack.mitre.org/groups/G0016/) <br>
Microsoft, [MITRE ATT&CK APT 29 evaluation proves Microsoft Threat Protection provides deeper end to end view of advanced threats](https://www.microsoft.com/en-us/security/blog/2020/04/21/mitre-attack-evaluation-prove-microsoft-threat-protection-against-threats/) <br>
Microsoft, [Analysis of cyberattack on U.S. think tanks, non-profits, public sector by unidentified attackers](https://www.microsoft.com/en-us/security/blog/2018/12/03/analysis-of-cyberattack-on-u-s-think-tanks-non-profits-public-sector-by-unidentified-attackers/)
