# openapi.api.AttachmentsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/v0-2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**attachmentsUploadPost**](AttachmentsApi.md#attachmentsuploadpost) | **POST** /Attachments/Upload | 


# **attachmentsUploadPost**
> ObjectApiResponseModel attachmentsUploadPost(xApiKey, acceptLanguage, xRequestKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAttachmentsApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 

try {
    final response = api.attachmentsUploadPost(xApiKey, acceptLanguage, xRequestKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AttachmentsApi->attachmentsUploadPost: $e\n');
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
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

