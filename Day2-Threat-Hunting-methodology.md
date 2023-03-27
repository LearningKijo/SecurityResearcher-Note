# Day 2 - Threat Hunting methodology
Threat hunting is a proactive approach to cybersecurity where an organization actively searches for and identifies potential threats within their IT infrastructure. The goal is to detect and respond to potential threats before they can cause significant damage, using various tools and techniques such as log analysis, network traffic analysis, endpoint analysis, and penetration testing. By proactively identifying and addressing potential threats, threat hunting can help organizations improve their cybersecurity posture and reduce the risk of data breaches and cyber attacks.

## Threat Hunting approach
Reading two articles on threat hunting gave me valuable insights and ideas for conducting effective operations.
#### CrowdStrike
1. A triggered new threat and TTP-driven investigation.
2. **Investigation based on known [IOCs or IOAs](https://www.crowdstrike.com/cybersecurity-101/indicators-of-compromise/ioa-vs-ioc/).**
3. Advanced analytics and machine learning investigations [data analysis].
> **Note** - <br>
> [What is Cyber Threat Hunting? [Proactive Guide] | CrowdStrike](https://www.crowdstrike.com/cybersecurity-101/threat-hunting/)

#### Microsoft Incident Response (previously DART)
1. **Targeted threat hunting with IOCs and IOAs.**
2. Security monitoring.
3. Incident response investigation.
> **Note** - <br>
> [The art and science behind Microsoft threat hunting: Part 1 - Microsoft Security Blog](https://www.microsoft.com/en-us/security/blog/2022/09/08/part-1-the-art-and-science-of-threat-hunting/) <br>
> [The art and science behind Microsoft threat hunting: Part 2 - Microsoft Security Blog](https://www.microsoft.com/en-us/security/blog/2022/09/21/the-art-and-science-behind-microsoft-threat-hunting-part-2/)

## Keep in mind

> Threat hunting principles
> Our forensic investigators at DART lean on the Alexiou Principle, which states four key questions for our investigators to answer:
> 1. What question are you trying to answer?
> 2. What data do you need to answer that question?
> 3. How do you extract that data?
> 4. What does the data tell you?
