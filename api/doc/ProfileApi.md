# openapi.api.ProfileApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/v0-2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**profileGetProfileGet**](ProfileApi.md#profilegetprofileget) | **GET** /Profile/GetProfile | 
[**profileGetUserProfileGet**](ProfileApi.md#profilegetuserprofileget) | **GET** /Profile/GetUserProfile | 
[**profileUpdateBusinessInfoPost**](ProfileApi.md#profileupdatebusinessinfopost) | **POST** /Profile/UpdateBusinessInfo | 
[**profileUpdatePersonalInfoPost**](ProfileApi.md#profileupdatepersonalinfopost) | **POST** /Profile/UpdatePersonalInfo | 


# **profileGetProfileGet**
> UserInformationVMApiResponseModel profileGetProfileGet(xApiKey, profileTye, acceptLanguage, xRequestKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getProfileApi();
final String xApiKey = xApiKey_example; // String | 
final ProfileTye profileTye = ; // ProfileTye | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 

try {
    final response = api.profileGetProfileGet(xApiKey, profileTye, acceptLanguage, xRequestKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ProfileApi->profileGetProfileGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **profileTye** | [**ProfileTye**](.md)|  | [optional] 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 

### Return type

[**UserInformationVMApiResponseModel**](UserInformationVMApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **profileGetUserProfileGet**
> UserProfileVMApiResponseModel profileGetUserProfileGet(xApiKey, acceptLanguage, xRequestKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getProfileApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 

try {
    final response = api.profileGetUserProfileGet(xApiKey, acceptLanguage, xRequestKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ProfileApi->profileGetUserProfileGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 

### Return type

[**UserProfileVMApiResponseModel**](UserProfileVMApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **profileUpdateBusinessInfoPost**
> BooleanApiResponseModel profileUpdateBusinessInfoPost(xApiKey, acceptLanguage, xRequestKey, businessInformationRequestVM)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getProfileApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 
final BusinessInformationRequestVM businessInformationRequestVM = ; // BusinessInformationRequestVM | 

try {
    final response = api.profileUpdateBusinessInfoPost(xApiKey, acceptLanguage, xRequestKey, businessInformationRequestVM);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ProfileApi->profileUpdateBusinessInfoPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 
 **businessInformationRequestVM** | [**BusinessInformationRequestVM**](BusinessInformationRequestVM.md)|  | [optional] 

### Return type

[**BooleanApiResponseModel**](BooleanApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **profileUpdatePersonalInfoPost**
> BooleanApiResponseModel profileUpdatePersonalInfoPost(xApiKey, acceptLanguage, xRequestKey, personalInformationRequestVM)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getProfileApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 
final PersonalInformationRequestVM personalInformationRequestVM = ; // PersonalInformationRequestVM | 

try {
    final response = api.profileUpdatePersonalInfoPost(xApiKey, acceptLanguage, xRequestKey, personalInformationRequestVM);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ProfileApi->profileUpdatePersonalInfoPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 
 **personalInformationRequestVM** | [**PersonalInformationRequestVM**](PersonalInformationRequestVM.md)|  | [optional] 

### Return type

[**BooleanApiResponseModel**](BooleanApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

