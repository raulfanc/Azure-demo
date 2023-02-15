Azure Password: with one more ! as other passwords   

## App registration
- Application (client) ID:
c14c60e4-2b65-4a32-b002-7af153733294`

- ADLS | Certificates & Secrets:
6vi8Q~rx6WF8TLHMNsnKC5bCl7aObADIp-9E6aNj

- Vault URI / DNS Name: 
https://wsp-demo-kv.vault.azure.net/

- Resource ID: 
/subscriptions/763c5c4a-0fc9-47a1-919f-3bee41db03a0/resourceGroups/wsp_demo_RG/providers/Microsoft.KeyVault/vaults/wsp-demo-kv

- [Create Create Secret Scope](https://adb-6040027147401400.0.azuredatabricks.net/?o=6040027147401400#secrets/createScope) - use this link to create a Secret Scope so that the credentials will not expose when mounting ADLS


Paste the following code into your Python Databricks notebook and replace the `adlsAccountName`, `adlsContainerName`, `adlsFolderName`(if you have), and mountpoint with your own ADLS gen2 values. Also ensure that the ClientId, ClientSecret, and TenantId match the secret names that your provided in your Key Vault in Azure portal.

## Event Hubs
- SAS connection String
 Endpoint=sb://wspdemonamespace1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=eiM1ZychiekSAteSQoZPeERXmc2uwVYxx+AEhAksvHA=