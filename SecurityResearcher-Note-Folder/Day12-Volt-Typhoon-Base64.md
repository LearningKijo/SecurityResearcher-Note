# Day 12 - Base64 decode &  Volt Typhoon insights
Volt Typhoon, a state-sponsored actor based in China, is a sophisticated cyberattack targeting critical infrastructure in the United States. It typically focuses on espionage and information gathering, relying on "living off the land techniques" and "hands-on-keyboard activity". Here is the Volt Typhoon attack diagram with comments. If you are interested in a detailed attack technique breakdown, you can find it in [this blog](https://www.microsoft.com/en-us/security/blog/2023/05/24/volt-typhoon-targets-us-critical-infrastructure-with-living-off-the-land-techniques/).

![image](https://github.com/LearningKijo/Malware-Analysis/assets/120234772/4151148b-1be8-41cf-b128-4dcb9a6b4516)
> Volt Typhoon attack diagram with comments

## Credential access : [Base64 Encode to Decode]
In Volt Typhoon, during the credential access phase, Base64 encoding was used to execute a command aimed at dumping credentials through the Local Security Authority Subsystem Service (LSASS).

In this analysis, I would like to provide a high-level mapping of the logic and the attack details of the LSASS dump command as described in the Microsoft Security blog. 
Additionally, I will demonstrate how to encode the command as Base64.

#### LSASS dump command - Simulation
This command is telling cmd.exe to use rundll32.exe to run a function called MiniDump from the comsvcs.dll file. 
It's saving the result as a dump file named out.dmp in the C:\temp directory and specifying that it should be a full dump.

![image](https://github.com/LearningKijo/Malware-Analysis/assets/120234772/c35a9a68-ccde-4c8a-b802-5f253fe3f258)


#### LSASS dump command - Volt Typhoon 
[Volt Typhoon](https://www.microsoft.com/en-us/security/blog/2023/05/24/volt-typhoon-targets-us-critical-infrastructure-with-living-off-the-land-techniques/) - command to dump LSASS process memory, encoded in Base64

![image](https://github.com/LearningKijo/Malware-Analysis/assets/120234772/0e3cc5d1-31d3-4016-9ea6-d1bbde62f1ec)


#### Encode the command to perform an LSASS dump with Base64 in PowerShell

![image](https://github.com/LearningKijo/Malware-Analysis/assets/120234772/85dbbd7d-bfe3-4076-a713-9dbd9286c25f)

## Microsoft Defender for Endpoint detection
After running the encoded script on the device, within a few minutes, two alerts were generated, which were eventually combined into one incident. 
One of the great capabilities of Microsoft Defender for Endpoint is its ability to decode the base64-encoded command line, and the insights will be displayed on the alert page.

![image](https://github.com/LearningKijo/Malware-Analysis/assets/120234772/610a2a00-e464-491a-bc78-72394b71cf16)
> Microsoft Defender for Endpoint captured "Credential Dump"

![image](https://github.com/LearningKijo/Malware-Analysis/assets/120234772/cf964cfc-21ac-4733-a257-e7b81d0ce1d2)
> Decoding the base64-encoded command line in Microsoft Defender for Endpoint

By using [base64_encoded_tostring](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/base64_encode_tostringfunction) operator in KQL, it is possible to decode base64-encoded commands. 
Below is an example of base64_encoded_tostring, which may initially show the result as null. 
However, when you copy and paste it into a note, the entire command is displayed without any issues.

![image](https://github.com/LearningKijo/Malware-Analysis/assets/120234772/f8de9ded-cd96-4d83-b463-99042ea104d5)


#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
