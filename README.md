
```kql      
// SecurityResearcher-Note : contents
let SecurityResearcher-Note = datatable(id: int, value: string)
[
      1, "Malware analysis", 
      2, "Incident Response", 
      3, "Threat Hunting", 
      4, "Cyberattack",
      5, "Kusto query language", 
];
SecurityResearcher-Note
| project id, value
```
