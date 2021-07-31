## Overview
HubSpot is a powerful easy to use Contact Mangement(CRM), email marketing, live chat, forms and analytics platform. Its 
Built-in marketing analytics (email analytics, traffic analytics, and website analytics) make it easy to understand 
which sales and marketing actions driving the most success.
Ballerina connector for HubSpot CRM allows easy integration with HubSpot REST API via Ballerina language. 

This module supports HubSpot REST API `v3` version.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a HubSpot developer account
* Obtain tokens
    -  Use [this](https://knowledge.hubspot.com/integrations/how-do-i-get-my-hubspot-api-key?_ga=2.57958890.1140639136.1626730652-1097354510.1626409334) guide to obtain the API keys related to your account.
* Configure the connector with obtained tokens

## Quickstart
To use the HubSpot CRM Feedback connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import HubSpot CRM Feedback module
First, import the ballerinax/hubspot.crm.feedback module into the Ballerina project.
```ballerina
import ballerinax/hubspot.crm.feedback;
```

### Step 2: Configure the connection credentials
You can now make the connection configuration using the access token.
```ballerina
feedback:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

feedback:Client baseClient = check new Client(clientConfig);

```
### Step 3: List feedbacks

```ballerina
feedback:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error bEvent = baseClient->getPage();

if (bEvent is feedback:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging) {
    log:printInfo("Feedback list" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```