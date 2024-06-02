# Advanced Hunting - API calls insight
APIs are highly valuable for security operations, and nowadays, we are increasingly transitioning towards more SOAR solutions. 
These solutions facilitate incident management, response to impacted assets, and report generation using APIs.

At first, I really love this blog, discussing how we can effectively use MDE API calls to tag devices - [How to use tagging effectively (Part 3) - Scripting tags](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/how-to-use-tagging-effectively-part-3-scripting-tags/ba-p/1964073)

Today, I'd like to share insights and address confusion regarding the use of hunting-related API calls based on my past testing experiences.

### First discovery ... many APIs....
As far as I know, originally there were MDE APIs for advanced hunting. 
However, after XDR was introduced to Microsoft Security, known as "Microsoft Threat Protection -> Microsoft 365 Defender, ***Nowadays, we call it - Microsoft Defender XDR***", we started using Advanced Hunting APIs. 
Now, there is a shift towards using Microsoft Graph security API instead of Advanced Hunting API.

As you can see in [the Microsoft documentation](https://learn.microsoft.com/en-us/defender-xdr/api-advanced-hunting), it states that the Advanced Hunting API is the old version, and it is recommended to use Microsoft Graph security API instead.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/69a29672-a6a0-457e-ac91-c6ed25a1a15d)

When we consider the API history, it appears as follows;

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/b0c876a5-9397-4582-954e-9e43bd2a4316)

### Second discovery ... different permissions
Now we have discussed around three different advanced hunting-related APIs, but determining the appropriate API permissions can be confusing.
As I've listed three different APIs, each requires different permissions. 
Therefore, depending on which API you're using ***(recommended using Microsoft Graph security API)***, you'll need to assign the appropriate permissions.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/56163135-65a9-4f89-b6f2-57fe1919b865)

This is the actual PowerShell script to demonstrate using the Advanced Hunting API, but I often notice mistakes due to incorrect API URLs. 
I've added three different API URLs for comparison purposes.
 - Code 34 - Microsoft Defender for Endpoint Advanced Hunting API
 - Code 37 - Microsoft Defender XDR Advanced Hunting API

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/b2a18128-5261-4bb8-8d6e-8dd1ea93f871)

- Code 44 - Microsoft Graph security API

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/d1ef4746-8096-4dbb-b550-78ce61e4ea8c)

### Simulation
As Advanced Hunting API shifts to using Microsoft Graph Security API, I've written a PowerShell script that utilizes Microsoft Graph Security API to perform advanced hunting and tagging to devices with Microsoft Defender for Endpoint API calls.

- [x] [MDE-APIcallSimu.ps1](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/MDE-APIcallSimu.ps1) is available from Security Research notes.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/4c746d54-bc96-46b5-9055-e350f2d24463)
> Simulation : MDE-APIcallSimu.ps1

## Reference
1. [How to use tagging effectively (Part 3) - Scripting tags](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/how-to-use-tagging-effectively-part-3-scripting-tags/ba-p/1964073)
2. [The new Microsoft 365 Defender APIs in Microsoft Graph are now available in public preview!](https://techcommunity.microsoft.com/t5/microsoft-defender-xdr-blog/the-new-microsoft-365-defender-apis-in-microsoft-graph-are-now/ba-p/3603099)

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
