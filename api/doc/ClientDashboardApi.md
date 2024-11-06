# openapi.api.ClientDashboardApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-25/app*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiClientDashboardPaidPerDayPost**](ClientDashboardApi.md#apiclientdashboardpaidperdaypost) | **POST** /api/ClientDashboard/paid-perDay | 
[**apiClientDashboardShipmentsPerDayPost**](ClientDashboardApi.md#apiclientdashboardshipmentsperdaypost) | **POST** /api/ClientDashboard/shipments-perDay | 
[**apiClientDashboardShipmentsPerStatusPost**](ClientDashboardApi.md#apiclientdashboardshipmentsperstatuspost) | **POST** /api/ClientDashboard/shipments-perStatus | 


# **apiClientDashboardPaidPerDayPost**
> AmountPerDateResponse apiClientDashboardPaidPerDayPost(apiKey, dateRangeDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClientDashboardApi();
final String apiKey = apiKey_example; // String | 
final DateRangeDto dateRangeDto = ; // DateRangeDto | 

try {
    final response = api.apiClientDashboardPaidPerDayPost(apiKey, dateRangeDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClientDashboardApi->apiClientDashboardPaidPerDayPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **dateRangeDto** | [**DateRangeDto**](DateRangeDto.md)|  | [optional] 

### Return type

[**AmountPerDateResponse**](AmountPerDateResponse.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiClientDashboardShipmentsPerDayPost**
> CountPerDateResponse apiClientDashboardShipmentsPerDayPost(apiKey, dateRangeDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClientDashboardApi();
final String apiKey = apiKey_example; // String | 
final DateRangeDto dateRangeDto = ; // DateRangeDto | 

try {
    final response = api.apiClientDashboardShipmentsPerDayPost(apiKey, dateRangeDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClientDashboardApi->apiClientDashboardShipmentsPerDayPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **dateRangeDto** | [**DateRangeDto**](DateRangeDto.md)|  | [optional] 

### Return type

[**CountPerDateResponse**](CountPerDateResponse.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiClientDashboardShipmentsPerStatusPost**
> ShipmentsCountResponse apiClientDashboardShipmentsPerStatusPost(apiKey, dateRangeDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClientDashboardApi();
final String apiKey = apiKey_example; // String | 
final DateRangeDto dateRangeDto = ; // DateRangeDto | 

try {
    final response = api.apiClientDashboardShipmentsPerStatusPost(apiKey, dateRangeDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClientDashboardApi->apiClientDashboardShipmentsPerStatusPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **dateRangeDto** | [**DateRangeDto**](DateRangeDto.md)|  | [optional] 

### Return type

[**ShipmentsCountResponse**](ShipmentsCountResponse.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

