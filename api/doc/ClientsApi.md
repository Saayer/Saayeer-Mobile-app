# openapi.api.ClientsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-27/app*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiClientsGet**](ClientsApi.md#apiclientsget) | **GET** /api/Clients | 
[**apiClientsPut**](ClientsApi.md#apiclientsput) | **PUT** /api/Clients | 


# **apiClientsGet**
> ClientGetDto apiClientsGet(apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClientsApi();
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiClientsGet(apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClientsApi->apiClientsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 

### Return type

[**ClientGetDto**](ClientGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiClientsPut**
> ClientGetDto apiClientsPut(apiKey, clientAddDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClientsApi();
final String apiKey = apiKey_example; // String | 
final ClientAddDto clientAddDto = ; // ClientAddDto | 

try {
    final response = api.apiClientsPut(apiKey, clientAddDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClientsApi->apiClientsPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **clientAddDto** | [**ClientAddDto**](ClientAddDto.md)|  | [optional] 

### Return type

[**ClientGetDto**](ClientGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

