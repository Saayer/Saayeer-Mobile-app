# openapi.api.ShipmentTracingApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-31/app*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiShipmentTracingAramexWebhookPost**](ShipmentTracingApi.md#apishipmenttracingaramexwebhookpost) | **POST** /api/ShipmentTracing/aramex-webhook | 
[**apiShipmentTracingShipmentStatusesIdGet**](ShipmentTracingApi.md#apishipmenttracingshipmentstatusesidget) | **GET** /api/ShipmentTracing/Shipment-Statuses/{id} | 


# **apiShipmentTracingAramexWebhookPost**
> String apiShipmentTracingAramexWebhookPost(apiKey, aramexWebhookRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentTracingApi();
final String apiKey = apiKey_example; // String | 
final AramexWebhookRequest aramexWebhookRequest = ; // AramexWebhookRequest | 

try {
    final response = api.apiShipmentTracingAramexWebhookPost(apiKey, aramexWebhookRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentTracingApi->apiShipmentTracingAramexWebhookPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **aramexWebhookRequest** | [**AramexWebhookRequest**](AramexWebhookRequest.md)|  | [optional] 

### Return type

**String**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiShipmentTracingShipmentStatusesIdGet**
> BuiltList<ShipmentStatusGetDto> apiShipmentTracingShipmentStatusesIdGet(id, apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentTracingApi();
final int id = 789; // int | 
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiShipmentTracingShipmentStatusesIdGet(id, apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentTracingApi->apiShipmentTracingShipmentStatusesIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **apiKey** | **String**|  | 

### Return type

[**BuiltList&lt;ShipmentStatusGetDto&gt;**](ShipmentStatusGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

