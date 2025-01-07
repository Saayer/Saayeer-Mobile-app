# openapi.api.LogisticsAdminDashboardApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-37/app*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiLogisticsAdminDashboardPaidPerDayPost**](LogisticsAdminDashboardApi.md#apilogisticsadmindashboardpaidperdaypost) | **POST** /api/LogisticsAdminDashboard/paid-perDay | 
[**apiLogisticsAdminDashboardShipmentsPerDayPost**](LogisticsAdminDashboardApi.md#apilogisticsadmindashboardshipmentsperdaypost) | **POST** /api/LogisticsAdminDashboard/shipments-perDay | 
[**apiLogisticsAdminDashboardShipmentsPerStatusPost**](LogisticsAdminDashboardApi.md#apilogisticsadmindashboardshipmentsperstatuspost) | **POST** /api/LogisticsAdminDashboard/shipments-perStatus | 
[**apiLogisticsAdminDashboardShipmentsPost**](LogisticsAdminDashboardApi.md#apilogisticsadmindashboardshipmentspost) | **POST** /api/LogisticsAdminDashboard/shipments | 


# **apiLogisticsAdminDashboardPaidPerDayPost**
> AmountPerDateResponse apiLogisticsAdminDashboardPaidPerDayPost(apiKey, dateRangeDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLogisticsAdminDashboardApi();
final String apiKey = apiKey_example; // String | 
final DateRangeDto dateRangeDto = ; // DateRangeDto | 

try {
    final response = api.apiLogisticsAdminDashboardPaidPerDayPost(apiKey, dateRangeDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LogisticsAdminDashboardApi->apiLogisticsAdminDashboardPaidPerDayPost: $e\n');
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

# **apiLogisticsAdminDashboardShipmentsPerDayPost**
> CountPerDateResponse apiLogisticsAdminDashboardShipmentsPerDayPost(apiKey, dateRangeDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLogisticsAdminDashboardApi();
final String apiKey = apiKey_example; // String | 
final DateRangeDto dateRangeDto = ; // DateRangeDto | 

try {
    final response = api.apiLogisticsAdminDashboardShipmentsPerDayPost(apiKey, dateRangeDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LogisticsAdminDashboardApi->apiLogisticsAdminDashboardShipmentsPerDayPost: $e\n');
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

# **apiLogisticsAdminDashboardShipmentsPerStatusPost**
> ShipmentsCountResponseLAdmin apiLogisticsAdminDashboardShipmentsPerStatusPost(apiKey, dateRangeDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLogisticsAdminDashboardApi();
final String apiKey = apiKey_example; // String | 
final DateRangeDto dateRangeDto = ; // DateRangeDto | 

try {
    final response = api.apiLogisticsAdminDashboardShipmentsPerStatusPost(apiKey, dateRangeDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LogisticsAdminDashboardApi->apiLogisticsAdminDashboardShipmentsPerStatusPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **dateRangeDto** | [**DateRangeDto**](DateRangeDto.md)|  | [optional] 

### Return type

[**ShipmentsCountResponseLAdmin**](ShipmentsCountResponseLAdmin.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiLogisticsAdminDashboardShipmentsPost**
> BuiltList<ShipmentGetDtoExtended> apiLogisticsAdminDashboardShipmentsPost(apiKey, shipmentQueryLAdmin)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLogisticsAdminDashboardApi();
final String apiKey = apiKey_example; // String | 
final ShipmentQueryLAdmin shipmentQueryLAdmin = ; // ShipmentQueryLAdmin | 

try {
    final response = api.apiLogisticsAdminDashboardShipmentsPost(apiKey, shipmentQueryLAdmin);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LogisticsAdminDashboardApi->apiLogisticsAdminDashboardShipmentsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **shipmentQueryLAdmin** | [**ShipmentQueryLAdmin**](ShipmentQueryLAdmin.md)|  | [optional] 

### Return type

[**BuiltList&lt;ShipmentGetDtoExtended&gt;**](ShipmentGetDtoExtended.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

