# openapi.api.AuthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-5-dev*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAuthSignupPost**](AuthApi.md#apiauthsignuppost) | **POST** /api/Auth/signup | 
[**apiAuthTokenPost**](AuthApi.md#apiauthtokenpost) | **POST** /api/Auth/token | 


# **apiAuthSignupPost**
> LoginResponseDto apiAuthSignupPost(apiKey, loginRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final String apiKey = apiKey_example; // String | 
final LoginRequestDto loginRequestDto = ; // LoginRequestDto | 

try {
    final response = api.apiAuthSignupPost(apiKey, loginRequestDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->apiAuthSignupPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **loginRequestDto** | [**LoginRequestDto**](LoginRequestDto.md)|  | [optional] 

### Return type

[**LoginResponseDto**](LoginResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthTokenPost**
> TokenResponseDto apiAuthTokenPost(apiKey, tokenRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final String apiKey = apiKey_example; // String | 
final TokenRequestDto tokenRequestDto = ; // TokenRequestDto | 

try {
    final response = api.apiAuthTokenPost(apiKey, tokenRequestDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->apiAuthTokenPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **tokenRequestDto** | [**TokenRequestDto**](TokenRequestDto.md)|  | [optional] 

### Return type

[**TokenResponseDto**](TokenResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

