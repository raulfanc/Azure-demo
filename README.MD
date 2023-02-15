# Demo Overview
`AS` a Data Engineer, `I WANTED TO` build a SERVERLESS infrastructure in Azure that simulates the behavior of a real-world big data system, `SO THAT` it can provide other team members (Data Scientists or Data Analysts) to access the processed data.

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

---
## Azure Set up
Using [Terraform](Terraform) to set up Azure Infrastructure and Resources.
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

- loading Libs Python
``` bash
pip install azure-eventhub
pip install azure-identity
pip install aiohttp
```

- Authentication
1. [ADD](https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-python-get-started-send?tabs=passwordless%2Croles-azure-cli#tabpanel_1_passwordless) (real-world application)

- retrieve the resource ID
```cli
az servicebus namespace show -g '<your-event-hub-resource-group>' -n '<your-event-hub-name> --query id
```
- assign roles 
```cli
az role assignment create --assignee "<user@domain>" \
--role "Azure Event Hubs Data Owner" \
--scope "<your-resource-id>"
```

2. [Connection String](https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-python-get-started-send?tabs=connection-string%2Croles-azure-cli#tabpanel_1_connection-string)

---
## Data Lake 
- NFS 3.0 when creating the storage account

- Access Key - found it in the specific Azure Data Lake account, this is an easier solution to mount `Databricks` to `Azure Data Lake`
---
## Databricks
    to run spark job to do `join` and 'transformation'
-  [mount Data Lake folder to Databricks](Databricks/accesskey_mount.ipynb) - this allows the synchronisation so that 'spark job' can access to `Data Lake files`
- [spark on databricks](Databricks/spark_azure.ipynb)
 1. Define schema: `StructType` defines the schema for the data frame, with each field specified using the `StructField` type. This is to keep all columns in an order, and reduce size of the data by re-defining datatypes.
 2. Join job: read and join all JSON format files saved in Data Lakes 
 3. Transformation: [Turnover] = [Date removed] - [Date listed]











## To do
[Data Management life circle](https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-overview) enables hot-tier and cold-tier.

- [Create Create Secret Scope](https://adb-6040027147401400.0.azuredatabricks.net/?o=6040027147401400#secrets/createScope) - use this link to create a Secret Scope in `Databricks` so that the credentials will not expose when mounting `Azure Data Lake`

- Create a Spark cluster: You can create an Azure HDInsight Spark cluster that will be used to process your JSON objects. You can configure your Spark cluster to read the JSON objects from your Data Lake Storage account, perform the necessary data transformations, and write the results to a separate Data Lake Storage account that will be used for storing the processed data.
- Create an Azure Cosmos DB account: You can create an Azure Cosmos DB account that will be used to store the processed data. You can configure your Spark cluster to write the processed data to your Cosmos DB account using a Cosmos DB output connector.
- Configure cold storage tier for JSON objects: You can configure your Data Lake Storage account to automatically move the original JSON objects to a cold storage tier, such as Azure Archive Storage, after a certain period of time. This can help reduce storage costs while still allowing you to access the JSON objects if needed.