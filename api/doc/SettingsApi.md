# openapi.api.SettingsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/v0-2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**awbGet**](SettingsApi.md#awbget) | **GET** /awb | 
[**configurationsPost**](SettingsApi.md#configurationspost) | **POST** /configurations | 
[**entryPost**](SettingsApi.md#entrypost) | **POST** /entry | 


# **awbGet**
> AppSettingsApiResponsePublicModel awbGet(refNumber, xApiKey, acceptLanguage, xRequestKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSettingsApi();
final String refNumber = refNumber_example; // String | 
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 

try {
    final response = api.awbGet(refNumber, xApiKey, acceptLanguage, xRequestKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SettingsApi->awbGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refNumber** | **String**|  | 
 **xApiKey** | **String**|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 

### Return type

[**AppSettingsApiResponsePublicModel**](AppSettingsApiResponsePublicModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **configurationsPost**
> AppSettingsApiResponsePublicModel configurationsPost(xApiKey, acceptLanguage, xRequestKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSettingsApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 

try {
    final response = api.configurationsPost(xApiKey, acceptLanguage, xRequestKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SettingsApi->configurationsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 

### Return type

[**AppSettingsApiResponsePublicModel**](AppSettingsApiResponsePublicModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **entryPost**
> ObjectApiResponseModel entryPost(xApiKey, acceptLanguage, xRequestKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSettingsApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 

try {
    final response = api.entryPost(xApiKey, acceptLanguage, xRequestKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SettingsApi->entryPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 

### Return type

[**ObjectApiResponseModel**](ObjectApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

