# openapi.api.StoresApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-33/app*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiStoresGet**](StoresApi.md#apistoresget) | **GET** /api/Stores | 
[**apiStoresIdDelete**](StoresApi.md#apistoresiddelete) | **DELETE** /api/Stores/{id} | 
[**apiStoresIdGet**](StoresApi.md#apistoresidget) | **GET** /api/Stores/{id} | 
[**apiStoresPost**](StoresApi.md#apistorespost) | **POST** /api/Stores | 
[**apiStoresPut**](StoresApi.md#apistoresput) | **PUT** /api/Stores | 


# **apiStoresGet**
> BuiltList<StoreGetDto> apiStoresGet(apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getStoresApi();
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiStoresGet(apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling StoresApi->apiStoresGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 

### Return type

[**BuiltList&lt;StoreGetDto&gt;**](StoreGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiStoresIdDelete**
> apiStoresIdDelete(id, apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getStoresApi();
final int id = 789; // int | 
final String apiKey = apiKey_example; // String | 

try {
    api.apiStoresIdDelete(id, apiKey);
} catch on DioException (e) {
    print('Exception when calling StoresApi->apiStoresIdDelete: $e\n');
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

# **apiStoresIdGet**
> StoreGetDto apiStoresIdGet(id, apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getStoresApi();
final int id = 789; // int | 
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiStoresIdGet(id, apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling StoresApi->apiStoresIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **apiKey** | **String**|  | 

### Return type

[**StoreGetDto**](StoreGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiStoresPost**
> StoreGetDto apiStoresPost(apiKey, storeAddDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getStoresApi();
final String apiKey = apiKey_example; // String | 
final StoreAddDto storeAddDto = ; // StoreAddDto | 

try {
    final response = api.apiStoresPost(apiKey, storeAddDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling StoresApi->apiStoresPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **storeAddDto** | [**StoreAddDto**](StoreAddDto.md)|  | [optional] 

### Return type

[**StoreGetDto**](StoreGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiStoresPut**
> apiStoresPut(apiKey, storeAddDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getStoresApi();
final String apiKey = apiKey_example; // String | 
final StoreAddDto storeAddDto = ; // StoreAddDto | 

try {
    api.apiStoresPut(apiKey, storeAddDto);
} catch on DioException (e) {
    print('Exception when calling StoresApi->apiStoresPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **storeAddDto** | [**StoreAddDto**](StoreAddDto.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

