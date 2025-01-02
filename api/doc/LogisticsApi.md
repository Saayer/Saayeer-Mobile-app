# openapi.api.LogisticsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-36/app*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiLogisticsGetGainGet**](LogisticsApi.md#apilogisticsgetgainget) | **GET** /api/Logistics/get-gain | 
[**apiLogisticsServiceCostsPost**](LogisticsApi.md#apilogisticsservicecostspost) | **POST** /api/Logistics/service-costs | 
[**apiLogisticsServicesGet**](LogisticsApi.md#apilogisticsservicesget) | **GET** /api/Logistics/services | 
[**apiLogisticsUpdateGainPost**](LogisticsApi.md#apilogisticsupdategainpost) | **POST** /api/Logistics/update-gain | 
[**apiLogisticsUpdateServicePost**](LogisticsApi.md#apilogisticsupdateservicepost) | **POST** /api/Logistics/update-service | 


# **apiLogisticsGetGainGet**
> num apiLogisticsGetGainGet(apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLogisticsApi();
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiLogisticsGetGainGet(apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LogisticsApi->apiLogisticsGetGainGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 

### Return type

**num**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiLogisticsServiceCostsPost**
> BuiltList<LogisticCostDto> apiLogisticsServiceCostsPost(apiKey, shipmentCostRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLogisticsApi();
final String apiKey = apiKey_example; // String | 
final ShipmentCostRequest shipmentCostRequest = ; // ShipmentCostRequest | 

try {
    final response = api.apiLogisticsServiceCostsPost(apiKey, shipmentCostRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LogisticsApi->apiLogisticsServiceCostsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **shipmentCostRequest** | [**ShipmentCostRequest**](ShipmentCostRequest.md)|  | [optional] 

### Return type

[**BuiltList&lt;LogisticCostDto&gt;**](LogisticCostDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiLogisticsServicesGet**
> BuiltList<LogisticServiceGetDto> apiLogisticsServicesGet(apiKey)



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

[**BuiltList&lt;LogisticServiceGetDto&gt;**](LogisticServiceGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiLogisticsUpdateGainPost**
> apiLogisticsUpdateGainPost(apiKey, gainRatioPost)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLogisticsApi();
final String apiKey = apiKey_example; // String | 
final GainRatioPost gainRatioPost = ; // GainRatioPost | 

try {
    api.apiLogisticsUpdateGainPost(apiKey, gainRatioPost);
} catch on DioException (e) {
    print('Exception when calling LogisticsApi->apiLogisticsUpdateGainPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **gainRatioPost** | [**GainRatioPost**](GainRatioPost.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiLogisticsUpdateServicePost**
> apiLogisticsUpdateServicePost(apiKey, logisticServicePostDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLogisticsApi();
final String apiKey = apiKey_example; // String | 
final LogisticServicePostDto logisticServicePostDto = ; // LogisticServicePostDto | 

try {
    api.apiLogisticsUpdateServicePost(apiKey, logisticServicePostDto);
} catch on DioException (e) {
    print('Exception when calling LogisticsApi->apiLogisticsUpdateServicePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **logisticServicePostDto** | [**LogisticServicePostDto**](LogisticServicePostDto.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

