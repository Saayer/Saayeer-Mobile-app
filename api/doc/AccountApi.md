# openapi.api.AccountApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/v0-2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authPost**](AccountApi.md#authpost) | **POST** /auth | 
[**loginPost**](AccountApi.md#loginpost) | **POST** /login | 
[**refreshTokenPost**](AccountApi.md#refreshtokenpost) | **POST** /refreshToken | 
[**revokeTokenPost**](AccountApi.md#revoketokenpost) | **POST** /revokeToken | 


# **authPost**
> AuthenticatedResponseApiResponseModel authPost(xApiKey, authenticateRequestVerify, acceptLanguage, xRequestKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAccountApi();
final String xApiKey = xApiKey_example; // String | 
final AuthenticateRequestVerify authenticateRequestVerify = ; // AuthenticateRequestVerify | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 

try {
    final response = api.authPost(xApiKey, authenticateRequestVerify, acceptLanguage, xRequestKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AccountApi->authPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **authenticateRequestVerify** | [**AuthenticateRequestVerify**](AuthenticateRequestVerify.md)|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 

### Return type

[**AuthenticatedResponseApiResponseModel**](AuthenticatedResponseApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginPost**
> AuthenticateResponseVerify loginPost(xApiKey, authenticateRequest, acceptLanguage, xRequestKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAccountApi();
final String xApiKey = xApiKey_example; // String | 
final AuthenticateRequest authenticateRequest = ; // AuthenticateRequest | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 

try {
    final response = api.loginPost(xApiKey, authenticateRequest, acceptLanguage, xRequestKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AccountApi->loginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **authenticateRequest** | [**AuthenticateRequest**](AuthenticateRequest.md)|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 

### Return type

[**AuthenticateResponseVerify**](AuthenticateResponseVerify.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshTokenPost**
> AuthenticatedResponseApiResponseModel refreshTokenPost(xApiKey, tokenApiModel, acceptLanguage, xRequestKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAccountApi();
final String xApiKey = xApiKey_example; // String | 
final TokenApiModel tokenApiModel = ; // TokenApiModel | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 

try {
    final response = api.refreshTokenPost(xApiKey, tokenApiModel, acceptLanguage, xRequestKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AccountApi->refreshTokenPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **tokenApiModel** | [**TokenApiModel**](TokenApiModel.md)|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 

### Return type

[**AuthenticatedResponseApiResponseModel**](AuthenticatedResponseApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeTokenPost**
> BooleanApiResponseModel revokeTokenPost(xApiKey, tokenApiModel, acceptLanguage, xRequestKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAccountApi();
final String xApiKey = xApiKey_example; // String | 
final TokenApiModel tokenApiModel = ; // TokenApiModel | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 

try {
    final response = api.revokeTokenPost(xApiKey, tokenApiModel, acceptLanguage, xRequestKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AccountApi->revokeTokenPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **tokenApiModel** | [**TokenApiModel**](TokenApiModel.md)|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 

### Return type

[**BooleanApiResponseModel**](BooleanApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

