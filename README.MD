# Demo Overview
`AS` a Data Engineer, `I WANTED TO` build a SERVERLESS infrastructure in Azure that simulates the behavior of a real-world big data system, `SO THAT` it can provide other team members (Data Scientists or Data Analysts) to access the processed data.

## Design Flow
![Design Flow](./Pics/Azure%20Demo%20Project%20Design.jpeg)

---
## Agile Project Management
* [Trello](https://trello.com/b/UCqOkRNO/de-demo)

## Tools
- MS Azure
- Terraform
- Dash Plotly (to do)

## Languag
- Python
- SQL

----

## Data Source
>Dummy data for this demo, the reason beings that this demo is to simulate the behavior of a real-world data source, i.e., "IoT data" or "web scraping".

[Data Generator in Local](Stream/datagenerator_10s.ipynb): This Python Script to generate dummy JSON object every 10s - used car sales records, saved in [bronze data](Stream/bronze%20data/) folder. 

[Data Generator in Azure](Stream/datagenerator_azure.ipynb): This Python Script to generate dummy data, which will be designed into `Azure Logic App`. It is a batch processing solution, and the data is generated in intervals (defined by the recurrence time)

![Streaming Ingested Data](https://trello.com/1/cards/63e3737656bf822fd2db75b6/attachments/63ec96553be7f04183f4b5f1/download/image.png)


---
## Azure Set up
Using [Terraform](./terraform/) to set up Azure Infrastructure and Resources.
1. Data Lake
2. Azure Functions
3. Azure Data Factory
4. Event Hub
5. Logic App
6. Databricks
7. Cosmos DB
8. API management
9. Azure Active Directory
10. App Registration

---
## Event Hubs

1. loading Libs Python
``` bash
pip install azure-eventhub
pip install azure-identity
pip install aiohttp
```

2. Authentication

2.1. [ADD](https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-python-get-started-send?tabs=passwordless%2Croles-azure-cli#tabpanel_1_passwordless) (real-world application)

retrieve the resource ID
```cli
az servicebus namespace show -g '<your-event-hub-resource-group>' -n '<your-event-hub-name> --query id
```
assign roles 
```cli
az role assignment create --assignee "<user@domain>" \
--role "Azure Event Hubs Data Owner" \
--scope "<your-resource-id>"
```

2.2. [Connection String](https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-python-get-started-send?tabs=connection-string%2Croles-azure-cli#tabpanel_1_connection-string) is an easier way to establish and authorise the connection between Event Hubs and another application.

---
## Data Lake 
1. NFS 3.0 when creating the storage account

- Access Key - found it in the specific Azure Data Lake account, this is an easier solution to mount `Databricks` to `Azure Data Lake`
---
## Databricks
    to run spark job to do `join` and 'transformation'
-  [Mount Data Lake folder to Databricks](Databricks/accesskey_mount.ipynb) - this allows the synchronisation so that 'spark job' can access to `Data Lake files`

- [Spark on databricks](Databricks/spark_azure.ipynb)
 1. Define schema: `StructType` defines the schema for the data frame, with each field specified using the `StructField` type. This is to keep all columns in an order, and reduce size of the data by re-defining datatypes.
 2. Join job: read and join all JSON format files saved in Data Lakes 
 3. Transformation: [Turnover] = [Date removed] - [Date listed]

--- 
## Data Flow Management
 1. `raw folder` as hot-tier access, designed as a landing zone for all ingested data.
 2. `silver folder` as a hot-tier access, designed as a processed zone for all processed data.
 3. `archive folder` as a cold-tier access, to store those raw data which has been processed by [Spark job](./Databricks/spark_azure.ipynb). This can help reduce storage costs while still allowing us to access the JSON objects if needed.

Because Databricks storage doesn't support wildcard search, so it is not ideal to code within the spark job. So, Logic App is here to manage the Data Flow.
![Data Flow Management](https://trello.com/1/cards/63ec9e05b5774f777032a326/attachments/63ef059240cbe567e4601dd4/download/image.png)

---
---
---

# #To-do#

## Cosmos DB (Data Warehouse)

- Create an Azure Cosmos DB account: You can create an Azure Cosmos DB account that will be used to store the processed data. You can configure your Spark cluster to write the processed data to your Cosmos DB account using a Cosmos DB output connector.
- 
- 
- 
---

## API Management
- 
- 
- 








---
---
---
---
---
---
---
## Reference
- [Data Management life circle](https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-overview) enables hot-tier and cold-tier.

- `Create Create Secret Scope` https://mydatabricks-instance#secrets/createScope (change mydatabricks-instance into my instance name)- use this link to create a Secret Scope in `Databricks` so that the credentials will not expose when mounting `Azure Data Lake`
