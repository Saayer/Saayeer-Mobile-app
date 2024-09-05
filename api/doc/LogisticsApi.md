# openapi.api.LogisticsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-6/dev*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiLogisticsServiceCostsPost**](LogisticsApi.md#apilogisticsservicecostspost) | **POST** /api/Logistics/service-costs | 
[**apiLogisticsServicesGet**](LogisticsApi.md#apilogisticsservicesget) | **GET** /api/Logistics/services | 


# **apiLogisticsServiceCostsPost**
> BuiltList<ServiceCost> apiLogisticsServiceCostsPost(apiKey, shipmentCostObj)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLogisticsApi();
final String apiKey = apiKey_example; // String | 
final ShipmentCostObj shipmentCostObj = ; // ShipmentCostObj | 

try {
    final response = api.apiLogisticsServiceCostsPost(apiKey, shipmentCostObj);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LogisticsApi->apiLogisticsServiceCostsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **shipmentCostObj** | [**ShipmentCostObj**](ShipmentCostObj.md)|  | [optional] 

### Return type

[**BuiltList&lt;ServiceCost&gt;**](ServiceCost.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiLogisticsServicesGet**
> BuiltList<LogisticsServiceBase> apiLogisticsServicesGet(apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLogisticsApi();
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiLogisticsServicesGet(apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LogisticsApi->apiLogisticsServicesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 

### Return type

[**BuiltList&lt;LogisticsServiceBase&gt;**](LogisticsServiceBase.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

