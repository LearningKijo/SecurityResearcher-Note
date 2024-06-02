#Replace "XXXXXXXXXXXXXXXXXXXX" with the appropriate IDs relevant to your tenant/application (quotes required)
$appId = "XXXXXXXXXXXXXXXXXXXX"
$appSecret = "XXXXXXXXXXXXXXXXXXXX"
$tenantId = "XXXXXXXXXXXXXXXXXXXX"

Write-Host "+++ MDE device tag with API calls +++"

#Connect to Microsoft Graph
$SecuredPasswordPassword = ConvertTo-SecureString -String $appSecret -AsPlainText -Force
$ClientSecretCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $appId, $SecuredPasswordPassword
Connect-MgGraph -TenantId $tenantId -ClientSecretCredential $ClientSecretCredential -NoWelcome

#Function to run a query
$resourceAppIdUri = 'https://api.securitycenter.microsoft.com'

$oAuthUri = "https://login.microsoftonline.com/$TenantId/oauth2/token"
$body = [Ordered] @{
    resource = "$resourceAppIdUri"
    client_id = "$appId"
    client_secret = "$appSecret"
    grant_type = 'client_credentials'
}

try {
    $response = Invoke-RestMethod -Method Post -Uri $oAuthUri -Body $body -ErrorAction Stop
    $aadToken = $response.access_token
    Write-Host "Succeeded to get token value --------------------------------------------------- [ OK ]" -ForegroundColor Green
} catch {
    #Error handling
    Write-Error "$($_.Exception.Message)"
}

#Advanced Hunting Query
$query = 'DeviceInfo | where OSPlatform in ("Windows10", "Windows11") | summarize arg_max(Timestamp, *) by DeviceId, DeviceName'

#Convert the query to JSON
$body = @{
    Query = $query
} | ConvertTo-Json

#Invoke Microsoft Graph security API
$result = Invoke-MgGraphRequest -Method POST -Uri "https://graph.microsoft.com/v1.0/security/runHuntingQuery" -Body $body

#Display the results
$table = $result.results | ForEach-Object {
    [PSCustomObject]@{
        DeviceId = $_.DeviceId
        DeviceName = $_.DeviceName
    }
}

#Check the value of the DeviceId
If ($null -eq $table) {
    Write-Host "No value from AH query  -------------------------------------------------------- [ NO ]" -ForegroundColor Yellow
} else {
    Write-Host "Succeeded to get AH query + value ---------------------------------------------- [ OK ]" -ForegroundColor Green
}

#Show device id value in table
$counter = 1
Foreach ($getMachine in $table) {
    Write-Host " +-- [$counter] Device ID:"  $getMachine.DeviceId ", Name:" $getMachine.DeviceName 
    $counter++
}

Write-Host ""

#Tagging devices
Write-Host "--- MDE API call to tag devices ---"

Foreach ($machine in $table.DeviceId) {

    Start-Sleep -Seconds 3
  
    $url = "https://api.securitycenter.microsoft.com/api/machines/" +$machine+ "/tags"
    $headers = @{
          'Content-Type' = 'application/json'
          Accept = 'application/json'
          Authorization = "Bearer $aadToken"
    }
    $tag= @{
      'Value' = 'Ninja'
      'Action' = 'Add'
    }
      
    #Output the body of the request to see if the tag is being applied correctly
    $body = ConvertTo-Json -InputObject $tag
  
    try {
          $response = Invoke-WebRequest -Method Post -Uri $url -Headers $headers -Body $body -ErrorAction Stop
          Write-Host "Succeeded to tag [$($tag['Value'])] : $machine ------------ [ OK ]" -ForegroundColor Green
     } catch {
          #Error handling
          Write-Error "$($_.Exception.Message)"
     }
  }

  Write-Host "--- END ---"
