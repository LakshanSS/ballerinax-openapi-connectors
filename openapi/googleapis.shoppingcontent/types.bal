// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

public type UnitInvoiceAdditionalCharge record {
    Amount additionalChargeAmount?;
    # Deprecated.
    Promotion[] additionalChargePromotions?;
    # [required] Type of the additional charge. Acceptable values are: - "`shipping`" 
    string 'type?;
};

public type OrderLegacyPromotionBenefit record {
    Price discount?;
    # The OfferId(s) that were purchased in this order and map to this specific benefit of the promotion.
    string[] offerIds?;
    # Further describes the benefit of the promotion. Note that we will expand on this enumeration as we support new promotion sub-types. Acceptable values are: - "`buyMGetMoneyOff`" - "`buyMGetNMoneyOff`" - "`buyMGetNPercentOff`" - "`buyMGetPercentOff`" - "`freeGift`" - "`freeGiftWithItemId`" - "`freeGiftWithValue`" - "`freeOvernightShipping`" - "`freeShipping`" - "`freeTwoDayShipping`" - "`moneyOff`" - "`percentageOff`" - "`rewardPoints`" - "`salePrice`" 
    string subType?;
    Price taxImpact?;
    # Describes whether the promotion applies to products (e.g. 20% off) or to shipping (e.g. Free Shipping). Acceptable values are: - "`product`" - "`shipping`" 
    string 'type?;
};

public type OrdersCreateTestReturnResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersCreateTestReturnResponse".
    string kind?;
    # The ID of the newly created test order return.
    string returnId?;
};

public type AccountstatusesCustomBatchRequest record {
    # The request entries to be processed in the batch.
    AccountstatusesCustomBatchRequestEntry[] entries?;
};

#  Required product attributes are primarily defined by the products data specification. See the Products Data Specification Help Center article for information. Product data. After inserting, updating, or deleting a product, it may take several minutes before changes take effect.
public type Product record {
    # Additional URLs of images of the item.
    string[] additionalImageLinks?;
    # Additional categories of the item (formatted as in products data specification).
    string[] additionalProductTypes?;
    # Should be set to true if the item is targeted towards adults.
    boolean adult?;
    # Used to group items in an arbitrary way. Only for CPA%, discouraged otherwise.
    string adwordsGrouping?;
    # Similar to adwords_grouping, but only works on CPC.
    string[] adwordsLabels?;
    # Allows advertisers to override the item URL when the product is shown within the context of Product Ads.
    string adwordsRedirect?;
    # Target age group of the item. Acceptable values are: - "`adult`" - "`infant`" - "`kids`" - "`newborn`" - "`toddler`" - "`youngAdult`" 
    string ageGroup?;
    # Deprecated. Do not use.
    ProductAspect[] aspects?;
    # Availability status of the item. Acceptable values are: - "`in stock`" - "`out of stock`" - "`preorder`" 
    string availability?;
    # The day a pre-ordered product becomes available for delivery, in ISO 8601 format.
    string availabilityDate?;
    # Brand of the item.
    string brand?;
    # URL for the canonical version of your item's landing page.
    string canonicalLink?;
    # Required. The item's channel (online or local). Acceptable values are: - "`local`" - "`online`" 
    string 'channel?;
    # Color of the item.
    string color?;
    # Condition or state of the item. Acceptable values are: - "`new`" - "`refurbished`" - "`used`" 
    string condition?;
    # Required. The two-letter ISO 639-1 language code for the item.
    string contentLanguage?;
    Price costOfGoodsSold?;
    # A list of custom (merchant-provided) attributes. It can also be used for submitting any attribute of the feed specification in its generic form (e.g., `{ "name": "size type", "value": "regular" }`). This is useful for submitting attributes not explicitly exposed by the API, such as additional attributes used for Buy on Google (formerly known as Shopping Actions).
    CustomAttribute[] customAttributes?;
    # A list of custom (merchant-provided) custom attribute groups.
    CustomGroup[] customGroups?;
    # Custom label 0 for custom grouping of items in a Shopping campaign.
    string customLabel0?;
    # Custom label 1 for custom grouping of items in a Shopping campaign.
    string customLabel1?;
    # Custom label 2 for custom grouping of items in a Shopping campaign.
    string customLabel2?;
    # Custom label 3 for custom grouping of items in a Shopping campaign.
    string customLabel3?;
    # Custom label 4 for custom grouping of items in a Shopping campaign.
    string customLabel4?;
    # Description of the item.
    string description?;
    # Specifies the intended destinations for the product.
    ProductDestination[] destinations?;
    # An identifier for an item for dynamic remarketing campaigns.
    string displayAdsId?;
    # URL directly to your item's landing page for dynamic remarketing campaigns.
    string displayAdsLink?;
    # Advertiser-specified recommendations.
    string[] displayAdsSimilarIds?;
    # Title of an item for dynamic remarketing campaigns.
    string displayAdsTitle?;
    # Offer margin for dynamic remarketing campaigns.
    float displayAdsValue?;
    # The energy efficiency class as defined in EU directive 2010/30/EU. Acceptable values are: - "`A`" - "`A+`" - "`A++`" - "`A+++`" - "`B`" - "`C`" - "`D`" - "`E`" - "`F`" - "`G`" 
    string energyEfficiencyClass?;
    # Date on which the item should expire, as specified upon insertion, in ISO 8601 format. The actual expiration date in Google Shopping is exposed in `productstatuses` as `googleExpirationDate` and might be earlier if `expirationDate` is too far in the future.
    string expirationDate?;
    # Target gender of the item. Acceptable values are: - "`female`" - "`male`" - "`unisex`" 
    string gender?;
    # Google's category of the item (see [Google product taxonomy](https://support.google.com/merchants/answer/1705911)). When querying products, this field will contain the user provided value. There is currently no way to get back the auto assigned google product categories through the API.
    string googleProductCategory?;
    # Global Trade Item Number (GTIN) of the item.
    string gtin?;
    # The REST ID of the product. Content API methods that operate on products take this as their `productId` parameter. The REST ID for a product is of the form channel:contentLanguage: targetCountry: offerId.
    string id?;
    # False when the item does not have unique product identifiers appropriate to its category, such as GTIN, MPN, and brand. Required according to the Unique Product Identifier Rules for all target countries except for Canada.
    boolean identifierExists?;
    # URL of an image of the item.
    string imageLink?;
    Installment installment?;
    # Whether the item is a merchant-defined bundle. A bundle is a custom grouping of different products sold by a merchant for a single price.
    boolean isBundle?;
    # Shared identifier for all variants of the same product.
    string itemGroupId?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#product`"
    string kind?;
    # URL directly linking to your item's page on your website.
    string link?;
    LoyaltyPoints loyaltyPoints?;
    # The material of which the item is made.
    string material?;
    # The energy efficiency class as defined in EU directive 2010/30/EU. Acceptable values are: - "`A`" - "`A+`" - "`A++`" - "`A+++`" - "`B`" - "`C`" - "`D`" - "`E`" - "`F`" - "`G`" 
    string maxEnergyEfficiencyClass?;
    # Maximal product handling time (in business days).
    string maxHandlingTime?;
    # The energy efficiency class as defined in EU directive 2010/30/EU. Acceptable values are: - "`A`" - "`A+`" - "`A++`" - "`A+++`" - "`B`" - "`C`" - "`D`" - "`E`" - "`F`" - "`G`" 
    string minEnergyEfficiencyClass?;
    # Minimal product handling time (in business days).
    string minHandlingTime?;
    # URL for the mobile-optimized version of your item's landing page.
    string mobileLink?;
    # Manufacturer Part Number (MPN) of the item.
    string mpn?;
    # The number of identical products in a merchant-defined multipack.
    string multipack?;
    # Required. A unique identifier for the item. Leading and trailing whitespaces are stripped and multiple whitespaces are replaced by a single whitespace upon submission. Only valid unicode characters are accepted. See the products feed specification for details. *Note:* Content API methods that operate on products take the REST ID of the product, *not* this identifier.
    string offerId?;
    # Deprecated.
    boolean onlineOnly?;
    # The item's pattern (e.g. polka dots).
    string pattern?;
    Price price?;
    # Your category of the item (formatted as in products data specification).
    string productType?;
    # The unique ID of a promotion.
    string[] promotionIds?;
    Price salePrice?;
    # Date range during which the item is on sale (see products data specification ).
    string salePriceEffectiveDate?;
    # The quantity of the product that is available for selling on Google. Supported only for online products.
    string sellOnGoogleQuantity?;
    # Shipping rules.
    ProductShipping[] shipping?;
    ProductShippingDimension shippingHeight?;
    # The shipping label of the product, used to group product in account-level shipping rules.
    string shippingLabel?;
    ProductShippingDimension shippingLength?;
    ProductShippingWeight shippingWeight?;
    ProductShippingDimension shippingWidth?;
    # System in which the size is specified. Recommended for apparel items. Acceptable values are: - "`AU`" - "`BR`" - "`CN`" - "`DE`" - "`EU`" - "`FR`" - "`IT`" - "`JP`" - "`MEX`" - "`UK`" - "`US`" 
    string sizeSystem?;
    # The cut of the item. Recommended for apparel items. Acceptable values are: - "`big and tall`" - "`maternity`" - "`oversize`" - "`petite`" - "`plus`" - "`regular`" 
    string sizeType?;
    # Size of the item. Only one value is allowed. For variants with different sizes, insert a separate product for each size with the same `itemGroupId` value (see size definition).
    string[] sizes?;
    # The source of the offer, i.e., how the offer was created. Acceptable values are: - "`api`" - "`crawl`" - "`feed`" 
    string 'source?;
    # Required. The CLDR territory code for the item.
    string targetCountry?;
    # Tax information.
    ProductTax[] taxes?;
    # Title of the item.
    string title?;
    ProductUnitPricingBaseMeasure unitPricingBaseMeasure?;
    ProductUnitPricingMeasure unitPricingMeasure?;
    # Deprecated. The read-only list of intended destinations which passed validation.
    string[] validatedDestinations?;
    # Read-only warnings.
    Error[] warnings?;
};

# An error occurring in the feed, like "invalid price".
public type DatafeedStatusError record {
    # The code of the error, e.g., "validation/invalid_value".
    string code?;
    # The number of occurrences of the error in the feed.
    string count?;
    # A list of example occurrences of the error, grouped by product.
    DatafeedStatusExample[] examples?;
    # The error message, e.g., "Invalid price".
    string message?;
};

public type OrderMerchantProvidedAnnotation record {
    # Key for additional merchant provided (as key-value pairs) annotation about the line item.
    string 'key?;
    # Value for additional merchant provided (as key-value pairs) annotation about the line item.
    string value?;
};

public type HolidayCutoff record {
    # Date of the order deadline, in ISO 8601 format. E.g. "2016-11-29" for 29th November 2016. Required.
    string deadlineDate?;
    # Hour of the day on the deadline date until which the order has to be placed to qualify for the delivery guarantee. Possible values are: 0 (midnight), 1, ..., 12 (noon), 13, ..., 23. Required.
    int deadlineHour?;
    # Timezone identifier for the deadline hour. A list of identifiers can be found in the AdWords API documentation. E.g. "Europe/Zurich". Required.
    string deadlineTimezone?;
    # Unique identifier for the holiday. Required.
    string holidayId?;
    # Date on which the deadline will become visible to consumers in ISO 8601 format. E.g. "2016-10-31" for 31st October 2016. Required.
    string visibleFromDate?;
};

public type OrdersCustomBatchRequestEntryUpdateShipment record {
    # The carrier handling the shipment. Not updated if missing. See `shipments[].carrier` in the Orders resource representation for a list of acceptable values.
    string carrier?;
    # Date on which the shipment has been delivered, in ISO 8601 format. Optional and can be provided only if `status` is `delivered`.
    string deliveryDate?;
    # The ID of the shipment.
    string shipmentId?;
    # New status for the shipment. Not updated if missing. Acceptable values are: - "`delivered`" - "`undeliverable`" - "`readyForPickup`" 
    string status?;
    # The tracking ID for the shipment. Not updated if missing.
    string trackingId?;
};

public type ShippingsettingsGetSupportedPickupServicesResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#shippingsettingsGetSupportedPickupServicesResponse".
    string kind?;
    # A list of supported pickup services. May be empty.
    PickupServicesPickupService[] pickupServices?;
};

public type OrdersCustomBatchRequestEntryCreateTestReturnReturnItem record {
    # The ID of the line item to return.
    string lineItemId?;
    # Quantity that is returned.
    int quantity?;
};

public type AccountsCustomBatchRequestEntryLinkRequest record {
    # Action to perform for this link. The `"request"` action is only available to select merchants. Acceptable values are: - "`approve`" - "`remove`" - "`request`" 
    string action?;
    # Type of the link between the two accounts. Acceptable values are: - "`channelPartner`" - "`eCommercePlatform`" 
    string linkType?;
    # The ID of the linked account.
    string linkedAccountId?;
};

# A batch entry encoding a single non-batch accounttax request.
public type AccounttaxCustomBatchRequestEntry record {
    # The ID of the account for which to get/update account tax settings.
    string accountId?;
    # The tax settings of a merchant account. All methods require the admin role.
    AccountTax accountTax?;
    # An entry ID, unique within the batch request.
    int batchId?;
    # The ID of the managing account.
    string merchantId?;
    # The method of the batch entry. Acceptable values are: - "`get`" - "`update`" 
    string method?;
};

public type OrdersReturnLineItemResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersReturnLineItemResponse".
    string kind?;
};

public type OrdersCancelRequest record {
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
    # The reason for the cancellation. Acceptable values are: - "`customerInitiatedCancel`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`noInventory`" - "`other`" - "`priceError`" - "`shippingPriceError`" - "`taxError`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type OrdersUpdateLineItemShippingDetailsRequest record {
    # Updated delivery by date, in ISO 8601 format. If not specified only ship by date is updated. Provided date should be within 1 year timeframe and can not be a date in the past.
    string deliverByDate?;
    # The ID of the line item to set metadata. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
    # The ID of the product to set metadata. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # Updated ship by date, in ISO 8601 format. If not specified only deliver by date is updated. Provided date should be within 1 year timeframe and can not be a date in the past.
    string shipByDate?;
};

public type OrderPaymentMethod record {
    OrderAddress billingAddress?;
    # The card expiration month (January = 1, February = 2 etc.).
    int expirationMonth?;
    # The card expiration year (4-digit, e.g. 2015).
    int expirationYear?;
    # The last four digits of the card number.
    string lastFourDigits?;
    # The billing phone number.
    string phoneNumber?;
    # The type of instrument. Acceptable values are: - "`AMEX`" - "`DISCOVER`" - "`JCB`" - "`MASTERCARD`" - "`UNIONPAY`" - "`VISA`" - "``" 
    string 'type?;
};

public type OrdersUpdateShipmentResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersUpdateShipmentResponse".
    string kind?;
};

# A batch entry encoding a single non-batch accounts request.
public type AccountsCustomBatchRequestEntry record {
    # Account data. After the creation of a new account it may take a few minutes before it is fully operational. The methods delete, insert, and update require the admin role.
    Account account?;
    # The ID of the targeted account. Only defined if the method is not `insert`.
    string accountId?;
    # An entry ID, unique within the batch request.
    int batchId?;
    # Whether the account should be deleted if the account has offers. Only applicable if the method is `delete`.
    boolean force?;
    # Label IDs for the 'updatelabels' request.
    string[] labelIds?;
    AccountsCustomBatchRequestEntryLinkRequest linkRequest?;
    # The ID of the managing account.
    string merchantId?;
    # The method of the batch entry. Acceptable values are: - "`claimWebsite`" - "`delete`" - "`get`" - "`insert`" - "`link`" - "`update`" 
    string method?;
    # Only applicable if the method is `claimwebsite`. Indicates whether or not to take the claim from another account in case there is a conflict.
    boolean overwrite?;
};

public type WarehouseBasedDeliveryTime record {
    # Required. Carrier, such as `"UPS"` or `"Fedex"`. The list of supported carriers can be retrieved via the `listSupportedCarriers` method.
    string carrier?;
    # Required. Carrier service, such as `"ground"` or `"2 days"`. The list of supported services for a carrier can be retrieved via the `listSupportedCarriers` method. The name of the service must be in the eddSupportedServices list.
    string carrierService?;
    # Required. Shipping origin's state.
    string originAdministrativeArea?;
    # Required. Shipping origin's city.
    string originCity?;
    # Required. Shipping origin's country represented as a [CLDR territory code](http://www.unicode.org/repos/cldr/tags/latest/common/main/en.xml).
    string originCountry?;
    # Required. Shipping origin.
    string originPostalCode?;
    # Shipping origin's street address
    string originStreetAddress?;
};

public type OrdersSetLineItemMetadataRequest record {
    OrderMerchantProvidedAnnotation[] annotations?;
    # The ID of the line item to set metadata. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
    # The ID of the product to set metadata. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
};

public type PosCustomBatchRequest record {
    # The request entries to be processed in the batch.
    PosCustomBatchRequestEntry[] entries?;
};

public type AccountStatusProducts record {
    # The channel the data applies to. Acceptable values are: - "`local`" - "`online`" 
    string 'channel?;
    # The country the data applies to.
    string country?;
    # The destination the data applies to.
    string destination?;
    # List of item-level issues.
    AccountStatusItemLevelIssue[] itemLevelIssues?;
    AccountStatusStatistics statistics?;
};

# Store resource.
public type PosStore record {
    # Identifies what kind of resource this is. Value: the fixed string "`content#posStore`"
    string kind?;
    # Required. The street address of the store.
    string storeAddress?;
    # Required. A store identifier that is unique for the given merchant.
    string storeCode?;
};

public type Inventory record {
    # The availability of the product. Acceptable values are: - "`in stock`" - "`out of stock`" - "`preorder`" 
    string availability?;
    # Custom label 0 for custom grouping of items in a Shopping campaign. Only supported for online products.
    string customLabel0?;
    # Custom label 1 for custom grouping of items in a Shopping campaign. Only supported for online products.
    string customLabel1?;
    # Custom label 2 for custom grouping of items in a Shopping campaign. Only supported for online products.
    string customLabel2?;
    # Custom label 3 for custom grouping of items in a Shopping campaign. Only supported for online products.
    string customLabel3?;
    # Custom label 3 for custom grouping of items in a Shopping campaign. Only supported for online products.
    string customLabel4?;
    Installment installment?;
    # The instore product location. Supported only for local products.
    string instoreProductLocation?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#inventory`"
    string kind?;
    LoyaltyPoints loyaltyPoints?;
    InventoryPickup pickup?;
    Price price?;
    # The quantity of the product. Must be equal to or greater than zero. Supported only for local products.
    int quantity?;
    Price salePrice?;
    # A date range represented by a pair of ISO 8601 dates separated by a space, comma, or slash. Both dates might be specified as 'null' if undecided.
    string salePriceEffectiveDate?;
    # The quantity of the product that is available for selling on Google. Supported only for online products.
    int sellOnGoogleQuantity?;
};

public type PosInventoryRequest record {
    # Required. The two-letter ISO 639-1 language code for the item.
    string contentLanguage?;
    # Global Trade Item Number.
    string gtin?;
    # Required. A unique identifier for the item.
    string itemId?;
    Price price?;
    # Required. The available quantity of the item.
    string quantity?;
    # Required. The identifier of the merchant's store. Either a `storeCode` inserted via the API or the code of the store in Google My Business.
    string storeCode?;
    # Required. The CLDR territory code for the item.
    string targetCountry?;
    # Required. The inventory timestamp, in ISO 8601 format.
    string timestamp?;
};

public type OrdersCustomBatchRequestEntryReturnLineItem record {
    # The ID of the line item to return. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the product to return. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # The quantity to return.
    int quantity?;
    # The reason for the return. Acceptable values are: - "`customerDiscretionaryReturn`" - "`customerInitiatedMerchantCancel`" - "`deliveredTooLate`" - "`expiredItem`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`other`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`qualityNotAsExpected`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" - "`wrongProductShipped`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

# A batch entry encoding a single non-batch accountstatuses response.
public type AccountstatusesCustomBatchResponseEntry record {
    # The status of an account, i.e., information about its products, which is computed offline and not returned immediately at insertion time.
    AccountStatus accountStatus?;
    # The ID of the request entry this entry responds to.
    int batchId?;
    # A list of errors returned by a failed batch entry.
    Errors errors?;
};

public type MerchantOrderReturnItem record {
    CustomerReturnReason customerReturnReason?;
    # Product level item ID. If the returned items are of the same product, they will have the same ID.
    string itemId?;
    RefundReason merchantReturnReason?;
    OrderLineItemProduct product?;
    # IDs of the return shipments that this return item belongs to.
    string[] returnShipmentIds?;
    # State of the item. Acceptable values are: - "`canceled`" - "`new`" - "`received`" - "`refunded`" - "`rejected`" 
    string state?;
};

public type OrdersCustomBatchRequest record {
    # The request entries to be processed in the batch.
    OrdersCustomBatchRequestEntry[] entries?;
};

public type AccountStatusExampleItem record {
    string itemId?;
    string link?;
    string submittedValue?;
    string title?;
    string valueOnLandingPage?;
};

public type OrdersCustomBatchResponseEntry record {
    # The ID of the request entry this entry responds to.
    int batchId?;
    # A list of errors returned by a failed batch entry.
    Errors errors?;
    # The status of the execution. Only defined if 1. the request was successful; and 2. the method is not `get`, `getByMerchantOrderId`, or one of the test methods. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#ordersCustomBatchResponseEntry`"
    string kind?;
    # Order. Production access (all methods) requires the order manager role. Sandbox access does not.
    Order 'order?;
};

public type OrderShipmentLineItemShipment record {
    # The ID of the line item that is shipped. This value is assigned by Google when an order is created. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the product to ship. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # The quantity that is shipped.
    int quantity?;
};

public type OrderRefund record {
    # The actor that created the refund. Acceptable values are: - "`customer`" - "`googleBot`" - "`googleCustomerService`" - "`googlePayments`" - "`googleSabre`" - "`merchant`" 
    string actor?;
    Price amount?;
    # Date on which the item has been created, in ISO 8601 format.
    string creationDate?;
    # The reason for the refund. Acceptable values are: - "`adjustment`" - "`autoPostInternal`" - "`autoPostInvalidBillingAddress`" - "`autoPostNoInventory`" - "`autoPostPriceError`" - "`autoPostUndeliverableShippingAddress`" - "`couponAbuse`" - "`courtesyAdjustment`" - "`customerCanceled`" - "`customerDiscretionaryReturn`" - "`customerInitiatedMerchantCancel`" - "`customerSupportRequested`" - "`deliveredLateByCarrier`" - "`deliveredTooLate`" - "`expiredItem`" - "`failToPushOrderGoogleError`" - "`failToPushOrderMerchantError`" - "`failToPushOrderMerchantFulfillmentError`" - "`failToPushOrderToMerchant`" - "`failToPushOrderToMerchantOutOfStock`" - "`feeAdjustment`" - "`invalidCoupon`" - "`lateShipmentCredit`" - "`malformedShippingAddress`" - "`merchantDidNotShipOnTime`" - "`noInventory`" - "`orderTimeout`" - "`other`" - "`paymentAbuse`" - "`paymentDeclined`" - "`priceAdjustment`" - "`priceError`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`promoReallocation`" - "`qualityNotAsExpected`" - "`returnRefundAbuse`" - "`shippingCostAdjustment`" - "`shippingPriceError`" - "`taxAdjustment`" - "`taxError`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" - "`wrongProductShipped`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type LiasettingsRequestInventoryVerificationResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#liasettingsRequestInventoryVerificationResponse".
    string kind?;
};

public type OrdersAcknowledgeResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersAcknowledgeResponse".
    string kind?;
};

public type PostalCodeGroup record {
    # The CLDR territory code of the country the postal code group applies to. Required.
    string country?;
    # The name of the postal code group, referred to in headers. Required.
    string name?;
    # A range of postal codes. Required.
    PostalCodeRange[] postalCodeRanges?;
};

public type InvoiceSummaryAdditionalChargeSummary record {
    Amount totalAmount?;
    # [required] Type of the additional charge. Acceptable values are: - "`shipping`" 
    string 'type?;
};

public type OrdersCreateTestOrderResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersCreateTestOrderResponse".
    string kind?;
    # The ID of the newly created test order.
    string orderId?;
};

public type AccountsListResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#accountsListResponse".
    string kind?;
    # The token for the retrieval of the next page of accounts.
    string nextPageToken?;
    Account[] resources?;
};

public type CutoffTime record {
    # Hour of the cutoff time until which an order has to be placed to be processed in the same day. Required.
    int hour?;
    # Minute of the cutoff time until which an order has to be placed to be processed in the same day. Required.
    int minute?;
    # Timezone identifier for the cutoff time. A list of identifiers can be found in the AdWords API documentation. E.g. "Europe/Zurich". Required.
    string timezone?;
};

public type OrdersListResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersListResponse".
    string kind?;
    # The token for the retrieval of the next page of orders.
    string nextPageToken?;
    Order[] resources?;
};

public type OrdersCreateTestOrderRequest record {
    # The CLDR territory code of the country of the test order to create. Affects the currency and addresses of orders created via `template_name`, or the addresses of orders created via `test_order`. Acceptable values are: - "`US`" - "`FR`" Defaults to `US`.
    string country?;
    # The test order template to use. Specify as an alternative to `testOrder` as a shortcut for retrieving a template and then creating an order using that template. Acceptable values are: - "`template1`" - "`template1a`" - "`template1b`" - "`template2`" - "`template3`" 
    string templateName?;
    TestOrder testOrder?;
};

public type RateGroup record {
    # A list of shipping labels defining the products to which this rate group applies to. This is a disjunction: only one of the labels has to match for the rate group to apply. May only be empty for the last rate group of a service. Required.
    string[] applicableShippingLabels?;
    # A list of carrier rates that can be referred to by `mainTable` or `singleValue`.
    CarrierRate[] carrierRates?;
    Table mainTable?;
    # Name of the rate group. Optional. If set has to be unique within shipping service.
    string name?;
    # The single value of a rate group or the value of a rate group table's cell. Exactly one of `noShipping`, `flatRate`, `pricePercentage`, `carrierRateName`, `subtableName` must be set.
    Value singleValue?;
    # A list of subtables referred to by `mainTable`. Can only be set if `mainTable` is set.
    Table[] subtables?;
};

public type TestOrderLineItem record {
    TestOrderLineItemProduct product?;
    # Required. Number of items ordered.
    int quantityOrdered?;
    OrderLineItemReturnInfo returnInfo?;
    OrderLineItemShippingDetails shippingDetails?;
    Price unitTax?;
};

# A batch entry encoding a single non-batch accountstatuses request.
public type AccountstatusesCustomBatchRequestEntry record {
    # The ID of the (sub-)account whose status to get.
    string accountId?;
    # An entry ID, unique within the batch request.
    int batchId?;
    # If set, only issues for the specified destinations are returned, otherwise only issues for the Shopping destination.
    string[] destinations?;
    # The ID of the managing account.
    string merchantId?;
    # The method of the batch entry. Acceptable values are: - "`get`" 
    string method?;
};

public type OrderPickupDetails record {
    OrderAddress address?;
    # Collectors authorized to pick up shipment from the pickup location.
    OrderPickupDetailsCollector[] collectors?;
    # ID of the pickup location.
    string locationId?;
};

public type OrdersCustomBatchRequestEntryReturnRefundLineItem record {
    Price amountPretax?;
    Price amountTax?;
    # The ID of the line item to return. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the product to return. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # The quantity to return and refund.
    int quantity?;
    # The reason for the return. Acceptable values are: - "`customerDiscretionaryReturn`" - "`customerInitiatedMerchantCancel`" - "`deliveredTooLate`" - "`expiredItem`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`other`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`qualityNotAsExpected`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" - "`wrongProductShipped`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type Installment record {
    Price amount?;
    # The number of installments the buyer has to pay.
    string months?;
};

public type LiasettingsCustomBatchResponse record {
    # The result of the execution of the batch requests.
    LiasettingsCustomBatchResponseEntry[] entries?;
    # Identifies what kind of resource this is. Value: the fixed string "content#liasettingsCustomBatchResponse".
    string kind?;
};

public type OrderinvoicesCreateChargeInvoiceRequest record {
    # [required] The ID of the invoice.
    string invoiceId?;
    InvoiceSummary invoiceSummary?;
    # [required] Invoice details per line item.
    ShipmentInvoiceLineItemInvoice[] lineItemInvoices?;
    # [required] The ID of the operation, unique across all operations for a given order.
    string operationId?;
    # [required] ID of the shipment group. It is assigned by the merchant in the `shipLineItems` method and is used to group multiple line items that have the same kind of shipping charges.
    string shipmentGroupId?;
};

public type GmbAccountsGmbAccount record {
    # The email which identifies the GMB account.
    string email?;
    # Number of listings under this account.
    string listingCount?;
    # The name of the GMB account.
    string name?;
    # The type of the GMB account (User or Business).
    string 'type?;
};

public type LiasettingsGetAccessibleGmbAccountsResponse record {
    # The ID of the Merchant Center account.
    string accountId?;
    # A list of GMB accounts which are available to the merchant.
    GmbAccountsGmbAccount[] gmbAccounts?;
    # Identifies what kind of resource this is. Value: the fixed string "content#liasettingsGetAccessibleGmbAccountsResponse".
    string kind?;
};

# The status of a product, i.e., information about a product computed asynchronously.
public type ProductStatus record {
    # Date on which the item has been created, in ISO 8601 format.
    string creationDate?;
    # DEPRECATED - never populated
    ProductStatusDataQualityIssue[] dataQualityIssues?;
    # The intended destinations for the product.
    ProductStatusDestinationStatus[] destinationStatuses?;
    # Date on which the item expires in Google Shopping, in ISO 8601 format.
    string googleExpirationDate?;
    # A list of all issues associated with the product.
    ProductStatusItemLevelIssue[] itemLevelIssues?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#productStatus`"
    string kind?;
    # Date on which the item has been last updated, in ISO 8601 format.
    string lastUpdateDate?;
    # The link to the product.
    string link?;
    #  Required product attributes are primarily defined by the products data specification. See the Products Data Specification Help Center article for information. Product data. After inserting, updating, or deleting a product, it may take several minutes before changes take effect.
    Product product?;
    # The ID of the product for which status is reported.
    string productId?;
    # The title of the product.
    string title?;
};

public type OrdersCustomBatchRequestEntryUpdateLineItemShippingDetails record {
    # Updated delivery by date, in ISO 8601 format. If not specified only ship by date is updated. Provided date should be within 1 year timeframe and can not be a date in the past.
    string deliverByDate?;
    # The ID of the line item to set metadata. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the product to set metadata. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # Updated ship by date, in ISO 8601 format. If not specified only deliver by date is updated. Provided date should be within 1 year timeframe and can not be a date in the past.
    string shipByDate?;
};

public type OrderLineItemShippingDetailsMethod record {
    # The carrier for the shipping. Optional. See `shipments[].carrier` for a list of acceptable values.
    string carrier?;
    # Required. Maximum transit time.
    int maxDaysInTransit?;
    # Required. The name of the shipping method.
    string methodName?;
    # Required. Minimum transit time.
    int minDaysInTransit?;
};

public type AccountUser record {
    # Whether user is an admin.
    boolean admin?;
    # User's email address.
    string emailAddress?;
    # Whether user is an order manager.
    boolean orderManager?;
    # Whether user can access payment statements.
    boolean paymentsAnalyst?;
    # Whether user can manage payment settings.
    boolean paymentsManager?;
};

public type LiasettingsListPosDataProvidersResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#liasettingsListPosDataProvidersResponse".
    string kind?;
    # The list of POS data providers for each eligible country
    PosDataProviders[] posDataProviders?;
};

public type LiasettingsSetPosDataProviderResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#liasettingsSetPosDataProviderResponse".
    string kind?;
};

public type ProductShippingWeight record {
    # The unit of value.
    string unit?;
    # The weight of the product used to calculate the shipping cost of the item.
    float value?;
};

public type CarrierRate record {
    # Carrier service, such as `"UPS"` or `"Fedex"`. The list of supported carriers can be retrieved via the `getSupportedCarriers` method. Required.
    string carrierName?;
    # Carrier service, such as `"ground"` or `"2 days"`. The list of supported services for a carrier can be retrieved via the `getSupportedCarriers` method. Required.
    string carrierService?;
    Price flatAdjustment?;
    # Name of the carrier rate. Must be unique per rate group. Required.
    string name?;
    # Shipping origin for this carrier rate. Required.
    string originPostalCode?;
    # Multiplicative shipping rate modifier as a number in decimal notation. Can be negative. For example `"5.4"` increases the rate by 5.4%, `"-3"` decreases the rate by 3%. Optional.
    string percentageAdjustment?;
};

public type CustomerReturnReason record {
    # Description of the reason.
    string description?;
    # Code of the return reason. Acceptable values are: - "`betterPriceFound`" - "`changedMind`" - "`damagedOrDefectiveItem`" - "`didNotMatchDescription`" - "`doesNotFit`" - "`expiredItem`" - "`incorrectItemReceived`" - "`noLongerNeeded`" - "`notSpecified`" - "`orderedWrongItem`" - "`other`" - "`qualityNotExpected`" - "`receivedTooLate`" - "`undeliverable`" 
    string reasonCode?;
};

public type ShippingsettingsCustomBatchRequest record {
    # The request entries to be processed in the batch.
    ShippingsettingsCustomBatchRequestEntry[] entries?;
};

public type ProductStatusDestinationStatus record {
    # Whether the approval status might change due to further processing.
    boolean approvalPending?;
    # The destination's approval status. Acceptable values are: - "`approved`" - "`disapproved`" 
    string approvalStatus?;
    # The name of the destination
    string destination?;
    # Provided for backward compatibility only. Always set to "required". Acceptable values are: - "`default`" - "`excluded`" - "`optional`" - "`required`" 
    string intention?;
};

# A batch entry encoding a single non-batch inventory response.
public type InventoryCustomBatchResponseEntry record {
    # The ID of the request entry this entry responds to.
    int batchId?;
    # A list of errors returned by a failed batch entry.
    Errors errors?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#inventoryCustomBatchResponseEntry`"
    string kind?;
};

public type OrderAddress record {
    # CLDR country code (e.g. "US").
    string country?;
    # Strings representing the lines of the printed label for mailing the order, for example: John Smith 1600 Amphitheatre Parkway Mountain View, CA, 94043 United States 
    string[] fullAddress?;
    # Whether the address is a post office box.
    boolean isPostOfficeBox?;
    # City, town or commune. May also include dependent localities or sublocalities (e.g. neighborhoods or suburbs).
    string locality?;
    # Postal Code or ZIP (e.g. "94043").
    string postalCode?;
    # Name of the recipient.
    string recipientName?;
    # Top-level administrative subdivision of the country. For example, a state like California ("CA") or a province like Quebec ("QC").
    string region?;
    # Street-level part of the address.
    string[] streetAddress?;
};

# A batch entry encoding a single non-batch accounttax response.
public type AccounttaxCustomBatchResponseEntry record {
    # The tax settings of a merchant account. All methods require the admin role.
    AccountTax accountTax?;
    # The ID of the request entry this entry responds to.
    int batchId?;
    # A list of errors returned by a failed batch entry.
    Errors errors?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#accounttaxCustomBatchResponseEntry`"
    string kind?;
};

public type OrderinvoicesCreateRefundInvoiceRequest record {
    # [required] The ID of the invoice.
    string invoiceId?;
    # [required] The ID of the operation, unique across all operations for a given order.
    string operationId?;
    OrderinvoicesCustomBatchRequestEntryCreateRefundInvoiceRefundOption refundOnlyOption?;
    OrderinvoicesCustomBatchRequestEntryCreateRefundInvoiceReturnOption returnOption?;
    # Invoice details for different shipment groups.
    ShipmentInvoice[] shipmentInvoices?;
};

public type UnitInvoiceTaxLine record {
    Price taxAmount?;
    # Optional name of the tax type. This should only be provided if `taxType` is `otherFeeTax`.
    string taxName?;
    # [required] Type of the tax. Acceptable values are: - "`otherFee`" - "`otherFeeTax`" - "`sales`" 
    string taxType?;
};

public type PosSaleResponse record {
    # Required. The two-letter ISO 639-1 language code for the item.
    string contentLanguage?;
    # Global Trade Item Number.
    string gtin?;
    # Required. A unique identifier for the item.
    string itemId?;
    # Identifies what kind of resource this is. Value: the fixed string "content#posSaleResponse".
    string kind?;
    Price price?;
    # Required. The relative change of the available quantity. Negative for items returned.
    string quantity?;
    # A unique ID to group items from the same sale event.
    string saleId?;
    # Required. The identifier of the merchant's store. Either a `storeCode` inserted via the API or the code of the store in Google My Business.
    string storeCode?;
    # Required. The CLDR territory code for the item.
    string targetCountry?;
    # Required. The inventory timestamp, in ISO 8601 format.
    string timestamp?;
};

public type PostalCodeRange record {
    # A postal code or a pattern of the form `prefix*` denoting the inclusive lower bound of the range defining the area. Examples values: `"94108"`, `"9410*"`, `"9*"`. Required.
    string postalCodeRangeBegin?;
    # A postal code or a pattern of the form `prefix*` denoting the inclusive upper bound of the range defining the area. It must have the same length as `postalCodeRangeBegin`: if `postalCodeRangeBegin` is a postal code then `postalCodeRangeEnd` must be a postal code too; if `postalCodeRangeBegin` is a pattern then `postalCodeRangeEnd` must be a pattern with the same prefix length. Optional: if not set, then the area is defined as being all the postal codes matching `postalCodeRangeBegin`.
    string postalCodeRangeEnd?;
};

# A batch entry encoding a single non-batch shipping settings response.
public type ShippingsettingsCustomBatchResponseEntry record {
    # The ID of the request entry to which this entry responds.
    int batchId?;
    # A list of errors returned by a failed batch entry.
    Errors errors?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#shippingsettingsCustomBatchResponseEntry`"
    string kind?;
    # The merchant account's shipping settings. All methods except getsupportedcarriers and getsupportedholidays require the admin role.
    ShippingSettings shippingSettings?;
};

public type ProductStatusItemLevelIssue record {
    # The attribute's name, if the issue is caused by a single attribute.
    string attributeName?;
    # The error code of the issue.
    string code?;
    # A short issue description in English.
    string description?;
    # The destination the issue applies to.
    string destination?;
    # A detailed issue description in English.
    string detail?;
    # The URL of a web page to help with resolving this issue.
    string documentation?;
    # Whether the issue can be resolved by the merchant.
    string resolution?;
    # How this issue affects serving of the offer.
    string servability?;
};

# A batch entry encoding a single non-batch datafeeds response.
public type DatafeedsCustomBatchResponseEntry record {
    # The ID of the request entry this entry responds to.
    int batchId?;
    # Datafeed configuration data.
    Datafeed datafeed?;
    # A list of errors returned by a failed batch entry.
    Errors errors?;
};

# The merchant account's shipping settings. All methods except getsupportedcarriers and getsupportedholidays require the admin role.
public type ShippingSettings record {
    # The ID of the account to which these account shipping settings belong. Ignored upon update, always present in get request responses.
    string accountId?;
    # A list of postal code groups that can be referred to in `services`. Optional.
    PostalCodeGroup[] postalCodeGroups?;
    # The target account's list of services. Optional.
    Service[] services?;
};

public type OrderLegacyPromotion record {
    OrderLegacyPromotionBenefit[] benefits?;
    # The date and time frame when the promotion is active and ready for validation review. Note that the promotion live time may be delayed for a few hours due to the validation review. Start date and end date are separated by a forward slash (/). The start date is specified by the format (YYYY-MM-DD), followed by the letter ?T?, the time of the day when the sale starts (in Greenwich Mean Time, GMT), followed by an expression of the time zone for the sale. The end date is in the same format.
    string effectiveDates?;
    # Optional. The text code that corresponds to the promotion when applied on the retailer?s website.
    string genericRedemptionCode?;
    # The unique ID of the promotion.
    string id?;
    # The full title of the promotion.
    string longTitle?;
    # Whether the promotion is applicable to all products or only specific products. Acceptable values are: - "`allProducts`" - "`specificProducts`" 
    string productApplicability?;
    # Indicates that the promotion is valid online. Acceptable values are: - "`online`" 
    string redemptionChannel?;
};

public type PosCustomBatchResponseEntry record {
    # The ID of the request entry to which this entry responds.
    int batchId?;
    # A list of errors returned by a failed batch entry.
    Errors errors?;
    # The absolute quantity of an item available at the given store.
    PosInventory inventory?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#posCustomBatchResponseEntry`"
    string kind?;
    # The change of the available quantity of an item at the given store.
    PosSale sale?;
    # Store resource.
    PosStore store?;
};

public type OrderreportsListTransactionsResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#orderreportsListTransactionsResponse".
    string kind?;
    # The token for the retrieval of the next page of transactions.
    string nextPageToken?;
    # The list of transactions.
    OrderReportTransaction[] transactions?;
};

public type PosDataProvidersPosDataProvider record {
    # The display name of Pos data Provider.
    string displayName?;
    # The full name of this POS data Provider.
    string fullName?;
    # The ID of the account.
    string providerId?;
};

# A batch entry encoding a single non-batch products request.
public type ProductsCustomBatchRequestEntry record {
    # An entry ID, unique within the batch request.
    int batchId?;
    # The ID of the managing account.
    string merchantId?;
    # The method of the batch entry. Acceptable values are: - "`delete`" - "`get`" - "`insert`" 
    string method?;
    #  Required product attributes are primarily defined by the products data specification. See the Products Data Specification Help Center article for information. Product data. After inserting, updating, or deleting a product, it may take several minutes before changes take effect.
    Product product?;
    # The ID of the product to get or delete. Only defined if the method is `get` or `delete`.
    string productId?;
};

public type OrdersUpdateMerchantOrderIdResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersUpdateMerchantOrderIdResponse".
    string kind?;
};

public type Weight record {
    # Required. The weight unit. Acceptable values are: - "`kg`" - "`lb`" 
    string unit?;
    # Required. The weight represented as a number. The weight can have a maximum precision of four decimal places.
    string value?;
};

public type OrderDeliveryDetails record {
    OrderAddress address?;
    # The phone number of the person receiving the delivery.
    string phoneNumber?;
};

public type ProductUnitPricingMeasure record {
    # The unit of the measure.
    string unit?;
    # The measure of an item.
    float value?;
};

# The tax settings of a merchant account. All methods require the admin role.
public type AccountTax record {
    # Required. The ID of the account to which these account tax settings belong.
    string accountId?;
    # Identifies what kind of resource this is. Value: the fixed string "content#accountTax".
    string kind?;
    # Tax rules. Updating the tax rules will enable US taxes (not reversible). Defining no rules is equivalent to not charging tax at all.
    AccountTaxTaxRule[] rules?;
};

public type ProductAmount record {
    Price priceAmount?;
    Price remittedTaxAmount?;
    Price taxAmount?;
};

public type TestOrderLineItemProduct record {
    # Required. Brand of the item.
    string brand?;
    # Deprecated. Acceptable values are: - "`online`" 
    string 'channel?;
    # Required. Condition or state of the item. Acceptable values are: - "`new`" 
    string condition?;
    # Required. The two-letter ISO 639-1 language code for the item. Acceptable values are: - "`en`" - "`fr`" 
    string contentLanguage?;
    # Fees for the item. Optional.
    OrderLineItemProductFee[] fees?;
    # Global Trade Item Number (GTIN) of the item. Optional.
    string gtin?;
    # Required. URL of an image of the item.
    string imageLink?;
    # Shared identifier for all variants of the same product. Optional.
    string itemGroupId?;
    # Manufacturer Part Number (MPN) of the item. Optional.
    string mpn?;
    # Required. An identifier of the item.
    string offerId?;
    Price price?;
    # Required. The CLDR territory // code of the target country of the product.
    string targetCountry?;
    # Required. The title of the product.
    string title?;
    # Variant attributes for the item. Optional.
    OrderLineItemProductVariantAttribute[] variantAttributes?;
};

public type OrderReportTransaction record {
    Price disbursementAmount?;
    # The date the disbursement was created, in ISO 8601 format.
    string disbursementCreationDate?;
    # The date the disbursement was initiated, in ISO 8601 format.
    string disbursementDate?;
    # The ID of the disbursement.
    string disbursementId?;
    # The ID of the managing account.
    string merchantId?;
    # Merchant-provided ID of the order.
    string merchantOrderId?;
    # The ID of the order.
    string orderId?;
    Amount productAmount?;
    ProductAmount productAmountWithRemittedTax?;
    # The date of the transaction, in ISO 8601 format.
    string transactionDate?;
};

public type OrderinvoicesCustomBatchRequestEntryCreateRefundInvoiceReturnOption record {
    # Optional description of the return reason.
    string description?;
    # [required] Reason for the return. Acceptable values are: - "`customerDiscretionaryReturn`" - "`customerInitiatedMerchantCancel`" - "`deliveredTooLate`" - "`expiredItem`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`other`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`qualityNotAsExpected`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" - "`wrongProductShipped`" 
    string reason?;
};

public type OrderreturnsListResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#orderreturnsListResponse".
    string kind?;
    # The token for the retrieval of the next page of returns.
    string nextPageToken?;
    MerchantOrderReturn[] resources?;
};

public type DatafeedTarget record {
    # The country where the items in the feed will be included in the search index, represented as a CLDR territory code.
    string country?;
    # The list of destinations to exclude for this target (corresponds to unchecked check boxes in Merchant Center).
    string[] excludedDestinations?;
    # The list of destinations to include for this target (corresponds to checked check boxes in Merchant Center). Default destinations are always included unless provided in `excludedDestinations`. List of supported destinations (if available to the account): - DisplayAds - Shopping - ShoppingActions - SurfacesAcrossGoogle 
    string[] includedDestinations?;
    # The two-letter ISO 639-1 language of the items in the feed. Must be a valid language for `targets[].country`.
    string language?;
};

public type DatafeedsCustomBatchResponse record {
    # The result of the execution of the batch requests.
    DatafeedsCustomBatchResponseEntry[] entries?;
    # Identifies what kind of resource this is. Value: the fixed string "content#datafeedsCustomBatchResponse".
    string kind?;
};

public type ShippingsettingsGetSupportedHolidaysResponse record {
    # A list of holidays applicable for delivery guarantees. May be empty.
    HolidaysHoliday[] holidays?;
    # Identifies what kind of resource this is. Value: the fixed string "content#shippingsettingsGetSupportedHolidaysResponse".
    string kind?;
};

public type OrdersCancelTestOrderByCustomerRequest record {
    # The reason for the cancellation. Acceptable values are: - "`changedMind`" - "`orderedWrongItem`" - "`other`" 
    string reason?;
};

# A batch entry encoding a single non-batch products response.
public type ProductsCustomBatchResponseEntry record {
    # The ID of the request entry this entry responds to.
    int batchId?;
    # A list of errors returned by a failed batch entry.
    Errors errors?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#productsCustomBatchResponseEntry`"
    string kind?;
    #  Required product attributes are primarily defined by the products data specification. See the Products Data Specification Help Center article for information. Product data. After inserting, updating, or deleting a product, it may take several minutes before changes take effect.
    Product product?;
};

public type LiasettingsCustomBatchRequestEntry record {
    # The ID of the account for which to get/update account LIA settings.
    string accountId?;
    # An entry ID, unique within the batch request.
    int batchId?;
    # Inventory validation contact email. Required only for SetInventoryValidationContact.
    string contactEmail?;
    # Inventory validation contact name. Required only for SetInventoryValidationContact.
    string contactName?;
    # The country code. Required only for RequestInventoryVerification.
    string country?;
    # The GMB account. Required only for RequestGmbAccess.
    string gmbEmail?;
    # Local Inventory ads (LIA) settings. All methods except listposdataproviders require the admin role.
    LiaSettings liaSettings?;
    # The ID of the managing account.
    string merchantId?;
    # The method of the batch entry. Acceptable values are: - "`get`" - "`getAccessibleGmbAccounts`" - "`requestGmbAccess`" - "`requestInventoryVerification`" - "`setInventoryVerificationContact`" - "`update`" 
    string method?;
    # The ID of POS data provider. Required only for SetPosProvider.
    string posDataProviderId?;
    # The account ID by which this merchant is known to the POS provider.
    string posExternalAccountId?;
};

public type OrdersReturnRefundLineItemResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersReturnRefundLineItemResponse".
    string kind?;
};

public type OrdersCreateTestReturnRequest record {
    # Returned items.
    OrdersCustomBatchRequestEntryCreateTestReturnReturnItem[] items?;
};

public type ShipmentInvoiceLineItemInvoice record {
    # ID of the line item. Either lineItemId or productId must be set.
    string lineItemId?;
    # ID of the product. This is the REST ID used in the products service. Either lineItemId or productId must be set.
    string productId?;
    # [required] The shipment unit ID is assigned by the merchant and defines individual quantities within a line item. The same ID can be assigned to units that are the same while units that differ must be assigned a different ID (for example: free or promotional units).
    string[] shipmentUnitIds?;
    UnitInvoice unitInvoice?;
};

public type CustomAttribute record {
    # The name of the attribute. Underscores will be replaced by spaces upon insertion.
    string name?;
    # The type of the attribute. Acceptable values are: - "`boolean`" - "`datetimerange`" - "`float`" - "`group`" - "`int`" - "`price`" - "`text`" - "`time`" - "`url`" 
    string 'type?;
    # Free-form unit of the attribute. Unit can only be used for values of type int, float, or price.
    string unit?;
    # The value of the attribute.
    string value?;
};

# A batch entry encoding a single non-batch datafeedstatuses response.
public type DatafeedstatusesCustomBatchResponseEntry record {
    # The ID of the request entry this entry responds to.
    int batchId?;
    # The status of a datafeed, i.e., the result of the last retrieval of the datafeed computed asynchronously when the feed processing is finished.
    DatafeedStatus datafeedStatus?;
    # A list of errors returned by a failed batch entry.
    Errors errors?;
};

public type LiaPosDataProvider record {
    # The ID of the POS data provider.
    string posDataProviderId?;
    # The account ID by which this merchant is known to the POS data provider.
    string posExternalAccountId?;
};

public type OrderreportsListDisbursementsResponse record {
    # The list of disbursements.
    OrderReportDisbursement[] disbursements?;
    # Identifies what kind of resource this is. Value: the fixed string "content#orderreportsListDisbursementsResponse".
    string kind?;
    # The token for the retrieval of the next page of disbursements.
    string nextPageToken?;
};

public type OrderCustomerMarketingRightsInfo record {
    # Last known customer selection regarding marketing preferences. In certain cases this selection might not be known, so this field would be empty. If a customer selected `granted` in their most recent order, they can be subscribed to marketing emails. Customers who have chosen `denied` must not be subscribed, or must be unsubscribed if already opted-in. Acceptable values are: - "`denied`" - "`granted`" 
    string explicitMarketingPreference?;
    # Timestamp when last time marketing preference was updated. Could be empty, if user wasn't offered a selection yet.
    string lastUpdatedTimestamp?;
    # Email address that can be used for marketing purposes. The field may be empty even if `explicitMarketingPreference` is 'granted'. This happens when retrieving an old order from the customer who deleted their account.
    string marketingEmailAddress?;
};

public type OrdersCustomBatchRequestEntryRefund record {
    Price amount?;
    Price amountPretax?;
    Price amountTax?;
    # The reason for the refund. Acceptable values are: - "`adjustment`" - "`courtesyAdjustment`" - "`customerCanceled`" - "`customerDiscretionaryReturn`" - "`deliveredLateByCarrier`" - "`feeAdjustment`" - "`lateShipmentCredit`" - "`noInventory`" - "`other`" - "`priceError`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`shippingCostAdjustment`" - "`taxAdjustment`" - "`undeliverableShippingAddress`" - "`wrongProductShipped`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type TestOrderCustomerMarketingRightsInfo record {
    # Last know user use selection regards marketing preferences. In certain cases selection might not be known, so this field would be empty. Acceptable values are: - "`denied`" - "`granted`" 
    string explicitMarketingPreference?;
    # Timestamp when last time marketing preference was updated. Could be empty, if user wasn't offered a selection yet.
    string lastUpdatedTimestamp?;
};

public type LiaInventorySettings record {
    # The email of the contact for the inventory verification process.
    string inventoryVerificationContactEmail?;
    # The name of the contact for the inventory verification process.
    string inventoryVerificationContactName?;
    # The status of the verification contact. Acceptable values are: - "`active`" - "`inactive`" - "`pending`" 
    string inventoryVerificationContactStatus?;
    # The status of the inventory verification process. Acceptable values are: - "`active`" - "`inactive`" - "`pending`" 
    string status?;
};

# A batch entry encoding a single non-batch productstatuses response.
public type ProductstatusesCustomBatchResponseEntry record {
    # The ID of the request entry this entry responds to.
    int batchId?;
    # A list of errors returned by a failed batch entry.
    Errors errors?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#productstatusesCustomBatchResponseEntry`"
    string kind?;
    # The status of a product, i.e., information about a product computed asynchronously.
    ProductStatus productStatus?;
};

public type TestOrderPaymentMethod record {
    # The card expiration month (January = 1, February = 2 etc.).
    int expirationMonth?;
    # The card expiration year (4-digit, e.g. 2015).
    int expirationYear?;
    # The last four digits of the card number.
    string lastFourDigits?;
    # The billing address. Acceptable values are: - "`dwight`" - "`jim`" - "`pam`" 
    string predefinedBillingAddress?;
    # The type of instrument. Note that real orders might have different values than the four values accepted by `createTestOrder`. Acceptable values are: - "`AMEX`" - "`DISCOVER`" - "`MASTERCARD`" - "`VISA`" 
    string 'type?;
};

public type TransitTableTransitTimeRow record {
    TransitTableTransitTimeRowTransitTimeValue[] values?;
};

public type DatafeedsFetchNowResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#datafeedsFetchNowResponse".
    string kind?;
};

public type LiaAboutPageSettings record {
    # The status of the verification process for the About page. Acceptable values are: - "`active`" - "`inactive`" - "`pending`" 
    string status?;
    # The URL for the About page.
    string url?;
};

public type ShippingsettingsListResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#shippingsettingsListResponse".
    string kind?;
    # The token for the retrieval of the next page of shipping settings.
    string nextPageToken?;
    ShippingSettings[] resources?;
};

public type OrdersCustomBatchRequestEntryShipLineItemsShipmentInfo record {
    # The carrier handling the shipment. See `shipments[].carrier` in the Orders resource representation for a list of acceptable values.
    string carrier?;
    # Required. The ID of the shipment. This is assigned by the merchant and is unique to each shipment.
    string shipmentId?;
    # The tracking ID for the shipment.
    string trackingId?;
};

public type OrdersUpdateShipmentRequest record {
    # The carrier handling the shipment. Not updated if missing. See `shipments[].carrier` in the Orders resource representation for a list of acceptable values.
    string carrier?;
    # Date on which the shipment has been delivered, in ISO 8601 format. Optional and can be provided only if `status` is `delivered`.
    string deliveryDate?;
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
    # The ID of the shipment.
    string shipmentId?;
    # New status for the shipment. Not updated if missing. Acceptable values are: - "`delivered`" - "`undeliverable`" - "`readyForPickup`" 
    string status?;
    # The tracking ID for the shipment. Not updated if missing.
    string trackingId?;
};

public type OrderinvoicesCustomBatchRequestEntryCreateRefundInvoiceRefundOption record {
    # Optional description of the refund reason.
    string description?;
    # [required] Reason for the refund. Acceptable values are: - "`adjustment`" - "`autoPostInternal`" - "`autoPostInvalidBillingAddress`" - "`autoPostNoInventory`" - "`autoPostPriceError`" - "`autoPostUndeliverableShippingAddress`" - "`couponAbuse`" - "`courtesyAdjustment`" - "`customerCanceled`" - "`customerDiscretionaryReturn`" - "`customerInitiatedMerchantCancel`" - "`customerSupportRequested`" - "`deliveredLateByCarrier`" - "`deliveredTooLate`" - "`expiredItem`" - "`failToPushOrderGoogleError`" - "`failToPushOrderMerchantError`" - "`failToPushOrderMerchantFulfillmentError`" - "`failToPushOrderToMerchant`" - "`failToPushOrderToMerchantOutOfStock`" - "`feeAdjustment`" - "`invalidCoupon`" - "`lateShipmentCredit`" - "`malformedShippingAddress`" - "`merchantDidNotShipOnTime`" - "`noInventory`" - "`orderTimeout`" - "`other`" - "`paymentAbuse`" - "`paymentDeclined`" - "`priceAdjustment`" - "`priceError`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`promoReallocation`" - "`qualityNotAsExpected`" - "`returnRefundAbuse`" - "`shippingCostAdjustment`" - "`shippingPriceError`" - "`taxAdjustment`" - "`taxError`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" - "`wrongProductShipped`" 
    string reason?;
};

public type OrdersCancelLineItemResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersCancelLineItemResponse".
    string kind?;
};

public type OrdersCustomBatchRequestEntryShipLineItems record {
    # Deprecated. Please use shipmentInfo instead. The carrier handling the shipment. See `shipments[].carrier` in the Orders resource representation for a list of acceptable values.
    string carrier?;
    # Line items to ship.
    OrderShipmentLineItemShipment[] lineItems?;
    # ID of the shipment group. Required for orders that use the orderinvoices service.
    string shipmentGroupId?;
    # Deprecated. Please use shipmentInfo instead. The ID of the shipment.
    string shipmentId?;
    # Shipment information. This field is repeated because a single line item can be shipped in several packages (and have several tracking IDs).
    OrdersCustomBatchRequestEntryShipLineItemsShipmentInfo[] shipmentInfos?;
    # Deprecated. Please use shipmentInfo instead. The tracking ID for the shipment.
    string trackingId?;
};

public type OrdersCustomBatchRequestEntrySetLineItemMetadata record {
    OrderMerchantProvidedAnnotation[] annotations?;
    # The ID of the line item to set metadata. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the product to set metadata. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
};

public type ProductStatusDataQualityIssue record {
    string destination?;
    string detail?;
    string fetchStatus?;
    string id?;
    string location?;
    string severity?;
    string timestamp?;
    string valueOnLandingPage?;
    string valueProvided?;
};

public type InventoryCustomBatchResponse record {
    # The result of the execution of the batch requests.
    InventoryCustomBatchResponseEntry[] entries?;
    # Identifies what kind of resource this is. Value: the fixed string "content#inventoryCustomBatchResponse".
    string kind?;
};

# Datafeed configuration data.
public type Datafeed record {
    # The two-letter ISO 639-1 language in which the attributes are defined in the data feed.
    string attributeLanguage?;
    # [DEPRECATED] Please use targets[].language instead. The two-letter ISO 639-1 language of the items in the feed. Must be a valid language for `targetCountry`.
    string contentLanguage?;
    # Required. The type of data feed. For product inventory feeds, only feeds for local stores, not online stores, are supported. Acceptable values are: - "`local products`" - "`product inventory`" - "`products`" 
    string contentType?;
    # The required fields vary based on the frequency of fetching. For a monthly fetch schedule, day_of_month and hour are required. For a weekly fetch schedule, weekday and hour are required. For a daily fetch schedule, only hour is required.
    DatafeedFetchSchedule fetchSchedule?;
    # Required. The filename of the feed. All feeds must have a unique file name.
    string fileName?;
    DatafeedFormat format?;
    # Required for update. The ID of the data feed.
    string id?;
    # [DEPRECATED] Please use targets[].includedDestinations instead. The list of intended destinations (corresponds to checked check boxes in Merchant Center).
    string[] intendedDestinations?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#datafeed`"
    string kind?;
    # Required for insert. A descriptive name of the data feed.
    string name?;
    # [DEPRECATED] Please use targets[].country instead. The country where the items in the feed will be included in the search index, represented as a CLDR territory code.
    string targetCountry?;
    # The targets this feed should apply to (country, language, destinations).
    DatafeedTarget[] targets?;
};

# Order return. Production access (all methods) requires the order manager role. Sandbox access does not.
public type MerchantOrderReturn record {
    # The date of creation of the return, in ISO 8601 format.
    string creationDate?;
    # Merchant defined order ID.
    string merchantOrderId?;
    # Google order ID.
    string orderId?;
    # Order return ID generated by Google.
    string orderReturnId?;
    # Items of the return.
    MerchantOrderReturnItem[] returnItems?;
    # Shipments of the return.
    ReturnShipment[] returnShipments?;
};

public type OrderShipmentScheduledDeliveryDetails record {
    # The phone number of the carrier fulfilling the delivery. The phone number is formatted as the international notation in ITU-T Recommendation E.123 (e.g., "+41 44 668 1800").
    string carrierPhoneNumber?;
    # The date a shipment is scheduled for delivery, in ISO 8601 format.
    string scheduledDate?;
};

public type OrderPickupDetailsCollector record {
    # Name of the person picking up the shipment.
    string name?;
    # Phone number of the person picking up the shipment.
    string phoneNumber?;
};

public type AccountStatusItemLevelIssue record {
    # The attribute's name, if the issue is caused by a single attribute.
    string attributeName?;
    # The error code of the issue.
    string code?;
    # A short issue description in English.
    string description?;
    # A detailed issue description in English.
    string detail?;
    # The URL of a web page to help with resolving this issue.
    string documentation?;
    # Number of items with this issue.
    string numItems?;
    # Whether the issue can be resolved by the merchant.
    string resolution?;
    # How this issue affects serving of the offer.
    string servability?;
};

# Account data. After the creation of a new account it may take a few minutes before it is fully operational. The methods delete, insert, and update require the admin role.
public type Account record {
    # Indicates whether the merchant sells adult content.
    boolean adultContent?;
    # List of linked AdWords accounts that are active or pending approval. To create a new link request, add a new link with status `active` to the list. It will remain in a `pending` state until approved or rejected either in the AdWords interface or through the AdWords API. To delete an active link, or to cancel a link request, remove it from the list.
    AccountAdwordsLink[] adwordsLinks?;
    AccountBusinessInformation businessInformation?;
    AccountGoogleMyBusinessLink googleMyBusinessLink?;
    # Required for update. Merchant Center account ID.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#account`"
    string kind?;
    # Required. Display name for the account.
    string name?;
    # [DEPRECATED] This field is never returned and will be ignored if provided.
    string reviewsUrl?;
    # Client-specific, locally-unique, internal ID for the child account.
    string sellerId?;
    # Users with access to the account. Every account (except for subaccounts) must have at least one admin user.
    AccountUser[] users?;
    # The merchant's website.
    string websiteUrl?;
    # List of linked YouTube channels that are active or pending approval. To create a new link request, add a new link with status `active` to the list. It will remain in a `pending` state until approved or rejected in the YT Creator Studio interface. To delete an active link, or to cancel a link request, remove it from the list.
    AccountYouTubeChannelLink[] youtubeChannelLinks?;
};

# An example occurrence for a particular error.
public type DatafeedStatusExample record {
    # The ID of the example item.
    string itemId?;
    # Line number in the data feed where the example is found.
    string lineNumber?;
    # The problematic value.
    string value?;
};

public type InventorySetResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#inventorySetResponse".
    string kind?;
};

public type OrdersInStoreRefundLineItemResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersInStoreRefundLineItemResponse".
    string kind?;
};

public type OrdersGetTestOrderTemplateResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersGetTestOrderTemplateResponse".
    string kind?;
    TestOrder template?;
};

public type OrdersRefundResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersRefundResponse".
    string kind?;
};

public type OrdersRejectReturnLineItemResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersRejectReturnLineItemResponse".
    string kind?;
};

public type PosCustomBatchRequestEntry record {
    # An entry ID, unique within the batch request.
    int batchId?;
    # The absolute quantity of an item available at the given store.
    PosInventory inventory?;
    # The ID of the POS data provider.
    string merchantId?;
    # The method of the batch entry. Acceptable values are: - "`delete`" - "`get`" - "`insert`" - "`inventory`" - "`sale`" 
    string method?;
    # The change of the available quantity of an item at the given store.
    PosSale sale?;
    # Store resource.
    PosStore store?;
    # The store code. This should be set only if the method is `delete` or `get`.
    string storeCode?;
    # The ID of the account for which to get/submit data.
    string targetMerchantId?;
};

public type OrdersReturnRefundLineItemRequest record {
    Price amountPretax?;
    Price amountTax?;
    # The ID of the line item to return. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
    # The ID of the product to return. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # The quantity to return and refund. Quantity is required.
    int quantity?;
    # The reason for the return. Acceptable values are: - "`customerDiscretionaryReturn`" - "`customerInitiatedMerchantCancel`" - "`deliveredTooLate`" - "`expiredItem`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`other`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`qualityNotAsExpected`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" - "`wrongProductShipped`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type ProductAspect record {
    # Deprecated.
    string aspectName?;
    # Deprecated.
    string destinationName?;
    # Deprecated.
    string intention?;
};

public type ProductShipping record {
    # The CLDR territory code of the country to which an item will ship.
    string country?;
    # The location where the shipping is applicable, represented by a location group name.
    string locationGroupName?;
    # The numeric ID of a location that the shipping rate applies to as defined in the AdWords API.
    string locationId?;
    # The postal code range that the shipping rate applies to, represented by a postal code, a postal code prefix followed by a * wildcard, a range between two postal codes or two postal code prefixes of equal length.
    string postalCode?;
    Price price?;
    # The geographic region to which a shipping rate applies.
    string region?;
    # A free-form description of the service class or delivery speed.
    string 'service?;
};

public type ProductTax record {
    # The country within which the item is taxed, specified as a CLDR territory code.
    string country?;
    # The numeric ID of a location that the tax rate applies to as defined in the AdWords API.
    string locationId?;
    # The postal code range that the tax rate applies to, represented by a ZIP code, a ZIP code prefix using * wildcard, a range between two ZIP codes or two ZIP code prefixes of equal length. Examples: 94114, 94*, 94002-95460, 94*-95*.
    string postalCode?;
    # The percentage of tax rate that applies to the item price.
    float rate?;
    # The geographic region to which the tax rate applies.
    string region?;
    # Should be set to true if tax is charged on shipping.
    boolean taxShip?;
};

public type TestOrderCustomer record {
    # Required. Email address of the customer. Acceptable values are: - "`pog.dwight.schrute@gmail.com`" - "`pog.jim.halpert@gmail.com`" - "`penpog.pam.beesly@gmail.comding`" 
    string email?;
    # Deprecated. Please use marketingRightsInfo instead.
    boolean explicitMarketingPreference?;
    # Full name of the customer.
    string fullName?;
    TestOrderCustomerMarketingRightsInfo marketingRightsInfo?;
};

public type ShippingsettingsGetSupportedCarriersResponse record {
    # A list of supported carriers. May be empty.
    CarriersCarrier[] carriers?;
    # Identifies what kind of resource this is. Value: the fixed string "content#shippingsettingsGetSupportedCarriersResponse".
    string kind?;
};

public type AccountStatusAccountLevelIssue record {
    # Country for which this issue is reported.
    string country?;
    # The destination the issue applies to. If this field is empty then the issue applies to all available destinations.
    string destination?;
    # Additional details about the issue.
    string detail?;
    # The URL of a web page to help resolving this issue.
    string documentation?;
    # Issue identifier.
    string id?;
    # Severity of the issue. Acceptable values are: - "`critical`" - "`error`" - "`suggestion`" 
    string severity?;
    # Short description of the issue.
    string title?;
};

public type AccountsCustomBatchResponse record {
    # The result of the execution of the batch requests.
    AccountsCustomBatchResponseEntry[] entries?;
    # Identifies what kind of resource this is. Value: the fixed string "content#accountsCustomBatchResponse".
    string kind?;
};

public type AccountsLinkResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#accountsLinkResponse".
    string kind?;
};

public type DatafeedstatusesCustomBatchResponse record {
    # The result of the execution of the batch requests.
    DatafeedstatusesCustomBatchResponseEntry[] entries?;
    # Identifies what kind of resource this is. Value: the fixed string "content#datafeedstatusesCustomBatchResponse".
    string kind?;
};

public type AccountsLinkRequest record {
    # Action to perform for this link. The `"request"` action is only available to select merchants. Acceptable values are: - "`approve`" - "`remove`" - "`request`" 
    string action?;
    # Type of the link between the two accounts. Acceptable values are: - "`channelPartner`" - "`eCommercePlatform`" 
    string linkType?;
    # The ID of the linked account.
    string linkedAccountId?;
};

public type OrdersCustomBatchResponse record {
    # The result of the execution of the batch requests.
    OrdersCustomBatchResponseEntry[] entries?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersCustomBatchResponse".
    string kind?;
};

public type ProductsCustomBatchRequest record {
    # The request entries to be processed in the batch.
    ProductsCustomBatchRequestEntry[] entries?;
};

public type OrdersCustomBatchRequestEntryCancel record {
    # The reason for the cancellation. Acceptable values are: - "`customerInitiatedCancel`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`noInventory`" - "`other`" - "`priceError`" - "`shippingPriceError`" - "`taxError`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

# The absolute quantity of an item available at the given store.
public type PosInventory record {
    # Required. The two-letter ISO 639-1 language code for the item.
    string contentLanguage?;
    # Global Trade Item Number.
    string gtin?;
    # Required. A unique identifier for the item.
    string itemId?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#posInventory`"
    string kind?;
    Price price?;
    # Required. The available quantity of the item.
    string quantity?;
    # Required. The identifier of the merchant's store. Either a `storeCode` inserted via the API or the code of the store in Google My Business.
    string storeCode?;
    # Required. The CLDR territory code for the item.
    string targetCountry?;
    # Required. The inventory timestamp, in ISO 8601 format.
    string timestamp?;
};

# A batch entry encoding a single non-batch datafeedstatuses request.
public type DatafeedstatusesCustomBatchRequestEntry record {
    # An entry ID, unique within the batch request.
    int batchId?;
    # The country for which to get the datafeed status. If this parameter is provided then language must also be provided. Note that for multi-target datafeeds this parameter is required.
    string country?;
    # The ID of the data feed to get.
    string datafeedId?;
    # The language for which to get the datafeed status. If this parameter is provided then country must also be provided. Note that for multi-target datafeeds this parameter is required.
    string language?;
    # The ID of the managing account.
    string merchantId?;
    # The method of the batch entry. Acceptable values are: - "`get`" 
    string method?;
};

public type OrdersCancelTestOrderByCustomerResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersCancelTestOrderByCustomerResponse".
    string kind?;
};

public type MinimumOrderValueTable record {
    MinimumOrderValueTableStoreCodeSetWithMov[] storeCodeSetWithMovs?;
};

# The required fields vary based on the frequency of fetching. For a monthly fetch schedule, day_of_month and hour are required. For a weekly fetch schedule, weekday and hour are required. For a daily fetch schedule, only hour is required.
public type DatafeedFetchSchedule record {
    # The day of the month the feed file should be fetched (1-31).
    int dayOfMonth?;
    # The URL where the feed file can be fetched. Google Merchant Center will support automatic scheduled uploads using the HTTP, HTTPS, FTP, or SFTP protocols, so the value will need to be a valid link using one of those four protocols.
    string fetchUrl?;
    # The hour of the day the feed file should be fetched (0-23).
    int hour?;
    # The minute of the hour the feed file should be fetched (0-59). Read-only.
    int minuteOfHour?;
    # An optional password for fetch_url.
    string password?;
    # Whether the scheduled fetch is paused or not.
    boolean paused?;
    # Time zone used for schedule. UTC by default. E.g., "America/Los_Angeles".
    string timeZone?;
    # An optional user name for fetch_url.
    string username?;
    # The day of the week the feed file should be fetched. Acceptable values are: - "`monday`" - "`tuesday`" - "`wednesday`" - "`thursday`" - "`friday`" - "`saturday`" - "`sunday`" 
    string weekday?;
};

public type AccountsCustomBatchRequest record {
    # The request entries to be processed in the batch.
    AccountsCustomBatchRequestEntry[] entries?;
};

public type DatafeedstatusesListResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#datafeedstatusesListResponse".
    string kind?;
    # The token for the retrieval of the next page of datafeed statuses.
    string nextPageToken?;
    DatafeedStatus[] resources?;
};

public type LocationIdSet record {
    # A non-empty list of location IDs. They must all be of the same location type (e.g., state).
    string[] locationIds?;
};

public type ProductstatusesCustomBatchRequest record {
    # The request entries to be processed in the batch.
    ProductstatusesCustomBatchRequestEntry[] entries?;
};

# A batch entry encoding a single non-batch datafeeds request.
public type DatafeedsCustomBatchRequestEntry record {
    # An entry ID, unique within the batch request.
    int batchId?;
    # Datafeed configuration data.
    Datafeed datafeed?;
    # The ID of the data feed to get, delete or fetch.
    string datafeedId?;
    # The ID of the managing account.
    string merchantId?;
    # The method of the batch entry. Acceptable values are: - "`delete`" - "`fetchNow`" - "`get`" - "`insert`" - "`update`" 
    string method?;
};

public type InventoryCustomBatchRequest record {
    # The request entries to be processed in the batch.
    InventoryCustomBatchRequestEntry[] entries?;
};

# The change of the available quantity of an item at the given store.
public type PosSale record {
    # Required. The two-letter ISO 639-1 language code for the item.
    string contentLanguage?;
    # Global Trade Item Number.
    string gtin?;
    # Required. A unique identifier for the item.
    string itemId?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#posSale`"
    string kind?;
    Price price?;
    # Required. The relative change of the available quantity. Negative for items returned.
    string quantity?;
    # A unique ID to group items from the same sale event.
    string saleId?;
    # Required. The identifier of the merchant's store. Either a `storeCode` inserted via the API or the code of the store in Google My Business.
    string storeCode?;
    # Required. The CLDR territory code for the item.
    string targetCountry?;
    # Required. The inventory timestamp, in ISO 8601 format.
    string timestamp?;
};

public type OrdersCustomBatchRequestEntry record {
    # An entry ID, unique within the batch request.
    int batchId?;
    OrdersCustomBatchRequestEntryCancel cancel?;
    OrdersCustomBatchRequestEntryCancelLineItem cancelLineItem?;
    OrdersCustomBatchRequestEntryInStoreRefundLineItem inStoreRefundLineItem?;
    # The ID of the managing account.
    string merchantId?;
    # The merchant order ID. Required for `updateMerchantOrderId` and `getByMerchantOrderId` methods.
    string merchantOrderId?;
    # The method of the batch entry. Acceptable values are: - "`acknowledge`" - "`cancel`" - "`cancelLineItem`" - "`get`" - "`getByMerchantOrderId`" - "`inStoreRefundLineItem`" - "`refund`" - "`rejectReturnLineItem`" - "`returnLineItem`" - "`returnRefundLineItem`" - "`setLineItemMetadata`" - "`shipLineItems`" - "`updateLineItemShippingDetails`" - "`updateMerchantOrderId`" - "`updateShipment`" 
    string method?;
    # The ID of the operation. Unique across all operations for a given order. Required for all methods beside `get` and `getByMerchantOrderId`.
    string operationId?;
    # The ID of the order. Required for all methods beside `getByMerchantOrderId`.
    string orderId?;
    OrdersCustomBatchRequestEntryRefund refund?;
    OrdersCustomBatchRequestEntryRejectReturnLineItem rejectReturnLineItem?;
    OrdersCustomBatchRequestEntryReturnLineItem returnLineItem?;
    OrdersCustomBatchRequestEntryReturnRefundLineItem returnRefundLineItem?;
    OrdersCustomBatchRequestEntrySetLineItemMetadata setLineItemMetadata?;
    OrdersCustomBatchRequestEntryShipLineItems shipLineItems?;
    OrdersCustomBatchRequestEntryUpdateLineItemShippingDetails updateLineItemShippingDetails?;
    OrdersCustomBatchRequestEntryUpdateShipment updateShipment?;
};

public type AccountYouTubeChannelLink record {
    # Channel ID.
    string channelId?;
    # Status of the link between this Merchant Center account and the YouTube channel. Upon retrieval, it represents the actual status of the link and can be either `active` if it was approved in YT Creator Studio or `pending` if it's pending approval. Upon insertion, it represents the *intended* status of the link. Re-uploading a link with status `active` when it's still pending or with status `pending` when it's already active will have no effect: the status will remain unchanged. Re-uploading a link with deprecated status `inactive` is equivalent to not submitting the link at all and will delete the link if it was active or cancel the link request if it was pending.
    string status?;
};

public type CarriersCarrier record {
    # The CLDR country code of the carrier (e.g., "US"). Always present.
    string country?;
    # A list of services supported for EDD (Estimated Delivery Date) calculation. This is the list of valid values for WarehouseBasedDeliveryTime.carrierService.
    string[] eddServices?;
    # The name of the carrier (e.g., `"UPS"`). Always present.
    string name?;
    # A list of supported services (e.g., `"ground"`) for that carrier. Contains at least one service. This is the list of valid values for CarrierRate.carrierService.
    string[] services?;
};

public type OrdersUpdateLineItemShippingDetailsResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersUpdateLineItemShippingDetailsResponse".
    string kind?;
};

public type LiasettingsRequestGmbAccessResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#liasettingsRequestGmbAccessResponse".
    string kind?;
};

public type AccountstatusesCustomBatchResponse record {
    # The result of the execution of the batch requests.
    AccountstatusesCustomBatchResponseEntry[] entries?;
    # Identifies what kind of resource this is. Value: the fixed string "content#accountstatusesCustomBatchResponse".
    string kind?;
};

public type Promotion record {
    Amount promotionAmount?;
    # [required] ID of the promotion.
    string promotionId?;
};

public type CustomGroup record {
    # The sub-attributes.
    CustomAttribute[] attributes?;
    # The name of the group. Underscores will be replaced by spaces upon insertion.
    string name?;
};

public type ProductsCustomBatchResponse record {
    # The result of the execution of the batch requests.
    ProductsCustomBatchResponseEntry[] entries?;
    # Identifies what kind of resource this is. Value: the fixed string "content#productsCustomBatchResponse".
    string kind?;
};

# A batch entry encoding a single non-batch productstatuses request.
public type ProductstatusesCustomBatchRequestEntry record {
    # An entry ID, unique within the batch request.
    int batchId?;
    # If set, only issues for the specified destinations are returned, otherwise only issues for the Shopping destination.
    string[] destinations?;
    boolean includeAttributes?;
    # The ID of the managing account.
    string merchantId?;
    # The method of the batch entry. Acceptable values are: - "`get`" 
    string method?;
    # The ID of the product whose status to get.
    string productId?;
};

public type UnitInvoice record {
    # Additional charges for a unit, e.g. shipping costs.
    UnitInvoiceAdditionalCharge[] additionalCharges?;
    # Deprecated.
    Promotion[] promotions?;
    Price unitPricePretax?;
    # Tax amounts to apply to the unit price.
    UnitInvoiceTaxLine[] unitPriceTaxes?;
};

# A list of store code sets sharing the same minimum order value. At least two sets are required and the last one must be empty, which signifies 'MOV for all other stores'. Each store code can only appear once across all the sets. All prices within a service must have the same currency.
public type MinimumOrderValueTableStoreCodeSetWithMov record {
    # A list of unique store codes or empty for the catch all.
    string[] storeCodes?;
    Price value?;
};

public type AccountsAuthInfoResponse record {
    # The account identifiers corresponding to the authenticated user. - For an individual account: only the merchant ID is defined - For an aggregator: only the aggregator ID is defined - For a subaccount of an MCA: both the merchant ID and the aggregator ID are defined. 
    AccountIdentifier[] accountIdentifiers?;
    # Identifies what kind of resource this is. Value: the fixed string "content#accountsAuthInfoResponse".
    string kind?;
};

public type AccounttaxCustomBatchRequest record {
    # The request entries to be processed in the batch.
    AccounttaxCustomBatchRequestEntry[] entries?;
};

public type AccountIdentifier record {
    # The aggregator ID, set for aggregators and subaccounts (in that case, it represents the aggregator of the subaccount).
    string aggregatorId?;
    # The merchant account ID, set for individual accounts and subaccounts.
    string merchantId?;
};

public type OrderLineItemShippingDetails record {
    # Required. The delivery by date, in ISO 8601 format.
    string deliverByDate?;
    OrderLineItemShippingDetailsMethod method?;
    # Required. The ship by date, in ISO 8601 format.
    string shipByDate?;
    # Type of shipment. Indicates whether `deliveryDetails` or `pickupDetails` is applicable for this shipment. Acceptable values are: - "`delivery`" - "`pickup`" 
    string 'type?;
};

public type PickupCarrierService record {
    # The name of the pickup carrier (e.g., `"UPS"`). Required.
    string carrierName?;
    # The name of the pickup service (e.g., `"Access point"`). Required.
    string serviceName?;
};

public type PosSaleRequest record {
    # Required. The two-letter ISO 639-1 language code for the item.
    string contentLanguage?;
    # Global Trade Item Number.
    string gtin?;
    # Required. A unique identifier for the item.
    string itemId?;
    Price price?;
    # Required. The relative change of the available quantity. Negative for items returned.
    string quantity?;
    # A unique ID to group items from the same sale event.
    string saleId?;
    # Required. The identifier of the merchant's store. Either a `storeCode` inserted via the API or the code of the store in Google My Business.
    string storeCode?;
    # Required. The CLDR territory code for the item.
    string targetCountry?;
    # Required. The inventory timestamp, in ISO 8601 format.
    string timestamp?;
};

public type ProductDestination record {
    # The name of the destination.
    string destinationName?;
    # Whether the destination is required, excluded or should be validated. Acceptable values are: - "`default`" - "`excluded`" - "`optional`" - "`required`" 
    string intention?;
};

public type InvoiceSummary record {
    # Summary of the total amounts of the additional charges.
    InvoiceSummaryAdditionalChargeSummary[] additionalChargeSummaries?;
    Amount customerBalance?;
    Amount googleBalance?;
    Amount merchantBalance?;
    Amount productTotal?;
    # Deprecated.
    Promotion[] promotionSummaries?;
};

public type AccounttaxCustomBatchResponse record {
    # The result of the execution of the batch requests.
    AccounttaxCustomBatchResponseEntry[] entries?;
    # Identifies what kind of resource this is. Value: the fixed string "content#accounttaxCustomBatchResponse".
    string kind?;
};

public type PosCustomBatchResponse record {
    # The result of the execution of the batch requests.
    PosCustomBatchResponseEntry[] entries?;
    # Identifies what kind of resource this is. Value: the fixed string "content#posCustomBatchResponse".
    string kind?;
};

public type LiasettingsSetInventoryVerificationContactResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#liasettingsSetInventoryVerificationContactResponse".
    string kind?;
};

public type InventorySetRequest record {
    # The availability of the product. Acceptable values are: - "`in stock`" - "`out of stock`" - "`preorder`" 
    string availability?;
    # Custom label 0 for custom grouping of items in a Shopping campaign. Only supported for online products.
    string customLabel0?;
    # Custom label 1 for custom grouping of items in a Shopping campaign. Only supported for online products.
    string customLabel1?;
    # Custom label 2 for custom grouping of items in a Shopping campaign. Only supported for online products.
    string customLabel2?;
    # Custom label 3 for custom grouping of items in a Shopping campaign. Only supported for online products.
    string customLabel3?;
    # Custom label 3 for custom grouping of items in a Shopping campaign. Only supported for online products.
    string customLabel4?;
    Installment installment?;
    # The instore product location. Supported only for local products.
    string instoreProductLocation?;
    LoyaltyPoints loyaltyPoints?;
    InventoryPickup pickup?;
    Price price?;
    # The quantity of the product. Must be equal to or greater than zero. Supported only for local products.
    int quantity?;
    Price salePrice?;
    # A date range represented by a pair of ISO 8601 dates separated by a space, comma, or slash. Both dates might be specified as 'null' if undecided.
    string salePriceEffectiveDate?;
    # The quantity of the product that is available for selling on Google. Supported only for online products.
    int sellOnGoogleQuantity?;
};

public type OrderCustomer record {
    # Deprecated.
    string email?;
    # Deprecated. Please use marketingRightsInfo instead.
    boolean explicitMarketingPreference?;
    # Full name of the customer.
    string fullName?;
    # Email address for the merchant to send value-added tax or invoice documentation of the order. Only the last document sent is made available to the customer. For more information, see About automated VAT invoicing for Buy on Google.
    string invoiceReceivingEmail?;
    OrderCustomerMarketingRightsInfo marketingRightsInfo?;
};

public type Table record {
    # A non-empty list of row or column headers for a table. Exactly one of `prices`, `weights`, `numItems`, `postalCodeGroupNames`, or `location` must be set.
    Headers columnHeaders?;
    # Name of the table. Required for subtables, ignored for the main table.
    string name?;
    # A non-empty list of row or column headers for a table. Exactly one of `prices`, `weights`, `numItems`, `postalCodeGroupNames`, or `location` must be set.
    Headers rowHeaders?;
    # The list of rows that constitute the table. Must have the same length as `rowHeaders`. Required.
    Row[] rows?;
};

public type TransitTableTransitTimeRowTransitTimeValue record {
    # Must be greater than or equal to `minTransitTimeInDays`.
    int maxTransitTimeInDays?;
    # Transit time range (min-max) in business days. 0 means same day delivery, 1 means next day delivery.
    int minTransitTimeInDays?;
};

public type Amount record {
    Price pretax?;
    Price tax?;
};

public type HolidaysHoliday record {
    # The CLDR territory code of the country in which the holiday is available. E.g. "US", "DE", "GB". A holiday cutoff can only be configured in a shipping settings service with matching delivery country. Always present.
    string countryCode?;
    # Date of the holiday, in ISO 8601 format. E.g. "2016-12-25" for Christmas 2016. Always present.
    string date?;
    # Date on which the order has to arrive at the customer's, in ISO 8601 format. E.g. "2016-12-24" for 24th December 2016. Always present.
    string deliveryGuaranteeDate?;
    # Hour of the day in the delivery location's timezone on the guaranteed delivery date by which the order has to arrive at the customer's. Possible values are: 0 (midnight), 1, ..., 12 (noon), 13, ..., 23. Always present.
    string deliveryGuaranteeHour?;
    # Unique identifier for the holiday to be used when configuring holiday cutoffs. Always present.
    string id?;
    # The holiday type. Always present. Acceptable values are: - "`Christmas`" - "`Easter`" - "`Father's Day`" - "`Halloween`" - "`Independence Day (USA)`" - "`Mother's Day`" - "`Thanksgiving`" - "`Valentine's Day`" 
    string 'type?;
};

public type TransitTable record {
    # A list of postal group names. The last value can be `"all other locations"`. Example: `["zone 1", "zone 2", "all other locations"]`. The referred postal code groups must match the delivery country of the service.
    string[] postalCodeGroupNames?;
    TransitTableTransitTimeRow[] rows?;
    # A list of transit time labels. The last value can be `"all other labels"`. Example: `["food", "electronics", "all other labels"]`.
    string[] transitTimeLabels?;
};

public type OrdersRejectReturnLineItemRequest record {
    # The ID of the line item to return. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
    # The ID of the product to return. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # The quantity to return and refund.
    int quantity?;
    # The reason for the return. Acceptable values are: - "`damagedOrUsed`" - "`missingComponent`" - "`notEligible`" - "`other`" - "`outOfReturnWindow`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type DeliveryTime record {
    CutoffTime cutoffTime?;
    BusinessDayConfig handlingBusinessDayConfig?;
    # Holiday cutoff definitions. If configured, they specify order cutoff times for holiday-specific shipping.
    HolidayCutoff[] holidayCutoffs?;
    # Maximum number of business days spent before an order is shipped. 0 means same day shipped, 1 means next day shipped. Must be greater than or equal to `minHandlingTimeInDays`.
    int maxHandlingTimeInDays?;
    # Maximum number of business days that is spent in transit. 0 means same day delivery, 1 means next day delivery. Must be greater than or equal to `minTransitTimeInDays`.
    int maxTransitTimeInDays?;
    # Minimum number of business days spent before an order is shipped. 0 means same day shipped, 1 means next day shipped.
    int minHandlingTimeInDays?;
    # Minimum number of business days that is spent in transit. 0 means same day delivery, 1 means next day delivery. Either `{min,max}TransitTimeInDays` or `transitTimeTable` must be set, but not both.
    int minTransitTimeInDays?;
    BusinessDayConfig transitBusinessDayConfig?;
    TransitTable transitTimeTable?;
    # Indicates that the delivery time should be calculated per warehouse (shipping origin location) based on the settings of the selected carrier. When set, no other transit time related field in DeliveryTime should be set.
    WarehouseBasedDeliveryTime[] warehouseBasedDeliveryTimes?;
};

public type OrdersInStoreRefundLineItemRequest record {
    Price amountPretax?;
    Price amountTax?;
    # The ID of the line item to return. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
    # The ID of the product to return. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # The quantity to return and refund.
    int quantity?;
    # The reason for the return. Acceptable values are: - "`customerDiscretionaryReturn`" - "`customerInitiatedMerchantCancel`" - "`deliveredTooLate`" - "`expiredItem`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`other`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`qualityNotAsExpected`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" - "`wrongProductShipped`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type OrderLineItemReturnInfo record {
    # Required. How many days later the item can be returned.
    int daysToReturn?;
    # Required. Whether the item is returnable.
    boolean isReturnable?;
    # Required. URL of the item return policy.
    string policyUrl?;
};

public type AccountAdwordsLink record {
    # Customer ID of the AdWords account.
    string adwordsId?;
    # Status of the link between this Merchant Center account and the AdWords account. Upon retrieval, it represents the actual status of the link and can be either `active` if it was approved in Google AdWords or `pending` if it's pending approval. Upon insertion, it represents the *intended* status of the link. Re-uploading a link with status `active` when it's still pending or with status `pending` when it's already active will have no effect: the status will remain unchanged. Re-uploading a link with deprecated status `inactive` is equivalent to not submitting the link at all and will delete the link if it was active or cancel the link request if it was pending. Acceptable values are: - "`active`" - "`pending`" 
    string status?;
};

public type OrdersCustomBatchRequestEntryInStoreRefundLineItem record {
    Price amountPretax?;
    Price amountTax?;
    # The ID of the line item to return. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the product to return. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # The quantity to return and refund.
    int quantity?;
    # The reason for the return. Acceptable values are: - "`customerDiscretionaryReturn`" - "`customerInitiatedMerchantCancel`" - "`deliveredTooLate`" - "`expiredItem`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`other`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`qualityNotAsExpected`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" - "`wrongProductShipped`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type ShipmentTrackingInfo record {
    # The shipping carrier that handles the package. Acceptable values are: - "`boxtal`" - "`bpost`" - "`chronopost`" - "`colisPrive`" - "`colissimo`" - "`cxt`" - "`deliv`" - "`dhl`" - "`dpd`" - "`dynamex`" - "`eCourier`" - "`easypost`" - "`efw`" - "`fedex`" - "`fedexSmartpost`" - "`geodis`" - "`gls`" - "`googleCourier`" - "`gsx`" - "`jdLogistics`" - "`laPoste`" - "`lasership`" - "`manual`" - "`mpx`" - "`onTrac`" - "`other`" - "`tnt`" - "`uds`" - "`ups`" - "`usps`" 
    string carrier?;
    # The tracking number for the package.
    string trackingNumber?;
};

public type LiaOnDisplayToOrderSettings record {
    # Shipping cost and policy URL.
    string shippingCostPolicyUrl?;
    # The status of the ?On display to order? feature. Acceptable values are: - "`active`" - "`inactive`" - "`pending`" 
    string status?;
};

public type OrderLineItem record {
    # Annotations that are attached to the line item.
    OrderMerchantProvidedAnnotation[] annotations?;
    # Cancellations of the line item.
    OrderCancellation[] cancellations?;
    # The ID of the line item.
    string id?;
    Price price?;
    OrderLineItemProduct product?;
    # Number of items canceled.
    int quantityCanceled?;
    # Number of items delivered.
    int quantityDelivered?;
    # Number of items ordered.
    int quantityOrdered?;
    # Number of items pending.
    int quantityPending?;
    # Number of items ready for pickup.
    int quantityReadyForPickup?;
    # Number of items returned.
    int quantityReturned?;
    # Number of items shipped.
    int quantityShipped?;
    OrderLineItemReturnInfo returnInfo?;
    # Returns of the line item.
    OrderReturn[] 'returns?;
    OrderLineItemShippingDetails shippingDetails?;
    Price tax?;
};

public type OrdersCancelResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersCancelResponse".
    string kind?;
};

public type DatafeedsListResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#datafeedsListResponse".
    string kind?;
    # The token for the retrieval of the next page of datafeeds.
    string nextPageToken?;
    Datafeed[] resources?;
};

public type GmbAccounts record {
    # The ID of the Merchant Center account.
    string accountId?;
    # A list of GMB accounts which are available to the merchant.
    GmbAccountsGmbAccount[] gmbAccounts?;
};

public type AccountStatusStatistics record {
    # Number of active offers.
    string active?;
    # Number of disapproved offers.
    string disapproved?;
    # Number of expiring offers.
    string expiring?;
    # Number of pending offers.
    string pending?;
};

# A batch entry encoding a single non-batch accounts response.
public type AccountsCustomBatchResponseEntry record {
    # Account data. After the creation of a new account it may take a few minutes before it is fully operational. The methods delete, insert, and update require the admin role.
    Account account?;
    # The ID of the request entry this entry responds to.
    int batchId?;
    # A list of errors returned by a failed batch entry.
    Errors errors?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#accountsCustomBatchResponseEntry`"
    string kind?;
    # Deprecated. This field is never set. Acceptable values are: - "`active`" - "`inactive`" - "`pending`" 
    string linkStatus?;
};

public type AccountCustomerService record {
    # Customer service email.
    string email?;
    # Customer service phone number.
    string phoneNumber?;
    # Customer service URL.
    string url?;
};

public type OrderLineItemProductFee record {
    Price amount?;
    # Name of the fee.
    string name?;
};

# Order disbursement. All methods require the payment analyst role.
public type OrderReportDisbursement record {
    Price disbursementAmount?;
    # The disbursement date, in ISO 8601 format.
    string disbursementCreationDate?;
    # The date the disbursement was initiated, in ISO 8601 format.
    string disbursementDate?;
    # The ID of the disbursement.
    string disbursementId?;
    # The ID of the managing account.
    string merchantId?;
};

public type TestOrder record {
    TestOrderCustomer customer?;
    # Whether the orderinvoices service should support this order.
    boolean enableOrderinvoices?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#testOrder`"
    string kind?;
    # Required. Line items that are ordered. At least one line item must be provided.
    TestOrderLineItem[] lineItems?;
    # Restricted. Do not use.
    string notificationMode?;
    TestOrderPaymentMethod paymentMethod?;
    # Required. Identifier of one of the predefined delivery addresses for the delivery. Acceptable values are: - "`dwight`" - "`jim`" - "`pam`" 
    string predefinedDeliveryAddress?;
    # Identifier of one of the predefined pickup details. Required for orders containing line items with shipping type `pickup`. Acceptable values are: - "`dwight`" - "`jim`" - "`pam`" 
    string predefinedPickupDetails?;
    # Deprecated. Ignored if provided.
    OrderLegacyPromotion[] promotions?;
    Price shippingCost?;
    Price shippingCostTax?;
    # Required. The requested shipping option. Acceptable values are: - "`economy`" - "`expedited`" - "`oneDay`" - "`sameDay`" - "`standard`" - "`twoDay`" 
    string shippingOption?;
};

# A batch entry encoding a single non-batch shippingsettings request.
public type ShippingsettingsCustomBatchRequestEntry record {
    # The ID of the account for which to get/update account shipping settings.
    string accountId?;
    # An entry ID, unique within the batch request.
    int batchId?;
    # The ID of the managing account.
    string merchantId?;
    # The method of the batch entry. Acceptable values are: - "`get`" - "`update`" 
    string method?;
    # The merchant account's shipping settings. All methods except getsupportedcarriers and getsupportedholidays require the admin role.
    ShippingSettings shippingSettings?;
};

public type ProductShippingDimension record {
    # The unit of value.
    string unit?;
    # The dimension of the product used to calculate the shipping cost of the item.
    float value?;
};

public type AccountstatusesListResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#accountstatusesListResponse".
    string kind?;
    # The token for the retrieval of the next page of account statuses.
    string nextPageToken?;
    AccountStatus[] resources?;
};

# The status of a datafeed, i.e., the result of the last retrieval of the datafeed computed asynchronously when the feed processing is finished.
public type DatafeedStatus record {
    # The country for which the status is reported, represented as a CLDR territory code.
    string country?;
    # The ID of the feed for which the status is reported.
    string datafeedId?;
    # The list of errors occurring in the feed.
    DatafeedStatusError[] errors?;
    # The number of items in the feed that were processed.
    string itemsTotal?;
    # The number of items in the feed that were valid.
    string itemsValid?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#datafeedStatus`"
    string kind?;
    # The two-letter ISO 639-1 language for which the status is reported.
    string language?;
    # The last date at which the feed was uploaded.
    string lastUploadDate?;
    # The processing status of the feed. Acceptable values are: - "`"`failure`": The feed could not be processed or all items had errors.`" - "`in progress`": The feed is being processed. - "`none`": The feed has not yet been processed. For example, a feed that has never been uploaded will have this processing status. - "`success`": The feed was processed successfully, though some items might have had errors. 
    string processingStatus?;
    # The list of errors occurring in the feed.
    DatafeedStatusError[] warnings?;
};

public type AccountStatusDataQualityIssue record {
    string country?;
    string destination?;
    string detail?;
    string displayedValue?;
    AccountStatusExampleItem[] exampleItems?;
    string id?;
    string lastChecked?;
    string location?;
    int numItems?;
    #  Acceptable values are: - "`critical`" - "`error`" - "`suggestion`" 
    string severity?;
    string submittedValue?;
};

public type AccountAddress record {
    # CLDR country code (e.g. "US"). This value cannot be set for a sub-account of an MCA. All MCA sub-accounts inherit the country of their parent MCA.
    string country?;
    # City, town or commune. May also include dependent localities or sublocalities (e.g. neighborhoods or suburbs).
    string locality?;
    # Postal code or ZIP (e.g. "94043").
    string postalCode?;
    # Top-level administrative subdivision of the country. For example, a state like California ("CA") or a province like Quebec ("QC").
    string region?;
    # Street-level part of the address.
    string streetAddress?;
};

public type OrderShipment record {
    # The carrier handling the shipment. For supported carriers, Google includes the carrier name and tracking URL in emails to customers. For select supported carriers, Google also automatically updates the shipment status based on the provided shipment ID. *Note:* You can also use unsupported carriers, but emails to customers will not include the carrier name or tracking URL, and there will be no automatic order status updates. Supported carriers for US are: - "`ups`" (United Parcel Service) *automatic status updates* - "`usps`" (United States Postal Service) *automatic status updates* - "`fedex`" (FedEx) *automatic status updates * - "`dhl`" (DHL eCommerce) *automatic status updates* (US only) - "`ontrac`" (OnTrac) *automatic status updates * - "`dhl express`" (DHL Express) - "`deliv`" (Deliv) - "`dynamex`" (TForce) - "`lasership`" (LaserShip) - "`mpx`" (Military Parcel Xpress) - "`uds`" (United Delivery Service) - "`efw`" (Estes Forwarding Worldwide) - "`jd logistics`" (JD Logistics) - "`yunexpress`" (YunExpress) - "`china post`" (China Post) - "`china ems`" (China Post Express Mail Service) - "`singapore post`" (Singapore Post) - "`pos malaysia`" (Pos Malaysia) - "`postnl`" (PostNL) - "`ptt`" (PTT Turkish Post) - "`eub`" (ePacket) - "`chukou1`" (Chukou1 Logistics) - "`bestex`" (Best Express) - "`canada post`" (Canada Post) - "`purolator`" (Purolator) - "`canpar`" (Canpar) - "`india post`" (India Post) - "`blue dart`" (Blue Dart) - "`delhivery`" (Delhivery) - "`dtdc`" (DTDC) - "`tpc india`" (TPC India) Supported carriers for FR are: - "`la poste`" (La Poste) *automatic status updates * - "`colissimo`" (Colissimo by La Poste) *automatic status updates* - "`ups`" (United Parcel Service) *automatic status updates * - "`chronopost`" (Chronopost by La Poste) - "`gls`" (General Logistics Systems France) - "`dpd`" (DPD Group by GeoPost) - "`bpost`" (Belgian Post Group) - "`colis prive`" (Colis Privé) - "`boxtal`" (Boxtal) - "`geodis`" (GEODIS) - "`tnt`" (TNT) - "`db schenker`" (DB Schenker) - "`aramex`" (Aramex) 
    string carrier?;
    # Date on which the shipment has been created, in ISO 8601 format.
    string creationDate?;
    # Date on which the shipment has been delivered, in ISO 8601 format. Present only if `status` is `delivered`
    string deliveryDate?;
    # The ID of the shipment.
    string id?;
    # The line items that are shipped.
    OrderShipmentLineItemShipment[] lineItems?;
    OrderShipmentScheduledDeliveryDetails scheduledDeliveryDetails?;
    # The status of the shipment. Acceptable values are: - "`delivered`" - "`readyForPickup`" - "`shipped`" - "`undeliverable`" 
    string status?;
    # The tracking ID for the shipment.
    string trackingId?;
};

# The status of an account, i.e., information about its products, which is computed offline and not returned immediately at insertion time.
public type AccountStatus record {
    # The ID of the account for which the status is reported.
    string accountId?;
    # A list of account level issues.
    AccountStatusAccountLevelIssue[] accountLevelIssues?;
    # DEPRECATED - never populated.
    AccountStatusDataQualityIssue[] dataQualityIssues?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#accountStatus`"
    string kind?;
    # List of product-related data by channel, destination, and country. Data in this field may be delayed by up to 30 minutes.
    AccountStatusProducts[] products?;
    # Whether the account's website is claimed or not.
    boolean websiteClaimed?;
};

public type OrdersAdvanceTestOrderResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersAdvanceTestOrderResponse".
    string kind?;
};

public type LiasettingsCustomBatchResponseEntry record {
    # The ID of the request entry to which this entry responds.
    int batchId?;
    # A list of errors returned by a failed batch entry.
    Errors errors?;
    GmbAccounts gmbAccounts?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#liasettingsCustomBatchResponseEntry`"
    string kind?;
    # Local Inventory ads (LIA) settings. All methods except listposdataproviders require the admin role.
    LiaSettings liaSettings?;
    # The list of POS data providers.
    PosDataProviders[] posDataProviders?;
};

public type DatafeedsCustomBatchRequest record {
    # The request entries to be processed in the batch.
    DatafeedsCustomBatchRequestEntry[] entries?;
};

public type OrderinvoicesCreateRefundInvoiceResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#orderinvoicesCreateRefundInvoiceResponse".
    string kind?;
};

public type PickupServicesPickupService record {
    # The name of the carrier (e.g., `"UPS"`). Always present.
    string carrierName?;
    # The CLDR country code of the carrier (e.g., "US"). Always present.
    string country?;
    # The name of the pickup service (e.g., `"Access point"`). Always present.
    string serviceName?;
};

public type OrdersShipLineItemsResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersShipLineItemsResponse".
    string kind?;
};

public type ShippingsettingsCustomBatchResponse record {
    # The result of the execution of the batch requests.
    ShippingsettingsCustomBatchResponseEntry[] entries?;
    # Identifies what kind of resource this is. Value: the fixed string "content#shippingsettingsCustomBatchResponse".
    string kind?;
};

public type OrdersRefundRequest record {
    Price amount?;
    Price amountPretax?;
    Price amountTax?;
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
    # The reason for the refund. Acceptable values are: - "`adjustment`" - "`courtesyAdjustment`" - "`customerCanceled`" - "`customerDiscretionaryReturn`" - "`deliveredLateByCarrier`" - "`feeAdjustment`" - "`lateShipmentCredit`" - "`noInventory`" - "`other`" - "`priceError`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`shippingCostAdjustment`" - "`taxAdjustment`" - "`undeliverableShippingAddress`" - "`wrongProductShipped`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type ShipmentInvoice record {
    InvoiceSummary invoiceSummary?;
    # [required] Invoice details per line item.
    ShipmentInvoiceLineItemInvoice[] lineItemInvoices?;
    # [required] ID of the shipment group. It is assigned by the merchant in the `shipLineItems` method and is used to group multiple line items that have the same kind of shipping charges.
    string shipmentGroupId?;
};

# Order. Production access (all methods) requires the order manager role. Sandbox access does not.
public type Order record {
    # Whether the order was acknowledged.
    boolean acknowledged?;
    # Deprecated. Acceptable values are: - "`googleExpress`" - "`purchasesOnGoogle`" 
    string channelType?;
    OrderCustomer customer?;
    OrderDeliveryDetails deliveryDetails?;
    # The REST ID of the order. Globally unique.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#order`"
    string kind?;
    # Line items that are ordered.
    OrderLineItem[] lineItems?;
    string merchantId?;
    # Merchant-provided ID of the order.
    string merchantOrderId?;
    Price netAmount?;
    OrderPaymentMethod paymentMethod?;
    # The status of the payment. Acceptable values are: - "`paymentCaptured`" - "`paymentRejected`" - "`paymentSecured`" - "`pendingAuthorization`" 
    string paymentStatus?;
    OrderPickupDetails pickupDetails?;
    # The date when the order was placed, in ISO 8601 format.
    string placedDate?;
    # The details of the merchant provided promotions applied to the order. To determine which promotions apply to which products, check the `Promotions[].Benefits[].OfferIds` field against the `LineItems[].Product.OfferId` field for each promotion. If a promotion is applied to more than 1 `offerId`, divide the discount value by the number of affected offers to determine how much discount to apply to each `offerId`. Examples: 1. To calculate the line item level discount for a single specific item: For each promotion, subtract the `Promotions[].Benefits[].Discount.value` amount from the `LineItems[].Price.value`. 2. To calculate the line item level discount for multiple quantity of a specific item: For each promotion, divide the `Promotions[].Benefits[].Discount.value` by the quantity of products and substract it from `LineItems[].Product.Price.value` for each quantity item. Only 1 promotion can be applied to an offerId in a given order. To refund an item which had a promotion applied to it, make sure to refund the amount after first subtracting the promotion discount from the item price. More details about the program are here.
    OrderLegacyPromotion[] promotions?;
    # Refunds for the order.
    OrderRefund[] refunds?;
    # Shipments of the order.
    OrderShipment[] shipments?;
    Price shippingCost?;
    Price shippingCostTax?;
    # Deprecated. Shipping details are provided with line items instead. Acceptable values are: - "`economy`" - "`expedited`" - "`oneDay`" - "`sameDay`" - "`standard`" - "`twoDay`" 
    string shippingOption?;
    # The status of the order. Acceptable values are: - "`canceled`" - "`delivered`" - "`inProgress`" - "`partiallyDelivered`" - "`partiallyReturned`" - "`partiallyShipped`" - "`pendingShipment`" - "`returned`" - "`shipped`" 
    string status?;
    # The party responsible for collecting and remitting taxes. Acceptable values are: - "`marketplaceFacilitator`" - "`merchant`" 
    string taxCollector?;
};

# A batch entry encoding a single non-batch inventory request.
public type InventoryCustomBatchRequestEntry record {
    # An entry ID, unique within the batch request.
    int batchId?;
    Inventory inventory?;
    # The ID of the managing account.
    string merchantId?;
    # The ID of the product for which to update price and availability.
    string productId?;
    # The code of the store for which to update price and availability. Use `online` to update price and availability of an online product.
    string storeCode?;
};

public type OrdersGetByMerchantOrderIdResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersGetByMerchantOrderIdResponse".
    string kind?;
    # Order. Production access (all methods) requires the order manager role. Sandbox access does not.
    Order 'order?;
};

public type OrdersCustomBatchRequestEntryRejectReturnLineItem record {
    # The ID of the line item to return. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the product to return. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # The quantity to return and refund.
    int quantity?;
    # The reason for the return. Acceptable values are: - "`damagedOrUsed`" - "`missingComponent`" - "`notEligible`" - "`other`" - "`outOfReturnWindow`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type ProductsListResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#productsListResponse".
    string kind?;
    # The token for the retrieval of the next page of products.
    string nextPageToken?;
    Product[] resources?;
};

public type OrdersAcknowledgeRequest record {
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
};

# A list of errors returned by a failed batch entry.
public type Errors record {
    # The HTTP status of the first error in `errors`.
    int code?;
    # A list of errors.
    Error[] errors?;
    # The message of the first error in `errors`.
    string message?;
};

public type Price record {
    # The currency of the price.
    string currency?;
    # The price represented as a number.
    string value?;
};

# The single value of a rate group or the value of a rate group table's cell. Exactly one of `noShipping`, `flatRate`, `pricePercentage`, `carrierRateName`, `subtableName` must be set.
public type Value record {
    # The name of a carrier rate referring to a carrier rate defined in the same rate group. Can only be set if all other fields are not set.
    string carrierRateName?;
    Price flatRate?;
    # If true, then the product can't ship. Must be true when set, can only be set if all other fields are not set.
    boolean noShipping?;
    # A percentage of the price represented as a number in decimal notation (e.g., `"5.4"`). Can only be set if all other fields are not set.
    string pricePercentage?;
    # The name of a subtable. Can only be set in table cells (i.e., not for single values), and only if all other fields are not set.
    string subtableName?;
};

public type OrdersCustomBatchRequestEntryCancelLineItem record {
    Price amount?;
    Price amountPretax?;
    Price amountTax?;
    # The ID of the line item to cancel. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the product to cancel. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # The quantity to cancel.
    int quantity?;
    # The reason for the cancellation. Acceptable values are: - "`customerInitiatedCancel`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`noInventory`" - "`other`" - "`priceError`" - "`shippingPriceError`" - "`taxError`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type PosInventoryResponse record {
    # Required. The two-letter ISO 639-1 language code for the item.
    string contentLanguage?;
    # Global Trade Item Number.
    string gtin?;
    # Required. A unique identifier for the item.
    string itemId?;
    # Identifies what kind of resource this is. Value: the fixed string "content#posInventoryResponse".
    string kind?;
    Price price?;
    # Required. The available quantity of the item.
    string quantity?;
    # Required. The identifier of the merchant's store. Either a `storeCode` inserted via the API or the code of the store in Google My Business.
    string storeCode?;
    # Required. The CLDR territory code for the item.
    string targetCountry?;
    # Required. The inventory timestamp, in ISO 8601 format.
    string timestamp?;
};

public type OrderCancellation record {
    # The actor that created the cancellation. Acceptable values are: - "`customer`" - "`googleBot`" - "`googleCustomerService`" - "`googlePayments`" - "`googleSabre`" - "`merchant`" 
    string actor?;
    # Date on which the cancellation has been created, in ISO 8601 format.
    string creationDate?;
    # The quantity that was canceled.
    int quantity?;
    # The reason for the cancellation. Orders that are canceled with a noInventory reason will lead to the removal of the product from Buy on Google until you make an update to that product. This will not affect your Shopping ads. Acceptable values are: - "`autoPostInternal`" - "`autoPostInvalidBillingAddress`" - "`autoPostNoInventory`" - "`autoPostPriceError`" - "`autoPostUndeliverableShippingAddress`" - "`couponAbuse`" - "`customerCanceled`" - "`customerInitiatedCancel`" - "`customerSupportRequested`" - "`failToPushOrderGoogleError`" - "`failToPushOrderMerchantError`" - "`failToPushOrderMerchantFulfillmentError`" - "`failToPushOrderToMerchant`" - "`failToPushOrderToMerchantOutOfStock`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`merchantDidNotShipOnTime`" - "`noInventory`" - "`orderTimeout`" - "`other`" - "`paymentAbuse`" - "`paymentDeclined`" - "`priceError`" - "`returnRefundAbuse`" - "`shippingPriceError`" - "`taxError`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type ProductstatusesListResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#productstatusesListResponse".
    string kind?;
    # The token for the retrieval of the next page of products statuses.
    string nextPageToken?;
    ProductStatus[] resources?;
};

public type Row record {
    # The list of cells that constitute the row. Must have the same length as `columnHeaders` for two-dimensional tables, a length of 1 for one-dimensional tables. Required.
    Value[] cells?;
};

public type LiasettingsCustomBatchRequest record {
    # The request entries to be processed in the batch.
    LiasettingsCustomBatchRequestEntry[] entries?;
};

public type DatafeedstatusesCustomBatchRequest record {
    # The request entries to be processed in the batch.
    DatafeedstatusesCustomBatchRequestEntry[] entries?;
};

# A non-empty list of row or column headers for a table. Exactly one of `prices`, `weights`, `numItems`, `postalCodeGroupNames`, or `location` must be set.
public type Headers record {
    # A list of location ID sets. Must be non-empty. Can only be set if all other fields are not set.
    LocationIdSet[] locations?;
    # A list of inclusive number of items upper bounds. The last value can be `"infinity"`. For example `["10", "50", "infinity"]` represents the headers "<= 10 items", "<= 50 items", and "> 50 items". Must be non-empty. Can only be set if all other fields are not set.
    string[] numberOfItems?;
    # A list of postal group names. The last value can be `"all other locations"`. Example: `["zone 1", "zone 2", "all other locations"]`. The referred postal code groups must match the delivery country of the service. Must be non-empty. Can only be set if all other fields are not set.
    string[] postalCodeGroupNames?;
    # A list of inclusive order price upper bounds. The last price's value can be `"infinity"`. For example `[{"value": "10", "currency": "USD"}, {"value": "500", "currency": "USD"}, {"value": "infinity", "currency": "USD"}]` represents the headers "<= $10", "<= $500", and "> $500". All prices within a service must have the same currency. Must be non-empty. Can only be set if all other fields are not set.
    Price[] prices?;
    # A list of inclusive order weight upper bounds. The last weight's value can be `"infinity"`. For example `[{"value": "10", "unit": "kg"}, {"value": "50", "unit": "kg"}, {"value": "infinity", "unit": "kg"}]` represents the headers "<= 10kg", "<= 50kg", and "> 50kg". All weights within a service must have the same unit. Must be non-empty. Can only be set if all other fields are not set.
    Weight[] weights?;
};

# Tax calculation rule to apply in a state or province (USA only).
public type AccountTaxTaxRule record {
    # Country code in which tax is applicable.
    string country?;
    # Required. State (or province) is which the tax is applicable, described by its location ID (also called criteria ID).
    string locationId?;
    # Explicit tax rate in percent, represented as a floating point number without the percentage character. Must not be negative.
    string ratePercent?;
    # If true, shipping charges are also taxed.
    boolean shippingTaxed?;
    # Whether the tax rate is taken from a global tax table or specified explicitly.
    boolean useGlobalRate?;
};

public type LoyaltyPoints record {
    # Name of loyalty points program. It is recommended to limit the name to 12 full-width characters or 24 Roman characters.
    string name?;
    # The retailer's loyalty points in absolute value.
    string pointsValue?;
    # The ratio of a point when converted to currency. Google assumes currency based on Merchant Center settings. If ratio is left out, it defaults to 1.0.
    float ratio?;
};

public type LiaCountrySettings record {
    LiaAboutPageSettings about?;
    # Required. CLDR country code (e.g. "US").
    string country?;
    # The status of the "Merchant hosted local storefront" feature.
    boolean hostedLocalStorefrontActive?;
    LiaInventorySettings inventory?;
    LiaOnDisplayToOrderSettings onDisplayToOrder?;
    LiaPosDataProvider posDataProvider?;
    # The status of the "Store pickup" feature.
    boolean storePickupActive?;
};

public type AccounttaxListResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#accounttaxListResponse".
    string kind?;
    # The token for the retrieval of the next page of account tax settings.
    string nextPageToken?;
    AccountTax[] resources?;
};

public type OrdersReturnLineItemRequest record {
    # The ID of the line item to return. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
    # The ID of the product to return. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # The quantity to return.
    int quantity?;
    # The reason for the return. Acceptable values are: - "`customerDiscretionaryReturn`" - "`customerInitiatedMerchantCancel`" - "`deliveredTooLate`" - "`expiredItem`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`other`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`qualityNotAsExpected`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" - "`wrongProductShipped`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type OrderLineItemProduct record {
    # Brand of the item.
    string brand?;
    # The item's channel (online or local). Acceptable values are: - "`local`" - "`online`" 
    string 'channel?;
    # Condition or state of the item. Acceptable values are: - "`new`" - "`refurbished`" - "`used`" 
    string condition?;
    # The two-letter ISO 639-1 language code for the item.
    string contentLanguage?;
    # Associated fees at order creation time.
    OrderLineItemProductFee[] fees?;
    # Global Trade Item Number (GTIN) of the item.
    string gtin?;
    # The REST ID of the product.
    string id?;
    # URL of an image of the item.
    string imageLink?;
    # Shared identifier for all variants of the same product.
    string itemGroupId?;
    # Manufacturer Part Number (MPN) of the item.
    string mpn?;
    # An identifier of the item.
    string offerId?;
    Price price?;
    # URL to the cached image shown to the user when order was placed.
    string shownImage?;
    # The CLDR territory // code of the target country of the product.
    string targetCountry?;
    # The title of the product.
    string title?;
    # Variant attributes for the item. These are dimensions of the product, such as color, gender, material, pattern, and size. You can find a comprehensive list of variant attributes here.
    OrderLineItemProductVariantAttribute[] variantAttributes?;
};

public type OrdersCancelLineItemRequest record {
    Price amount?;
    Price amountPretax?;
    Price amountTax?;
    # The ID of the line item to cancel. Either lineItemId or productId is required.
    string lineItemId?;
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
    # The ID of the product to cancel. This is the REST ID used in the products service. Either lineItemId or productId is required.
    string productId?;
    # The quantity to cancel.
    int quantity?;
    # The reason for the cancellation. Acceptable values are: - "`customerInitiatedCancel`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`noInventory`" - "`other`" - "`priceError`" - "`shippingPriceError`" - "`taxError`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type OrderLineItemProductVariantAttribute record {
    # The dimension of the variant.
    string dimension?;
    # The value for the dimension.
    string value?;
};

public type OrdersSetLineItemMetadataResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#ordersSetLineItemMetadataResponse".
    string kind?;
};

public type AccountGoogleMyBusinessLink record {
    # The GMB email address of which a specific account within a GMB account. A sample account within a GMB account could be a business account with set of locations, managed under the GMB account.
    string gmbEmail?;
    # Status of the link between this Merchant Center account and the GMB account. Acceptable values are: - "`active`" - "`pending`" 
    string status?;
};

public type ProductUnitPricingBaseMeasure record {
    # The unit of the denominator.
    string unit?;
    # The denominator of the unit price.
    string value?;
};

public type PosListResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#posListResponse".
    string kind?;
    PosStore[] resources?;
};

# Local Inventory ads (LIA) settings. All methods except listposdataproviders require the admin role.
public type LiaSettings record {
    # The ID of the account to which these LIA settings belong. Ignored upon update, always present in get request responses.
    string accountId?;
    # The LIA settings for each country.
    LiaCountrySettings[] countrySettings?;
    # Identifies what kind of resource this is. Value: the fixed string "`content#liaSettings`"
    string kind?;
};

# An error returned by the API.
public type Error record {
    # The domain of the error.
    string domain?;
    # A description of the error.
    string message?;
    # The error code.
    string reason?;
};

public type Service record {
    # A boolean exposing the active status of the shipping service. Required.
    boolean active?;
    # The CLDR code of the currency to which this service applies. Must match that of the prices in rate groups.
    string currency?;
    # The CLDR territory code of the country to which the service applies. Required.
    string deliveryCountry?;
    DeliveryTime deliveryTime?;
    # Eligibility for this service. Acceptable values are: - "`All scenarios`" - "`All scenarios except Shopping Actions`" - "`Shopping Actions`" 
    string eligibility?;
    Price minimumOrderValue?;
    MinimumOrderValueTable minimumOrderValueTable?;
    # Free-form name of the service. Must be unique within target account. Required.
    string name?;
    PickupCarrierService pickupService?;
    # Shipping rate group definitions. Only the last one is allowed to have an empty `applicableShippingLabels`, which means "everything else". The other `applicableShippingLabels` must not overlap.
    RateGroup[] rateGroups?;
    # Type of locations this service ships orders to. Acceptable values are: - "`delivery`" - "`pickup`" 
    string shipmentType?;
};

public type AccountBusinessInformation record {
    AccountAddress address?;
    AccountCustomerService customerService?;
    # The phone number of the business.
    string phoneNumber?;
};

public type OrderReturn record {
    # The actor that created the refund. Acceptable values are: - "`customer`" - "`googleBot`" - "`googleCustomerService`" - "`googlePayments`" - "`googleSabre`" - "`merchant`" 
    string actor?;
    # Date on which the item has been created, in ISO 8601 format.
    string creationDate?;
    # Quantity that is returned.
    int quantity?;
    # The reason for the return. Acceptable values are: - "`customerDiscretionaryReturn`" - "`customerInitiatedMerchantCancel`" - "`deliveredTooLate`" - "`expiredItem`" - "`invalidCoupon`" - "`malformedShippingAddress`" - "`other`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`qualityNotAsExpected`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" - "`wrongProductShipped`" 
    string reason?;
    # The explanation of the reason.
    string reasonText?;
};

public type OrderinvoicesCreateChargeInvoiceResponse record {
    # The status of the execution. Acceptable values are: - "`duplicate`" - "`executed`" 
    string executionStatus?;
    # Identifies what kind of resource this is. Value: the fixed string "content#orderinvoicesCreateChargeInvoiceResponse".
    string kind?;
};

public type BusinessDayConfig record {
    # Regular business days, such as '"monday"'. May not be empty.
    string[] businessDays?;
};

public type LiasettingsListResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#liasettingsListResponse".
    string kind?;
    # The token for the retrieval of the next page of LIA settings.
    string nextPageToken?;
    LiaSettings[] resources?;
};

public type OrdersUpdateMerchantOrderIdRequest record {
    # The merchant order id to be assigned to the order. Must be unique per merchant.
    string merchantOrderId?;
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
};

public type ProductstatusesCustomBatchResponse record {
    # The result of the execution of the batch requests.
    ProductstatusesCustomBatchResponseEntry[] entries?;
    # Identifies what kind of resource this is. Value: the fixed string "content#productstatusesCustomBatchResponse".
    string kind?;
};

public type AccountsClaimWebsiteResponse record {
    # Identifies what kind of resource this is. Value: the fixed string "content#accountsClaimWebsiteResponse".
    string kind?;
};

public type RefundReason record {
    # Description of the reason.
    string description?;
    # Code of the refund reason. Acceptable values are: - "`adjustment`" - "`autoPostInternal`" - "`autoPostInvalidBillingAddress`" - "`autoPostNoInventory`" - "`autoPostPriceError`" - "`autoPostUndeliverableShippingAddress`" - "`couponAbuse`" - "`courtesyAdjustment`" - "`customerCanceled`" - "`customerDiscretionaryReturn`" - "`customerInitiatedMerchantCancel`" - "`customerSupportRequested`" - "`deliveredLateByCarrier`" - "`deliveredTooLate`" - "`expiredItem`" - "`failToPushOrderGoogleError`" - "`failToPushOrderMerchantError`" - "`failToPushOrderMerchantFulfillmentError`" - "`failToPushOrderToMerchant`" - "`failToPushOrderToMerchantOutOfStock`" - "`feeAdjustment`" - "`invalidCoupon`" - "`lateShipmentCredit`" - "`malformedShippingAddress`" - "`merchantDidNotShipOnTime`" - "`noInventory`" - "`orderTimeout`" - "`other`" - "`paymentAbuse`" - "`paymentDeclined`" - "`priceAdjustment`" - "`priceError`" - "`productArrivedDamaged`" - "`productNotAsDescribed`" - "`promoReallocation`" - "`qualityNotAsExpected`" - "`returnRefundAbuse`" - "`shippingCostAdjustment`" - "`shippingPriceError`" - "`taxAdjustment`" - "`taxError`" - "`undeliverableShippingAddress`" - "`unsupportedPoBoxAddress`" - "`wrongProductShipped`" 
    string reasonCode?;
};

public type ReturnShipment record {
    # The date of creation of the shipment, in ISO 8601 format.
    string creationDate?;
    # The date of delivery of the shipment, in ISO 8601 format.
    string deliveryDate?;
    # Type of the return method. Acceptable values are: - "`byMail`" - "`contactCustomerSupport`" - "`returnless`" 
    string returnMethodType?;
    # Shipment ID generated by Google.
    string shipmentId?;
    # Tracking information of the shipment. One return shipment might be handled by several shipping carriers sequentially.
    ShipmentTrackingInfo[] shipmentTrackingInfos?;
    # The date of shipping of the shipment, in ISO 8601 format.
    string shippingDate?;
    # State of the shipment. Acceptable values are: - "`completed`" - "`new`" - "`shipped`" - "`undeliverable`" - "`pending`" 
    string state?;
};

public type InventoryPickup record {
    # Whether store pickup is available for this offer and whether the pickup option should be shown as buy, reserve, or not supported. Only supported for local inventory. Unless the value is "not supported", must be submitted together with `pickupSla`. Acceptable values are: - "`buy`" - "`not supported`" - "`reserve`" - "`ship to store`" 
    string pickupMethod?;
    # The expected date that an order will be ready for pickup, relative to when the order is placed. Only supported for local inventory. Must be submitted together with `pickupMethod`. Acceptable values are: - "`five day`" - "`four day`" - "`multi day`" - "`multi week`" - "`next day`" - "`same day`" - "`seven day`" - "`six day`" - "`three day`" - "`two day`" 
    string pickupSla?;
};

public type DatafeedFormat record {
    # Delimiter for the separation of values in a delimiter-separated values feed. If not specified, the delimiter will be auto-detected. Ignored for non-DSV data feeds. Acceptable values are: - "`pipe`" - "`tab`" - "`tilde`" 
    string columnDelimiter?;
    # Character encoding scheme of the data feed. If not specified, the encoding will be auto-detected. Acceptable values are: - "`latin-1`" - "`utf-16be`" - "`utf-16le`" - "`utf-8`" - "`windows-1252`" 
    string fileEncoding?;
    # Specifies how double quotes are interpreted. If not specified, the mode will be auto-detected. Ignored for non-DSV data feeds. Acceptable values are: - "`normal character`" - "`value quoting`" 
    string quotingMode?;
};

public type OrdersShipLineItemsRequest record {
    # Deprecated. Please use shipmentInfo instead. The carrier handling the shipment. See `shipments[].carrier` in the Orders resource representation for a list of acceptable values.
    string carrier?;
    # Line items to ship.
    OrderShipmentLineItemShipment[] lineItems?;
    # The ID of the operation. Unique across all operations for a given order.
    string operationId?;
    # ID of the shipment group. Required for orders that use the orderinvoices service.
    string shipmentGroupId?;
    # Deprecated. Please use shipmentInfo instead. The ID of the shipment.
    string shipmentId?;
    # Shipment information. This field is repeated because a single line item can be shipped in several packages (and have several tracking IDs).
    OrdersCustomBatchRequestEntryShipLineItemsShipmentInfo[] shipmentInfos?;
    # Deprecated. Please use shipmentInfo instead. The tracking ID for the shipment.
    string trackingId?;
};

public type PosDataProviders record {
    # Country code.
    string country?;
    # A list of POS data providers.
    PosDataProvidersPosDataProvider[] posDataProviders?;
};
