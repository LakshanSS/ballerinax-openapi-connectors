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

import ballerina/http;
import ballerina/url;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector for [Google Shopping Content API v2](https://developers.google.com/shopping-content/reference/rest/v2.1) OpenAPI specification.
# The Google Shopping Content API provides the capability to manage your product listings and accounts for Google Shopping.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://shoppingcontent.googleapis.com/content/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Returns information about the authenticated user.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentAccountsAuthinfo(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AccountsAuthInfoResponse|error {
        string  path = string `/accounts/authinfo`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        AccountsAuthInfoResponse response = check self.clientEp-> get(path, targetType = AccountsAuthInfoResponse);
        return response;
    }
    # Retrieves, inserts, updates, and deletes multiple Merchant Center (sub-)accounts in a single request.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentAccountsCustombatch(AccountsCustomBatchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns AccountsCustomBatchResponse|error {
        string  path = string `/accounts/batch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AccountsCustomBatchResponse response = check self.clientEp->post(path, request, targetType=AccountsCustomBatchResponse);
        return response;
    }
    # Retrieves multiple Merchant Center account statuses in a single request.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentAccountstatusesCustombatch(AccountstatusesCustomBatchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AccountstatusesCustomBatchResponse|error {
        string  path = string `/accountstatuses/batch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AccountstatusesCustomBatchResponse response = check self.clientEp->post(path, request, targetType=AccountstatusesCustomBatchResponse);
        return response;
    }
    # Retrieves and updates tax settings of multiple accounts in a single request.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentAccounttaxCustombatch(AccounttaxCustomBatchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns AccounttaxCustomBatchResponse|error {
        string  path = string `/accounttax/batch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AccounttaxCustomBatchResponse response = check self.clientEp->post(path, request, targetType=AccounttaxCustomBatchResponse);
        return response;
    }
    # Deletes, fetches, gets, inserts and updates multiple datafeeds in a single request.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentDatafeedsCustombatch(DatafeedsCustomBatchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns DatafeedsCustomBatchResponse|error {
        string  path = string `/datafeeds/batch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DatafeedsCustomBatchResponse response = check self.clientEp->post(path, request, targetType=DatafeedsCustomBatchResponse);
        return response;
    }
    # Gets multiple Merchant Center datafeed statuses in a single request.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentDatafeedstatusesCustombatch(DatafeedstatusesCustomBatchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns DatafeedstatusesCustomBatchResponse|error {
        string  path = string `/datafeedstatuses/batch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DatafeedstatusesCustomBatchResponse response = check self.clientEp->post(path, request, targetType=DatafeedstatusesCustomBatchResponse);
        return response;
    }
    # Updates price and availability for multiple products or stores in a single request. This operation does not update the expiration date of the products.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentInventoryCustombatch(InventoryCustomBatchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns InventoryCustomBatchResponse|error {
        string  path = string `/inventory/batch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InventoryCustomBatchResponse response = check self.clientEp->post(path, request, targetType=InventoryCustomBatchResponse);
        return response;
    }
    # Retrieves and/or updates the LIA settings of multiple accounts in a single request.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentLiasettingsCustombatch(LiasettingsCustomBatchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns LiasettingsCustomBatchResponse|error {
        string  path = string `/liasettings/batch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LiasettingsCustomBatchResponse response = check self.clientEp->post(path, request, targetType=LiasettingsCustomBatchResponse);
        return response;
    }
    # Retrieves the list of POS data providers that have active settings for the all eiligible countries.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentLiasettingsListposdataproviders(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns LiasettingsListPosDataProvidersResponse|error {
        string  path = string `/liasettings/posdataproviders`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        LiasettingsListPosDataProvidersResponse response = check self.clientEp-> get(path, targetType = LiasettingsListPosDataProvidersResponse);
        return response;
    }
    # Retrieves or modifies multiple orders in a single request.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersCustombatch(OrdersCustomBatchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersCustomBatchResponse|error {
        string  path = string `/orders/batch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersCustomBatchResponse response = check self.clientEp->post(path, request, targetType=OrdersCustomBatchResponse);
        return response;
    }
    # Batches multiple POS-related calls in a single request.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentPosCustombatch(PosCustomBatchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns PosCustomBatchResponse|error {
        string  path = string `/pos/batch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PosCustomBatchResponse response = check self.clientEp->post(path, request, targetType=PosCustomBatchResponse);
        return response;
    }
    # Retrieves, inserts, and deletes multiple products in a single request.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentProductsCustombatch(ProductsCustomBatchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns ProductsCustomBatchResponse|error {
        string  path = string `/products/batch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProductsCustomBatchResponse response = check self.clientEp->post(path, request, targetType=ProductsCustomBatchResponse);
        return response;
    }
    # Gets the statuses of multiple products in a single request.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + includeAttributes - Flag to include full product data in the results of this request. The default value is false. 
    # + return - Successful response 
    remote isolated function contentProductstatusesCustombatch(ProductstatusesCustomBatchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? includeAttributes = ()) returns ProductstatusesCustomBatchResponse|error {
        string  path = string `/productstatuses/batch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "includeAttributes": includeAttributes};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProductstatusesCustomBatchResponse response = check self.clientEp->post(path, request, targetType=ProductstatusesCustomBatchResponse);
        return response;
    }
    # Retrieves and updates the shipping settings of multiple accounts in a single request.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentShippingsettingsCustombatch(ShippingsettingsCustomBatchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns ShippingsettingsCustomBatchResponse|error {
        string  path = string `/shippingsettings/batch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ShippingsettingsCustomBatchResponse response = check self.clientEp->post(path, request, targetType=ShippingsettingsCustomBatchResponse);
        return response;
    }
    # Lists the sub-accounts in your Merchant Center account.
    #
    # + merchantId - The ID of the managing account. This must be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + maxResults - The maximum number of accounts to return in the response, used for paging. 
    # + pageToken - The token returned by the previous request. 
    # + return - Successful response 
    remote isolated function contentAccountsList(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxResults = (), string? pageToken = ()) returns AccountsListResponse|error {
        string  path = string `/${merchantId}/accounts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        AccountsListResponse response = check self.clientEp-> get(path, targetType = AccountsListResponse);
        return response;
    }
    # Creates a Merchant Center sub-account.
    #
    # + merchantId - The ID of the managing account. This must be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentAccountsInsert(string merchantId, Account payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns Account|error {
        string  path = string `/${merchantId}/accounts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Account response = check self.clientEp->post(path, request, targetType=Account);
        return response;
    }
    # Retrieves a Merchant Center account.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentAccountsGet(string merchantId, string accountId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Account|error {
        string  path = string `/${merchantId}/accounts/${accountId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        Account response = check self.clientEp-> get(path, targetType = Account);
        return response;
    }
    # Updates a Merchant Center account. Any fields that are not provided are deleted from the resource.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentAccountsUpdate(string merchantId, string accountId, Account payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns Account|error {
        string  path = string `/${merchantId}/accounts/${accountId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Account response = check self.clientEp->put(path, request, targetType=Account);
        return response;
    }
    # Deletes a Merchant Center sub-account.
    #
    # + merchantId - The ID of the managing account. This must be a multi-client account, and accountId must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + force - Flag to delete sub-accounts with products. The default value is false. 
    # + return - Successful response 
    remote isolated function contentAccountsDelete(string merchantId, string accountId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = (), boolean? force = ()) returns http:Response|error {
        string  path = string `/${merchantId}/accounts/${accountId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun, "force": force};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Claims the website of a Merchant Center sub-account.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account whose website is claimed. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + overwrite - Only available to selected merchants. When set to `True`, this flag removes any existing claim on the requested website by another account and replaces it with a claim from this account. 
    # + return - Successful response 
    remote isolated function contentAccountsClaimwebsite(string merchantId, string accountId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? overwrite = ()) returns AccountsClaimWebsiteResponse|error {
        string  path = string `/${merchantId}/accounts/${accountId}/claimwebsite`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "overwrite": overwrite};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        AccountsClaimWebsiteResponse response = check self.clientEp-> post(path, request, targetType = AccountsClaimWebsiteResponse);
        return response;
    }
    # Performs an action on a link between two Merchant Center accounts, namely accountId and linkedAccountId.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account that should be linked. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentAccountsLink(string merchantId, string accountId, AccountsLinkRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AccountsLinkResponse|error {
        string  path = string `/${merchantId}/accounts/${accountId}/link`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AccountsLinkResponse response = check self.clientEp->post(path, request, targetType=AccountsLinkResponse);
        return response;
    }
    # Lists the statuses of the sub-accounts in your Merchant Center account.
    #
    # + merchantId - The ID of the managing account. This must be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + destinations - If set, only issues for the specified destinations are returned, otherwise only issues for the Shopping destination. 
    # + maxResults - The maximum number of account statuses to return in the response, used for paging. 
    # + pageToken - The token returned by the previous request. 
    # + return - Successful response 
    remote isolated function contentAccountstatusesList(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? destinations = (), int? maxResults = (), string? pageToken = ()) returns AccountstatusesListResponse|error {
        string  path = string `/${merchantId}/accountstatuses`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "destinations": destinations, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        AccountstatusesListResponse response = check self.clientEp-> get(path, targetType = AccountstatusesListResponse);
        return response;
    }
    # Retrieves the status of a Merchant Center account. No itemLevelIssues are returned for multi-client accounts.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + destinations - If set, only issues for the specified destinations are returned, otherwise only issues for the Shopping destination. 
    # + return - Successful response 
    remote isolated function contentAccountstatusesGet(string merchantId, string accountId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? destinations = ()) returns AccountStatus|error {
        string  path = string `/${merchantId}/accountstatuses/${accountId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "destinations": destinations};
        path = path + check getPathForQueryParam(queryParam);
        AccountStatus response = check self.clientEp-> get(path, targetType = AccountStatus);
        return response;
    }
    # Lists the tax settings of the sub-accounts in your Merchant Center account.
    #
    # + merchantId - The ID of the managing account. This must be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + maxResults - The maximum number of tax settings to return in the response, used for paging. 
    # + pageToken - The token returned by the previous request. 
    # + return - Successful response 
    remote isolated function contentAccounttaxList(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxResults = (), string? pageToken = ()) returns AccounttaxListResponse|error {
        string  path = string `/${merchantId}/accounttax`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        AccounttaxListResponse response = check self.clientEp-> get(path, targetType = AccounttaxListResponse);
        return response;
    }
    # Retrieves the tax settings of the account.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account for which to get/update account tax settings. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentAccounttaxGet(string merchantId, string accountId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AccountTax|error {
        string  path = string `/${merchantId}/accounttax/${accountId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        AccountTax response = check self.clientEp-> get(path, targetType = AccountTax);
        return response;
    }
    # Updates the tax settings of the account. Any fields that are not provided are deleted from the resource.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account for which to get/update account tax settings. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentAccounttaxUpdate(string merchantId, string accountId, AccountTax payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns AccountTax|error {
        string  path = string `/${merchantId}/accounttax/${accountId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AccountTax response = check self.clientEp->put(path, request, targetType=AccountTax);
        return response;
    }
    # Lists the configurations for datafeeds in your Merchant Center account.
    #
    # + merchantId - The ID of the account that manages the datafeeds. This account cannot be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + maxResults - The maximum number of products to return in the response, used for paging. 
    # + pageToken - The token returned by the previous request. 
    # + return - Successful response 
    remote isolated function contentDatafeedsList(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxResults = (), string? pageToken = ()) returns DatafeedsListResponse|error {
        string  path = string `/${merchantId}/datafeeds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        DatafeedsListResponse response = check self.clientEp-> get(path, targetType = DatafeedsListResponse);
        return response;
    }
    # Registers a datafeed configuration with your Merchant Center account.
    #
    # + merchantId - The ID of the account that manages the datafeed. This account cannot be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentDatafeedsInsert(string merchantId, Datafeed payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns Datafeed|error {
        string  path = string `/${merchantId}/datafeeds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Datafeed response = check self.clientEp->post(path, request, targetType=Datafeed);
        return response;
    }
    # Retrieves a datafeed configuration from your Merchant Center account.
    #
    # + merchantId - The ID of the account that manages the datafeed. This account cannot be a multi-client account. 
    # + datafeedId - The ID of the datafeed. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentDatafeedsGet(string merchantId, string datafeedId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Datafeed|error {
        string  path = string `/${merchantId}/datafeeds/${datafeedId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        Datafeed response = check self.clientEp-> get(path, targetType = Datafeed);
        return response;
    }
    # Updates a datafeed configuration of your Merchant Center account. Any fields that are not provided are deleted from the resource.
    #
    # + merchantId - The ID of the account that manages the datafeed. This account cannot be a multi-client account. 
    # + datafeedId - The ID of the datafeed. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentDatafeedsUpdate(string merchantId, string datafeedId, Datafeed payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns Datafeed|error {
        string  path = string `/${merchantId}/datafeeds/${datafeedId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Datafeed response = check self.clientEp->put(path, request, targetType=Datafeed);
        return response;
    }
    # Deletes a datafeed configuration from your Merchant Center account.
    #
    # + merchantId - The ID of the account that manages the datafeed. This account cannot be a multi-client account. 
    # + datafeedId - The ID of the datafeed. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentDatafeedsDelete(string merchantId, string datafeedId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns http:Response|error {
        string  path = string `/${merchantId}/datafeeds/${datafeedId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Invokes a fetch for the datafeed in your Merchant Center account. If you need to call this method more than once per day, we recommend you use the Products service to update your product data.
    #
    # + merchantId - The ID of the account that manages the datafeed. This account cannot be a multi-client account. 
    # + datafeedId - The ID of the datafeed to be fetched. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentDatafeedsFetchnow(string merchantId, string datafeedId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns DatafeedsFetchNowResponse|error {
        string  path = string `/${merchantId}/datafeeds/${datafeedId}/fetchNow`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        DatafeedsFetchNowResponse response = check self.clientEp-> post(path, request, targetType = DatafeedsFetchNowResponse);
        return response;
    }
    # Lists the statuses of the datafeeds in your Merchant Center account.
    #
    # + merchantId - The ID of the account that manages the datafeeds. This account cannot be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + maxResults - The maximum number of products to return in the response, used for paging. 
    # + pageToken - The token returned by the previous request. 
    # + return - Successful response 
    remote isolated function contentDatafeedstatusesList(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxResults = (), string? pageToken = ()) returns DatafeedstatusesListResponse|error {
        string  path = string `/${merchantId}/datafeedstatuses`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        DatafeedstatusesListResponse response = check self.clientEp-> get(path, targetType = DatafeedstatusesListResponse);
        return response;
    }
    # Retrieves the status of a datafeed from your Merchant Center account.
    #
    # + merchantId - The ID of the account that manages the datafeed. This account cannot be a multi-client account. 
    # + datafeedId - The ID of the datafeed. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + country - The country for which to get the datafeed status. If this parameter is provided then language must also be provided. Note that this parameter is required for feeds targeting multiple countries and languages, since a feed may have a different status for each target. 
    # + language - The language for which to get the datafeed status. If this parameter is provided then country must also be provided. Note that this parameter is required for feeds targeting multiple countries and languages, since a feed may have a different status for each target. 
    # + return - Successful response 
    remote isolated function contentDatafeedstatusesGet(string merchantId, string datafeedId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? country = (), string? language = ()) returns DatafeedStatus|error {
        string  path = string `/${merchantId}/datafeedstatuses/${datafeedId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "country": country, "language": language};
        path = path + check getPathForQueryParam(queryParam);
        DatafeedStatus response = check self.clientEp-> get(path, targetType = DatafeedStatus);
        return response;
    }
    # Updates price and availability of a product in your Merchant Center account.
    #
    # + merchantId - The ID of the account that contains the product. This account cannot be a multi-client account. 
    # + storeCode - The code of the store for which to update price and availability. Use `online` to update price and availability of an online product. 
    # + productId - The REST ID of the product for which to update price and availability. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentInventorySet(string merchantId, string storeCode, string productId, InventorySetRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns InventorySetResponse|error {
        string  path = string `/${merchantId}/inventory/${storeCode}/products/${productId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InventorySetResponse response = check self.clientEp->post(path, request, targetType=InventorySetResponse);
        return response;
    }
    # Lists the LIA settings of the sub-accounts in your Merchant Center account.
    #
    # + merchantId - The ID of the managing account. This must be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + maxResults - The maximum number of LIA settings to return in the response, used for paging. 
    # + pageToken - The token returned by the previous request. 
    # + return - Successful response 
    remote isolated function contentLiasettingsList(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxResults = (), string? pageToken = ()) returns LiasettingsListResponse|error {
        string  path = string `/${merchantId}/liasettings`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        LiasettingsListResponse response = check self.clientEp-> get(path, targetType = LiasettingsListResponse);
        return response;
    }
    # Retrieves the LIA settings of the account.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account for which to get or update LIA settings. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentLiasettingsGet(string merchantId, string accountId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns LiaSettings|error {
        string  path = string `/${merchantId}/liasettings/${accountId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        LiaSettings response = check self.clientEp-> get(path, targetType = LiaSettings);
        return response;
    }
    # Updates the LIA settings of the account. Any fields that are not provided are deleted from the resource.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account for which to get or update LIA settings. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentLiasettingsUpdate(string merchantId, string accountId, LiaSettings payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns LiaSettings|error {
        string  path = string `/${merchantId}/liasettings/${accountId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LiaSettings response = check self.clientEp->put(path, request, targetType=LiaSettings);
        return response;
    }
    # Retrieves the list of accessible Google My Business accounts.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account for which to retrieve accessible Google My Business accounts. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentLiasettingsGetaccessiblegmbaccounts(string merchantId, string accountId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns LiasettingsGetAccessibleGmbAccountsResponse|error {
        string  path = string `/${merchantId}/liasettings/${accountId}/accessiblegmbaccounts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        LiasettingsGetAccessibleGmbAccountsResponse response = check self.clientEp-> get(path, targetType = LiasettingsGetAccessibleGmbAccountsResponse);
        return response;
    }
    # Requests access to a specified Google My Business account.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account for which GMB access is requested. 
    # + gmbEmail - The email of the Google My Business account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentLiasettingsRequestgmbaccess(string merchantId, string accountId, string gmbEmail, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns LiasettingsRequestGmbAccessResponse|error {
        string  path = string `/${merchantId}/liasettings/${accountId}/requestgmbaccess`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "gmbEmail": gmbEmail};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        LiasettingsRequestGmbAccessResponse response = check self.clientEp-> post(path, request, targetType = LiasettingsRequestGmbAccessResponse);
        return response;
    }
    # Requests inventory validation for the specified country.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + country - The country for which inventory validation is requested. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentLiasettingsRequestinventoryverification(string merchantId, string accountId, string country, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns LiasettingsRequestInventoryVerificationResponse|error {
        string  path = string `/${merchantId}/liasettings/${accountId}/requestinventoryverification/${country}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        LiasettingsRequestInventoryVerificationResponse response = check self.clientEp-> post(path, request, targetType = LiasettingsRequestInventoryVerificationResponse);
        return response;
    }
    # Sets the inventory verification contract for the specified country.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + country - The country for which inventory verification is requested. 
    # + language - The language for which inventory verification is requested. 
    # + contactName - The name of the inventory verification contact. 
    # + contactEmail - The email of the inventory verification contact. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentLiasettingsSetinventoryverificationcontact(string merchantId, string accountId, string country, string language, string contactName, string contactEmail, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns LiasettingsSetInventoryVerificationContactResponse|error {
        string  path = string `/${merchantId}/liasettings/${accountId}/setinventoryverificationcontact`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "country": country, "language": language, "contactName": contactName, "contactEmail": contactEmail};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        LiasettingsSetInventoryVerificationContactResponse response = check self.clientEp-> post(path, request, targetType = LiasettingsSetInventoryVerificationContactResponse);
        return response;
    }
    # Sets the POS data provider for the specified country.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account for which to retrieve accessible Google My Business accounts. 
    # + country - The country for which the POS data provider is selected. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + posDataProviderId - The ID of POS data provider. 
    # + posExternalAccountId - The account ID by which this merchant is known to the POS data provider. 
    # + return - Successful response 
    remote isolated function contentLiasettingsSetposdataprovider(string merchantId, string accountId, string country, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? posDataProviderId = (), string? posExternalAccountId = ()) returns LiasettingsSetPosDataProviderResponse|error {
        string  path = string `/${merchantId}/liasettings/${accountId}/setposdataprovider`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "country": country, "posDataProviderId": posDataProviderId, "posExternalAccountId": posExternalAccountId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        LiasettingsSetPosDataProviderResponse response = check self.clientEp-> post(path, request, targetType = LiasettingsSetPosDataProviderResponse);
        return response;
    }
    # Creates a charge invoice for a shipment group, and triggers a charge capture for orderinvoice enabled orders.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrderinvoicesCreatechargeinvoice(string merchantId, string orderId, OrderinvoicesCreateChargeInvoiceRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrderinvoicesCreateChargeInvoiceResponse|error {
        string  path = string `/${merchantId}/orderinvoices/${orderId}/createChargeInvoice`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrderinvoicesCreateChargeInvoiceResponse response = check self.clientEp->post(path, request, targetType=OrderinvoicesCreateChargeInvoiceResponse);
        return response;
    }
    # Creates a refund invoice for one or more shipment groups, and triggers a refund for orderinvoice enabled orders. This can only be used for line items that have previously been charged using `createChargeInvoice`. All amounts (except for the summary) are incremental with respect to the previous invoice.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrderinvoicesCreaterefundinvoice(string merchantId, string orderId, OrderinvoicesCreateRefundInvoiceRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrderinvoicesCreateRefundInvoiceResponse|error {
        string  path = string `/${merchantId}/orderinvoices/${orderId}/createRefundInvoice`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrderinvoicesCreateRefundInvoiceResponse response = check self.clientEp->post(path, request, targetType=OrderinvoicesCreateRefundInvoiceResponse);
        return response;
    }
    # Retrieves a report for disbursements from your Merchant Center account.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + disbursementEndDate - The last date which disbursements occurred. In ISO 8601 format. Default: current date. 
    # + disbursementStartDate - The first date which disbursements occurred. In ISO 8601 format. 
    # + maxResults - The maximum number of disbursements to return in the response, used for paging. 
    # + pageToken - The token returned by the previous request. 
    # + return - Successful response 
    remote isolated function contentOrderreportsListdisbursements(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? disbursementEndDate = (), string? disbursementStartDate = (), int? maxResults = (), string? pageToken = ()) returns OrderreportsListDisbursementsResponse|error {
        string  path = string `/${merchantId}/orderreports/disbursements`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "disbursementEndDate": disbursementEndDate, "disbursementStartDate": disbursementStartDate, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        OrderreportsListDisbursementsResponse response = check self.clientEp-> get(path, targetType = OrderreportsListDisbursementsResponse);
        return response;
    }
    # Retrieves a list of transactions for a disbursement from your Merchant Center account.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + disbursementId - The Google-provided ID of the disbursement (found in Wallet). 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + maxResults - The maximum number of disbursements to return in the response, used for paging. 
    # + pageToken - The token returned by the previous request. 
    # + transactionEndDate - The last date in which transaction occurred. In ISO 8601 format. Default: current date. 
    # + transactionStartDate - The first date in which transaction occurred. In ISO 8601 format. 
    # + return - Successful response 
    remote isolated function contentOrderreportsListtransactions(string merchantId, string disbursementId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxResults = (), string? pageToken = (), string? transactionEndDate = (), string? transactionStartDate = ()) returns OrderreportsListTransactionsResponse|error {
        string  path = string `/${merchantId}/orderreports/disbursements/${disbursementId}/transactions`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "maxResults": maxResults, "pageToken": pageToken, "transactionEndDate": transactionEndDate, "transactionStartDate": transactionStartDate};
        path = path + check getPathForQueryParam(queryParam);
        OrderreportsListTransactionsResponse response = check self.clientEp-> get(path, targetType = OrderreportsListTransactionsResponse);
        return response;
    }
    # Lists order returns in your Merchant Center account.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + createdEndDate - Obtains order returns created before this date (inclusively), in ISO 8601 format. 
    # + createdStartDate - Obtains order returns created after this date (inclusively), in ISO 8601 format. 
    # + maxResults - The maximum number of order returns to return in the response, used for paging. The default value is 25 returns per page, and the maximum allowed value is 250 returns per page. 
    # + orderBy - Return the results in the specified order. 
    # + pageToken - The token returned by the previous request. 
    # + return - Successful response 
    remote isolated function contentOrderreturnsList(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? createdEndDate = (), string? createdStartDate = (), int? maxResults = (), string? orderBy = (), string? pageToken = ()) returns OrderreturnsListResponse|error {
        string  path = string `/${merchantId}/orderreturns`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "createdEndDate": createdEndDate, "createdStartDate": createdStartDate, "maxResults": maxResults, "orderBy": orderBy, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        OrderreturnsListResponse response = check self.clientEp-> get(path, targetType = OrderreturnsListResponse);
        return response;
    }
    # Retrieves an order return from your Merchant Center account.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + returnId - Merchant order return ID generated by Google. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrderreturnsGet(string merchantId, string returnId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns MerchantOrderReturn|error {
        string  path = string `/${merchantId}/orderreturns/${returnId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        MerchantOrderReturn response = check self.clientEp-> get(path, targetType = MerchantOrderReturn);
        return response;
    }
    # Lists the orders in your Merchant Center account.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + acknowledged - Obtains orders that match the acknowledgement status. When set to true, obtains orders that have been acknowledged. When false, obtains orders that have not been acknowledged. We recommend using this filter set to `false`, in conjunction with the `acknowledge` call, such that only un-acknowledged orders are returned.  
    # + maxResults - The maximum number of orders to return in the response, used for paging. The default value is 25 orders per page, and the maximum allowed value is 250 orders per page. 
    # + orderBy - Order results by placement date in descending or ascending order. Acceptable values are: - placedDateAsc - placedDateDesc  
    # + pageToken - The token returned by the previous request. 
    # + placedDateEnd - Obtains orders placed before this date (exclusively), in ISO 8601 format. 
    # + placedDateStart - Obtains orders placed after this date (inclusively), in ISO 8601 format. 
    # + statuses - Obtains orders that match any of the specified statuses. Please note that `active` is a shortcut for `pendingShipment` and `partiallyShipped`, and `completed` is a shortcut for `shipped`, `partiallyDelivered`, `delivered`, `partiallyReturned`, `returned`, and `canceled`. 
    # + return - Successful response 
    remote isolated function contentOrdersList(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? acknowledged = (), int? maxResults = (), string? orderBy = (), string? pageToken = (), string? placedDateEnd = (), string? placedDateStart = (), string[]? statuses = ()) returns OrdersListResponse|error {
        string  path = string `/${merchantId}/orders`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "acknowledged": acknowledged, "maxResults": maxResults, "orderBy": orderBy, "pageToken": pageToken, "placedDateEnd": placedDateEnd, "placedDateStart": placedDateStart, "statuses": statuses};
        path = path + check getPathForQueryParam(queryParam);
        OrdersListResponse response = check self.clientEp-> get(path, targetType = OrdersListResponse);
        return response;
    }
    # Retrieves an order from your Merchant Center account.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersGet(string merchantId, string orderId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Order|error {
        string  path = string `/${merchantId}/orders/${orderId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        Order response = check self.clientEp-> get(path, targetType = Order);
        return response;
    }
    # Marks an order as acknowledged.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersAcknowledge(string merchantId, string orderId, OrdersAcknowledgeRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersAcknowledgeResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/acknowledge`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersAcknowledgeResponse response = check self.clientEp->post(path, request, targetType=OrdersAcknowledgeResponse);
        return response;
    }
    # Cancels all line items in an order, making a full refund.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order to cancel. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersCancel(string merchantId, string orderId, OrdersCancelRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersCancelResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/cancel`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersCancelResponse response = check self.clientEp->post(path, request, targetType=OrdersCancelResponse);
        return response;
    }
    # Cancels a line item, making a full refund.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersCancellineitem(string merchantId, string orderId, OrdersCancelLineItemRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersCancelLineItemResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/cancelLineItem`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersCancelLineItemResponse response = check self.clientEp->post(path, request, targetType=OrdersCancelLineItemResponse);
        return response;
    }
    # Deprecated. Notifies that item return and refund was handled directly by merchant outside of Google payments processing (e.g. cash refund done in store). Note: We recommend calling the returnrefundlineitem method to refund in-store returns. We will issue the refund directly to the customer. This helps to prevent possible differences arising between merchant and Google transaction records. We also recommend having the point of sale system communicate with Google to ensure that customers do not receive a double refund by first refunding via Google then via an in-store return.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersInstorerefundlineitem(string merchantId, string orderId, OrdersInStoreRefundLineItemRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersInStoreRefundLineItemResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/inStoreRefundLineItem`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersInStoreRefundLineItemResponse response = check self.clientEp->post(path, request, targetType=OrdersInStoreRefundLineItemResponse);
        return response;
    }
    # Deprecated, please use returnRefundLineItem instead.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order to refund. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersRefund(string merchantId, string orderId, OrdersRefundRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersRefundResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/refund`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersRefundResponse response = check self.clientEp->post(path, request, targetType=OrdersRefundResponse);
        return response;
    }
    # Rejects return on an line item.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersRejectreturnlineitem(string merchantId, string orderId, OrdersRejectReturnLineItemRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersRejectReturnLineItemResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/rejectReturnLineItem`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersRejectReturnLineItemResponse response = check self.clientEp->post(path, request, targetType=OrdersRejectReturnLineItemResponse);
        return response;
    }
    # Returns a line item.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersReturnlineitem(string merchantId, string orderId, OrdersReturnLineItemRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersReturnLineItemResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/returnLineItem`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersReturnLineItemResponse response = check self.clientEp->post(path, request, targetType=OrdersReturnLineItemResponse);
        return response;
    }
    # Returns and refunds a line item. Note that this method can only be called on fully shipped orders. Please also note that the Orderreturns API is the preferred way to handle returns after you receive a return from a customer. You can use Orderreturns.list or Orderreturns.get to search for the return, and then use Orderreturns.processreturn to issue the refund. If the return cannot be found, then we recommend using this API to issue a refund.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersReturnrefundlineitem(string merchantId, string orderId, OrdersReturnRefundLineItemRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersReturnRefundLineItemResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/returnRefundLineItem`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersReturnRefundLineItemResponse response = check self.clientEp->post(path, request, targetType=OrdersReturnRefundLineItemResponse);
        return response;
    }
    # Sets (or overrides if it already exists) merchant provided annotations in the form of key-value pairs. A common use case would be to supply us with additional structured information about a line item that cannot be provided via other methods. Submitted key-value pairs can be retrieved as part of the orders resource.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersSetlineitemmetadata(string merchantId, string orderId, OrdersSetLineItemMetadataRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersSetLineItemMetadataResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/setLineItemMetadata`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersSetLineItemMetadataResponse response = check self.clientEp->post(path, request, targetType=OrdersSetLineItemMetadataResponse);
        return response;
    }
    # Marks line item(s) as shipped.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersShiplineitems(string merchantId, string orderId, OrdersShipLineItemsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersShipLineItemsResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/shipLineItems`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersShipLineItemsResponse response = check self.clientEp->post(path, request, targetType=OrdersShipLineItemsResponse);
        return response;
    }
    # Sandbox only. Creates a test return.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersCreatetestreturn(string merchantId, string orderId, OrdersCreateTestReturnRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersCreateTestReturnResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/testreturn`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersCreateTestReturnResponse response = check self.clientEp->post(path, request, targetType=OrdersCreateTestReturnResponse);
        return response;
    }
    # Updates ship by and delivery by dates for a line item.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersUpdatelineitemshippingdetails(string merchantId, string orderId, OrdersUpdateLineItemShippingDetailsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersUpdateLineItemShippingDetailsResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/updateLineItemShippingDetails`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersUpdateLineItemShippingDetailsResponse response = check self.clientEp->post(path, request, targetType=OrdersUpdateLineItemShippingDetailsResponse);
        return response;
    }
    # Updates the merchant order ID for a given order.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersUpdatemerchantorderid(string merchantId, string orderId, OrdersUpdateMerchantOrderIdRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersUpdateMerchantOrderIdResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/updateMerchantOrderId`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersUpdateMerchantOrderIdResponse response = check self.clientEp->post(path, request, targetType=OrdersUpdateMerchantOrderIdResponse);
        return response;
    }
    # Updates a shipment's status, carrier, and/or tracking ID.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the order. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersUpdateshipment(string merchantId, string orderId, OrdersUpdateShipmentRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersUpdateShipmentResponse|error {
        string  path = string `/${merchantId}/orders/${orderId}/updateShipment`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersUpdateShipmentResponse response = check self.clientEp->post(path, request, targetType=OrdersUpdateShipmentResponse);
        return response;
    }
    # Retrieves an order using merchant order ID.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + merchantOrderId - The merchant order ID to be looked for. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersGetbymerchantorderid(string merchantId, string merchantOrderId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersGetByMerchantOrderIdResponse|error {
        string  path = string `/${merchantId}/ordersbymerchantid/${merchantOrderId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        OrdersGetByMerchantOrderIdResponse response = check self.clientEp-> get(path, targetType = OrdersGetByMerchantOrderIdResponse);
        return response;
    }
    # Submit inventory for the given merchant.
    #
    # + merchantId - The ID of the POS or inventory data provider. 
    # + targetMerchantId - The ID of the target merchant. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentPosInventory(string merchantId, string targetMerchantId, PosInventoryRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns PosInventoryResponse|error {
        string  path = string `/${merchantId}/pos/${targetMerchantId}/inventory`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PosInventoryResponse response = check self.clientEp->post(path, request, targetType=PosInventoryResponse);
        return response;
    }
    # Submit a sale event for the given merchant.
    #
    # + merchantId - The ID of the POS or inventory data provider. 
    # + targetMerchantId - The ID of the target merchant. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentPosSale(string merchantId, string targetMerchantId, PosSaleRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns PosSaleResponse|error {
        string  path = string `/${merchantId}/pos/${targetMerchantId}/sale`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PosSaleResponse response = check self.clientEp->post(path, request, targetType=PosSaleResponse);
        return response;
    }
    # Lists the stores of the target merchant.
    #
    # + merchantId - The ID of the POS or inventory data provider. 
    # + targetMerchantId - The ID of the target merchant. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentPosList(string merchantId, string targetMerchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns PosListResponse|error {
        string  path = string `/${merchantId}/pos/${targetMerchantId}/store`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        PosListResponse response = check self.clientEp-> get(path, targetType = PosListResponse);
        return response;
    }
    # Creates a store for the given merchant.
    #
    # + merchantId - The ID of the POS or inventory data provider. 
    # + targetMerchantId - The ID of the target merchant. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentPosInsert(string merchantId, string targetMerchantId, PosStore payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns PosStore|error {
        string  path = string `/${merchantId}/pos/${targetMerchantId}/store`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PosStore response = check self.clientEp->post(path, request, targetType=PosStore);
        return response;
    }
    # Retrieves information about the given store.
    #
    # + merchantId - The ID of the POS or inventory data provider. 
    # + targetMerchantId - The ID of the target merchant. 
    # + storeCode - A store code that is unique per merchant. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentPosGet(string merchantId, string targetMerchantId, string storeCode, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns PosStore|error {
        string  path = string `/${merchantId}/pos/${targetMerchantId}/store/${storeCode}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        PosStore response = check self.clientEp-> get(path, targetType = PosStore);
        return response;
    }
    # Deletes a store for the given merchant.
    #
    # + merchantId - The ID of the POS or inventory data provider. 
    # + targetMerchantId - The ID of the target merchant. 
    # + storeCode - A store code that is unique per merchant. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentPosDelete(string merchantId, string targetMerchantId, string storeCode, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns http:Response|error {
        string  path = string `/${merchantId}/pos/${targetMerchantId}/store/${storeCode}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Lists the products in your Merchant Center account. The response might contain fewer items than specified by maxResults. Rely on nextPageToken to determine if there are more items to be requested.
    #
    # + merchantId - The ID of the account that contains the products. This account cannot be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + includeInvalidInsertedItems - Flag to include the invalid inserted items in the result of the list request. By default the invalid items are not shown (the default value is false). 
    # + maxResults - The maximum number of products to return in the response, used for paging. 
    # + pageToken - The token returned by the previous request. 
    # + return - Successful response 
    remote isolated function contentProductsList(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? includeInvalidInsertedItems = (), int? maxResults = (), string? pageToken = ()) returns ProductsListResponse|error {
        string  path = string `/${merchantId}/products`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "includeInvalidInsertedItems": includeInvalidInsertedItems, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ProductsListResponse response = check self.clientEp-> get(path, targetType = ProductsListResponse);
        return response;
    }
    # Uploads a product to your Merchant Center account. If an item with the same channel, contentLanguage, offerId, and targetCountry already exists, this method updates that entry.
    #
    # + merchantId - The ID of the account that contains the product. This account cannot be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentProductsInsert(string merchantId, Product payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns Product|error {
        string  path = string `/${merchantId}/products`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Product response = check self.clientEp->post(path, request, targetType=Product);
        return response;
    }
    # Retrieves a product from your Merchant Center account.
    #
    # + merchantId - The ID of the account that contains the product. This account cannot be a multi-client account. 
    # + productId - The REST ID of the product. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentProductsGet(string merchantId, string productId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Product|error {
        string  path = string `/${merchantId}/products/${productId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        Product response = check self.clientEp-> get(path, targetType = Product);
        return response;
    }
    # Deletes a product from your Merchant Center account.
    #
    # + merchantId - The ID of the account that contains the product. This account cannot be a multi-client account. 
    # + productId - The REST ID of the product. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentProductsDelete(string merchantId, string productId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns http:Response|error {
        string  path = string `/${merchantId}/products/${productId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Lists the statuses of the products in your Merchant Center account.
    #
    # + merchantId - The ID of the account that contains the products. This account cannot be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + destinations - If set, only issues for the specified destinations are returned, otherwise only issues for the Shopping destination. 
    # + includeAttributes - Flag to include full product data in the results of the list request. The default value is false. 
    # + includeInvalidInsertedItems - Flag to include the invalid inserted items in the result of the list request. By default the invalid items are not shown (the default value is false). 
    # + maxResults - The maximum number of product statuses to return in the response, used for paging. 
    # + pageToken - The token returned by the previous request. 
    # + return - Successful response 
    remote isolated function contentProductstatusesList(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? destinations = (), boolean? includeAttributes = (), boolean? includeInvalidInsertedItems = (), int? maxResults = (), string? pageToken = ()) returns ProductstatusesListResponse|error {
        string  path = string `/${merchantId}/productstatuses`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "destinations": destinations, "includeAttributes": includeAttributes, "includeInvalidInsertedItems": includeInvalidInsertedItems, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ProductstatusesListResponse response = check self.clientEp-> get(path, targetType = ProductstatusesListResponse);
        return response;
    }
    # Gets the status of a product from your Merchant Center account.
    #
    # + merchantId - The ID of the account that contains the product. This account cannot be a multi-client account. 
    # + productId - The REST ID of the product. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + destinations - If set, only issues for the specified destinations are returned, otherwise only issues for the Shopping destination. 
    # + includeAttributes - Flag to include full product data in the result of this get request. The default value is false. 
    # + return - Successful response 
    remote isolated function contentProductstatusesGet(string merchantId, string productId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? destinations = (), boolean? includeAttributes = ()) returns ProductStatus|error {
        string  path = string `/${merchantId}/productstatuses/${productId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "destinations": destinations, "includeAttributes": includeAttributes};
        path = path + check getPathForQueryParam(queryParam);
        ProductStatus response = check self.clientEp-> get(path, targetType = ProductStatus);
        return response;
    }
    # Lists the shipping settings of the sub-accounts in your Merchant Center account.
    #
    # + merchantId - The ID of the managing account. This must be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + maxResults - The maximum number of shipping settings to return in the response, used for paging. 
    # + pageToken - The token returned by the previous request. 
    # + return - Successful response 
    remote isolated function contentShippingsettingsList(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxResults = (), string? pageToken = ()) returns ShippingsettingsListResponse|error {
        string  path = string `/${merchantId}/shippingsettings`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "maxResults": maxResults, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ShippingsettingsListResponse response = check self.clientEp-> get(path, targetType = ShippingsettingsListResponse);
        return response;
    }
    # Retrieves the shipping settings of the account.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account for which to get/update shipping settings. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentShippingsettingsGet(string merchantId, string accountId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ShippingSettings|error {
        string  path = string `/${merchantId}/shippingsettings/${accountId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        ShippingSettings response = check self.clientEp-> get(path, targetType = ShippingSettings);
        return response;
    }
    # Updates the shipping settings of the account. Any fields that are not provided are deleted from the resource.
    #
    # + merchantId - The ID of the managing account. If this parameter is not the same as accountId, then this account must be a multi-client account and `accountId` must be the ID of a sub-account of this account. 
    # + accountId - The ID of the account for which to get/update shipping settings. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + dryRun - Flag to simulate a request like in a live environment. If set to true, dry-run mode checks the validity of the request and returns errors (if any). 
    # + return - Successful response 
    remote isolated function contentShippingsettingsUpdate(string merchantId, string accountId, ShippingSettings payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? dryRun = ()) returns ShippingSettings|error {
        string  path = string `/${merchantId}/shippingsettings/${accountId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dryRun": dryRun};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ShippingSettings response = check self.clientEp->put(path, request, targetType=ShippingSettings);
        return response;
    }
    # Retrieves supported carriers and carrier services for an account.
    #
    # + merchantId - The ID of the account for which to retrieve the supported carriers. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentShippingsettingsGetsupportedcarriers(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ShippingsettingsGetSupportedCarriersResponse|error {
        string  path = string `/${merchantId}/supportedCarriers`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        ShippingsettingsGetSupportedCarriersResponse response = check self.clientEp-> get(path, targetType = ShippingsettingsGetSupportedCarriersResponse);
        return response;
    }
    # Retrieves supported holidays for an account.
    #
    # + merchantId - The ID of the account for which to retrieve the supported holidays. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentShippingsettingsGetsupportedholidays(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ShippingsettingsGetSupportedHolidaysResponse|error {
        string  path = string `/${merchantId}/supportedHolidays`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        ShippingsettingsGetSupportedHolidaysResponse response = check self.clientEp-> get(path, targetType = ShippingsettingsGetSupportedHolidaysResponse);
        return response;
    }
    # Retrieves supported pickup services for an account.
    #
    # + merchantId - The ID of the account for which to retrieve the supported pickup services. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentShippingsettingsGetsupportedpickupservices(string merchantId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ShippingsettingsGetSupportedPickupServicesResponse|error {
        string  path = string `/${merchantId}/supportedPickupServices`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        ShippingsettingsGetSupportedPickupServicesResponse response = check self.clientEp-> get(path, targetType = ShippingsettingsGetSupportedPickupServicesResponse);
        return response;
    }
    # Sandbox only. Creates a test order.
    #
    # + merchantId - The ID of the account that should manage the order. This cannot be a multi-client account. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersCreatetestorder(string merchantId, OrdersCreateTestOrderRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersCreateTestOrderResponse|error {
        string  path = string `/${merchantId}/testorders`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersCreateTestOrderResponse response = check self.clientEp->post(path, request, targetType=OrdersCreateTestOrderResponse);
        return response;
    }
    # Sandbox only. Moves a test order from state "`inProgress`" to state "`pendingShipment`".
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the test order to modify. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersAdvancetestorder(string merchantId, string orderId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersAdvanceTestOrderResponse|error {
        string  path = string `/${merchantId}/testorders/${orderId}/advance`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        OrdersAdvanceTestOrderResponse response = check self.clientEp-> post(path, request, targetType = OrdersAdvanceTestOrderResponse);
        return response;
    }
    # Sandbox only. Cancels a test order for customer-initiated cancellation.
    #
    # + merchantId - The ID of the account that manages the order. This cannot be a multi-client account. 
    # + orderId - The ID of the test order to cancel. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + return - Successful response 
    remote isolated function contentOrdersCanceltestorderbycustomer(string merchantId, string orderId, OrdersCancelTestOrderByCustomerRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns OrdersCancelTestOrderByCustomerResponse|error {
        string  path = string `/${merchantId}/testorders/${orderId}/cancelByCustomer`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrdersCancelTestOrderByCustomerResponse response = check self.clientEp->post(path, request, targetType=OrdersCancelTestOrderByCustomerResponse);
        return response;
    }
    # Sandbox only. Retrieves an order template that can be used to quickly create a new order in sandbox.
    #
    # + merchantId - The ID of the account that should manage the order. This cannot be a multi-client account. 
    # + templateName - The name of the template to retrieve. 
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + country - The country of the template to retrieve. Defaults to `US`. 
    # + return - Successful response 
    remote isolated function contentOrdersGettestordertemplate(string merchantId, string templateName, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? country = ()) returns OrdersGetTestOrderTemplateResponse|error {
        string  path = string `/${merchantId}/testordertemplates/${templateName}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "country": country};
        path = path + check getPathForQueryParam(queryParam);
        OrdersGetTestOrderTemplateResponse response = check self.clientEp-> get(path, targetType = OrdersGetTestOrderTemplateResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
