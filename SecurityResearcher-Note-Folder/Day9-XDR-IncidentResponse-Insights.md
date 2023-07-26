# Day9 - XDR Incident Response insights
WIP

## What is XDR ?
Extended detection and response describes ***a unified security incident detection and response platform*** that automatically collects and ***correlates data from multiple proprietary security components***. 
> Gartner® Innovation Insight for Extended Detection and Response

## Incident Response with Microsoft Security
When organizations purchase E5 security, their first challenge is often product deployment. However, the next significant challenge arises in security operations, particularly dealing with daily incident response. While Microsoft provides detailed insights and various features, SOC teams might feel overwhelmed when alerts and incidents are generated in their environment. They might struggle to determine where to start their investigation and what capabilities they can leverage in XDR, Microsoft 365 Defender. In light of this, I aim to help expand visibility and provide assistance to SOC teams.

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
