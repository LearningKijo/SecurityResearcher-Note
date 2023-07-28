# Day9 - XDR Incident Response insights
When organizations purchase E5 security, their first challenge is often product deployment. However, ***the next significant challenge arises in "security operations"***, particularly dealing with daily incident response. While Microsoft provides detailed insights and various features, SOC teams might feel overwhelmed when alerts and incidents are generated in their environment. 

When alerts/incidents were generated in your tenant, it is possible that some individuals may have the following concerns and challenges.

1. ***No idea where to start the investigation...***
2. ***Where exactly do I have to look ?***
3. ***What kind of options do I have ?***
4. ***What capabilities can I leverage in XDR ?***


In light of this, I aim to expand their understanding in ***XDR*** and ***Microsoft 365 Defender*** to help them overcome these challenges.
## What is XDR ?
Extended detection and response describes ***a unified security incident detection and response platform*** that automatically collects and ***correlates data from multiple proprietary security components***. 
> Gartner® Innovation Insight for Extended Detection and Response

## Incident Response with Microsoft Security


<img src="https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/e1730b31-c62b-4996-b5f5-03e01e81c5af" width="800" />


## Response actions

|Entitity   |Actions              |
|:----------|:---------------------|
| Devices   | - Initiate Automated Investigation <br> - Initiate Live Response Session  <br> - Restrict app execution <br> - Isolate device <br> - Contain device |
| Files     | - Stop and quarantine file <br> - Manage indicator |
| Users     | - Disable user in Active Directory <br> - Suspend user in Azure Active Directory <br> - Reset user password |
| Mailboxes | - Move to Inbox <br> - Move to Junk <br> - Move to Deleted Items <br> - Soft delete <br> - Hard delete <br> -  Trigger investigation <br> - the Tenant Allow/Block List |

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
