# openapi.api.CustomersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-25/app*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiCustomersGet**](CustomersApi.md#apicustomersget) | **GET** /api/Customers | 
[**apiCustomersGetCustomersByPost**](CustomersApi.md#apicustomersgetcustomersbypost) | **POST** /api/Customers/GetCustomersBy | 
[**apiCustomersIdDelete**](CustomersApi.md#apicustomersiddelete) | **DELETE** /api/Customers/{id} | 
[**apiCustomersIdGet**](CustomersApi.md#apicustomersidget) | **GET** /api/Customers/{id} | 
[**apiCustomersPost**](CustomersApi.md#apicustomerspost) | **POST** /api/Customers | 
[**apiCustomersPut**](CustomersApi.md#apicustomersput) | **PUT** /api/Customers | 


# **apiCustomersGet**
> BuiltList<CustomerGetDto> apiCustomersGet(apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCustomersApi();
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiCustomersGet(apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CustomersApi->apiCustomersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 

### Return type

[**BuiltList&lt;CustomerGetDto&gt;**](CustomerGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCustomersGetCustomersByPost**
> BuiltList<CustomerGetDto> apiCustomersGetCustomersByPost(apiKey, customerQuery)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCustomersApi();
final String apiKey = apiKey_example; // String | 
final CustomerQuery customerQuery = ; // CustomerQuery | 

try {
    final response = api.apiCustomersGetCustomersByPost(apiKey, customerQuery);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CustomersApi->apiCustomersGetCustomersByPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **customerQuery** | [**CustomerQuery**](CustomerQuery.md)|  | [optional] 

### Return type

[**BuiltList&lt;CustomerGetDto&gt;**](CustomerGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCustomersIdDelete**
> apiCustomersIdDelete(id, apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCustomersApi();
final int id = 789; // int | 
final String apiKey = apiKey_example; // String | 

try {
    api.apiCustomersIdDelete(id, apiKey);
} catch on DioException (e) {
    print('Exception when calling CustomersApi->apiCustomersIdDelete: $e\n');
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

# **apiCustomersIdGet**
> CustomerGetDto apiCustomersIdGet(id, apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCustomersApi();
final int id = 789; // int | 
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiCustomersIdGet(id, apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CustomersApi->apiCustomersIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **apiKey** | **String**|  | 

### Return type

[**CustomerGetDto**](CustomerGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCustomersPost**
> CustomerGetDto apiCustomersPost(apiKey, customerAddDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCustomersApi();
final String apiKey = apiKey_example; // String | 
final CustomerAddDto customerAddDto = ; // CustomerAddDto | 

try {
    final response = api.apiCustomersPost(apiKey, customerAddDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CustomersApi->apiCustomersPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **customerAddDto** | [**CustomerAddDto**](CustomerAddDto.md)|  | [optional] 

### Return type

[**CustomerGetDto**](CustomerGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCustomersPut**
> apiCustomersPut(apiKey, customerAddDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCustomersApi();
final String apiKey = apiKey_example; // String | 
final CustomerAddDto customerAddDto = ; // CustomerAddDto | 

try {
    api.apiCustomersPut(apiKey, customerAddDto);
} catch on DioException (e) {
    print('Exception when calling CustomersApi->apiCustomersPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **customerAddDto** | [**CustomerAddDto**](CustomerAddDto.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

