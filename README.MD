# Demo Overview
`AS` a Data Engineer, `I WANTED TO` build a SERVERLESS Implementation in Azure for managing Used Car Sales records, `SO THAT` it can provide other team members (Data Scientists or Data Analysts) to access the process data.

## Agile Project Management
* [Trello](https://trello.com/b/UCqOkRNO/de-demo)

## Tools
- MS Azure
- Terraform

## Languag
- Python
- SQL

----

## Data Source
>Dummy data for this demo, the reason beings that this demo is to stimulate the Scenario of <IoT data> or <web scraping>.

[Data Generator in Local](Stream/datagenerator_10s.ipynb): This Python Script to generate dummy JSON object every 10s - used car sales records, saved in [bronze data](Stream/bronze%20data/) folder. 

[Data Generator in Azure](Stream/datagenerator_azure.ipynb): This Python Script to generate dummy data, which will be designed into `Azure Logic App`

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

## Data Lake


[Create Create Secret Scope](https://adb-6040027147401400.0.azuredatabricks.net/?o=6040027147401400#secrets/createScope) - use this link to create a Secret Scope so that the credentials will not expose when mounting ADLS