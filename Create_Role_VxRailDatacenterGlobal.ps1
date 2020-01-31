#Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
$cvRole = "VxRail Datacenter Global"
$cvRolePermFile = ".\VxRailDatacenterGlobal.txt"
$viServer = Read-Host -Prompt 'Input your vCenter server name'
Connect-VIServer -Server $viServer 
$cvRoleIds = @()
Get-Content $cvRolePermFile | Foreach-Object{$cvRoleIds += $_}
New-VIRole -name $cvRole -Privilege (Get-VIPrivilege -Server $viserver -id $cvRoleIds) -Server $viserver