# openapi.api.ClientApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/v0-2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clientAddClientPost**](ClientApi.md#clientaddclientpost) | **POST** /Client/AddClient | 
[**clientGetClientsGet**](ClientApi.md#clientgetclientsget) | **GET** /Client/GetClients | 


# **clientAddClientPost**
> BooleanApiResponseModel clientAddClientPost(xApiKey, acceptLanguage, xRequestKey, clientsInformationRequestVM)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClientApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 
final ClientsInformationRequestVM clientsInformationRequestVM = ; // ClientsInformationRequestVM | 

try {
    final response = api.clientAddClientPost(xApiKey, acceptLanguage, xRequestKey, clientsInformationRequestVM);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClientApi->clientAddClientPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 
 **clientsInformationRequestVM** | [**ClientsInformationRequestVM**](ClientsInformationRequestVM.md)|  | [optional] 

### Return type

[**BooleanApiResponseModel**](BooleanApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientGetClientsGet**
> ClientsInformationResponseVMListApiResponseModel clientGetClientsGet(xApiKey, acceptLanguage, xRequestKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClientApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 

try {
    final response = api.clientGetClientsGet(xApiKey, acceptLanguage, xRequestKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClientApi->clientGetClientsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 

### Return type

[**ClientsInformationResponseVMListApiResponseModel**](ClientsInformationResponseVMListApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

