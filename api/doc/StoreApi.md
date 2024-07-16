# openapi.api.StoreApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/v0-2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**storeCreateStoreInfoPost**](StoreApi.md#storecreatestoreinfopost) | **POST** /Store/CreateStoreInfo | 
[**storeUpdateStoreInfoPost**](StoreApi.md#storeupdatestoreinfopost) | **POST** /Store/UpdateStoreInfo | 


# **storeCreateStoreInfoPost**
> BooleanApiResponseModel storeCreateStoreInfoPost(xApiKey, acceptLanguage, xRequestKey, createStoreInformationVM)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getStoreApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 
final CreateStoreInformationVM createStoreInformationVM = ; // CreateStoreInformationVM | 

try {
    final response = api.storeCreateStoreInfoPost(xApiKey, acceptLanguage, xRequestKey, createStoreInformationVM);
    print(response);
} catch on DioException (e) {
    print('Exception when calling StoreApi->storeCreateStoreInfoPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 
 **createStoreInformationVM** | [**CreateStoreInformationVM**](CreateStoreInformationVM.md)|  | [optional] 

### Return type

[**BooleanApiResponseModel**](BooleanApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **storeUpdateStoreInfoPost**
> BooleanApiResponseModel storeUpdateStoreInfoPost(xApiKey, acceptLanguage, xRequestKey, storeInformationVM)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getStoreApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 
final StoreInformationVM storeInformationVM = ; // StoreInformationVM | 

try {
    final response = api.storeUpdateStoreInfoPost(xApiKey, acceptLanguage, xRequestKey, storeInformationVM);
    print(response);
} catch on DioException (e) {
    print('Exception when calling StoreApi->storeUpdateStoreInfoPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 
 **storeInformationVM** | [**StoreInformationVM**](StoreInformationVM.md)|  | [optional] 

### Return type

[**BooleanApiResponseModel**](BooleanApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

