# openapi.api.ShipmentsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-31/app*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiShipmentsGet**](ShipmentsApi.md#apishipmentsget) | **GET** /api/Shipments | 
[**apiShipmentsGetbyPost**](ShipmentsApi.md#apishipmentsgetbypost) | **POST** /api/Shipments/getby | 
[**apiShipmentsIdDelete**](ShipmentsApi.md#apishipmentsiddelete) | **DELETE** /api/Shipments/{id} | 
[**apiShipmentsIdGet**](ShipmentsApi.md#apishipmentsidget) | **GET** /api/Shipments/{id} | 
[**apiShipmentsPost**](ShipmentsApi.md#apishipmentspost) | **POST** /api/Shipments | 


# **apiShipmentsGet**
> BuiltList<ShipmentGetDto> apiShipmentsGet(apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentsApi();
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiShipmentsGet(apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentsApi->apiShipmentsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 

### Return type

[**BuiltList&lt;ShipmentGetDto&gt;**](ShipmentGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiShipmentsGetbyPost**
> BuiltList<ShipmentGetDto> apiShipmentsGetbyPost(apiKey, shipmentQuery)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentsApi();
final String apiKey = apiKey_example; // String | 
final ShipmentQuery shipmentQuery = ; // ShipmentQuery | 

try {
    final response = api.apiShipmentsGetbyPost(apiKey, shipmentQuery);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentsApi->apiShipmentsGetbyPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **shipmentQuery** | [**ShipmentQuery**](ShipmentQuery.md)|  | [optional] 

### Return type

[**BuiltList&lt;ShipmentGetDto&gt;**](ShipmentGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiShipmentsIdDelete**
> apiShipmentsIdDelete(id, apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentsApi();
final int id = 789; // int | 
final String apiKey = apiKey_example; // String | 

try {
    api.apiShipmentsIdDelete(id, apiKey);
} catch on DioException (e) {
    print('Exception when calling ShipmentsApi->apiShipmentsIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **apiKey** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiShipmentsIdGet**
> ShipmentGetDto apiShipmentsIdGet(id, apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentsApi();
final int id = 789; // int | 
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiShipmentsIdGet(id, apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentsApi->apiShipmentsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **apiKey** | **String**|  | 

### Return type

[**ShipmentGetDto**](ShipmentGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiShipmentsPost**
> ShipmentGetDto apiShipmentsPost(apiKey, shipmentAddDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentsApi();
final String apiKey = apiKey_example; // String | 
final ShipmentAddDto shipmentAddDto = ; // ShipmentAddDto | 

try {
    final response = api.apiShipmentsPost(apiKey, shipmentAddDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentsApi->apiShipmentsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **shipmentAddDto** | [**ShipmentAddDto**](ShipmentAddDto.md)|  | [optional] 

### Return type

[**ShipmentGetDto**](ShipmentGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

