# openapi.api.ExperimentalApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-6/dev*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiExperimentalAddShipmentStatusGet**](ExperimentalApi.md#apiexperimentaladdshipmentstatusget) | **GET** /api/Experimental/add-shipment-status | 
[**apiExperimentalShipmentCreatedAtGet**](ExperimentalApi.md#apiexperimentalshipmentcreatedatget) | **GET** /api/Experimental/shipment-createdAt | 


# **apiExperimentalAddShipmentStatusGet**
> String apiExperimentalAddShipmentStatusGet(apiKey, experimentalShipmentStatusAdd)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getExperimentalApi();
final String apiKey = apiKey_example; // String | 
final ExperimentalShipmentStatusAdd experimentalShipmentStatusAdd = ; // ExperimentalShipmentStatusAdd | 

try {
    final response = api.apiExperimentalAddShipmentStatusGet(apiKey, experimentalShipmentStatusAdd);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ExperimentalApi->apiExperimentalAddShipmentStatusGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **experimentalShipmentStatusAdd** | [**ExperimentalShipmentStatusAdd**](ExperimentalShipmentStatusAdd.md)|  | [optional] 

### Return type

**String**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiExperimentalShipmentCreatedAtGet**
> String apiExperimentalShipmentCreatedAtGet(apiKey, experimentalShipmentCreatedAtRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getExperimentalApi();
final String apiKey = apiKey_example; // String | 
final ExperimentalShipmentCreatedAtRequest experimentalShipmentCreatedAtRequest = ; // ExperimentalShipmentCreatedAtRequest | 

try {
    final response = api.apiExperimentalShipmentCreatedAtGet(apiKey, experimentalShipmentCreatedAtRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ExperimentalApi->apiExperimentalShipmentCreatedAtGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **experimentalShipmentCreatedAtRequest** | [**ExperimentalShipmentCreatedAtRequest**](ExperimentalShipmentCreatedAtRequest.md)|  | [optional] 

### Return type

**String**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

