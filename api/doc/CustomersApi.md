# openapi.api.CustomersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/v0-2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiCustomersGet**](CustomersApi.md#apicustomersget) | **GET** /api/Customers | 
[**apiCustomersGetCustomersByPost**](CustomersApi.md#apicustomersgetcustomersbypost) | **POST** /api/Customers/GetCustomersBy | 
[**apiCustomersIdDelete**](CustomersApi.md#apicustomersiddelete) | **DELETE** /api/Customers/{id} | 
[**apiCustomersIdGet**](CustomersApi.md#apicustomersidget) | **GET** /api/Customers/{id} | 
[**apiCustomersPost**](CustomersApi.md#apicustomerspost) | **POST** /api/Customers | 
[**apiCustomersPut**](CustomersApi.md#apicustomersput) | **PUT** /api/Customers | 


# **apiCustomersGet**
> BuiltList<CustomerGetDto> apiCustomersGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCustomersApi();

try {
    final response = api.apiCustomersGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CustomersApi->apiCustomersGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;CustomerGetDto&gt;**](CustomerGetDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCustomersGetCustomersByPost**
> BuiltList<CustomerGetDto> apiCustomersGetCustomersByPost(customerQuery)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCustomersApi();
final CustomerQuery customerQuery = ; // CustomerQuery | 

try {
    final response = api.apiCustomersGetCustomersByPost(customerQuery);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CustomersApi->apiCustomersGetCustomersByPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customerQuery** | [**CustomerQuery**](CustomerQuery.md)|  | [optional] 

### Return type

[**BuiltList&lt;CustomerGetDto&gt;**](CustomerGetDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCustomersIdDelete**
> apiCustomersIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCustomersApi();
final int id = 789; // int | 

try {
    api.apiCustomersIdDelete(id);
} catch on DioException (e) {
    print('Exception when calling CustomersApi->apiCustomersIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCustomersIdGet**
> CustomerGetDto apiCustomersIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCustomersApi();
final int id = 789; // int | 

try {
    final response = api.apiCustomersIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CustomersApi->apiCustomersIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**CustomerGetDto**](CustomerGetDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCustomersPost**
> CustomerGetDto apiCustomersPost(customerAddDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCustomersApi();
final CustomerAddDto customerAddDto = ; // CustomerAddDto | 

try {
    final response = api.apiCustomersPost(customerAddDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CustomersApi->apiCustomersPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customerAddDto** | [**CustomerAddDto**](CustomerAddDto.md)|  | [optional] 

### Return type

[**CustomerGetDto**](CustomerGetDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCustomersPut**
> apiCustomersPut(customerAddDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCustomersApi();
final CustomerAddDto customerAddDto = ; // CustomerAddDto | 

try {
    api.apiCustomersPut(customerAddDto);
} catch on DioException (e) {
    print('Exception when calling CustomersApi->apiCustomersPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customerAddDto** | [**CustomerAddDto**](CustomerAddDto.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

