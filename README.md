
![image](https://user-images.githubusercontent.com/120234772/226841807-6572749d-72e9-4599-9282-021f8795d4cf.png)

```kql      
// SecurityResearcher-Note : Covering topics
let SecurityResearcher-Note = datatable(id: int, value: string)
[
      1, "Malware analysis", 
      2, "Incident Response", 
      3, "Threat Hunting", 
      4, "New Attack techniques",
      5, "Critical vulnerabilities"
      6, "Kusto Query Language", 
];
SecurityResearcher-Note
| project id, value
```
