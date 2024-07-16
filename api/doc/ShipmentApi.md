# openapi.api.ShipmentApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/v0-2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**shipmentCalculateCostPost**](ShipmentApi.md#shipmentcalculatecostpost) | **POST** /Shipment/CalculateCost | 
[**shipmentCreateShipmentPost**](ShipmentApi.md#shipmentcreateshipmentpost) | **POST** /Shipment/CreateShipment | 
[**shipmentGetShipmentsPost**](ShipmentApi.md#shipmentgetshipmentspost) | **POST** /Shipment/GetShipments | 


# **shipmentCalculateCostPost**
> CostResponseDtoListApiResponseModel shipmentCalculateCostPost(xApiKey, acceptLanguage, xRequestKey, packageDetails)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 
final PackageDetails packageDetails = ; // PackageDetails | 

try {
    final response = api.shipmentCalculateCostPost(xApiKey, acceptLanguage, xRequestKey, packageDetails);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentApi->shipmentCalculateCostPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 
 **packageDetails** | [**PackageDetails**](PackageDetails.md)|  | [optional] 

### Return type

[**CostResponseDtoListApiResponseModel**](CostResponseDtoListApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **shipmentCreateShipmentPost**
> ObjectApiResponseModel shipmentCreateShipmentPost(xApiKey, acceptLanguage, xRequestKey, createShipmentRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 
final CreateShipmentRequestDto createShipmentRequestDto = ; // CreateShipmentRequestDto | 

try {
    final response = api.shipmentCreateShipmentPost(xApiKey, acceptLanguage, xRequestKey, createShipmentRequestDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentApi->shipmentCreateShipmentPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xApiKey** | **String**|  | 
 **acceptLanguage** | **String**|  | [optional] 
 **xRequestKey** | **String**|  | [optional] 
 **createShipmentRequestDto** | [**CreateShipmentRequestDto**](CreateShipmentRequestDto.md)|  | [optional] 

### Return type

[**ObjectApiResponseModel**](ObjectApiResponseModel.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **shipmentGetShipmentsPost**
> ObjectApiResponseModel shipmentGetShipmentsPost(xApiKey, acceptLanguage, xRequestKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentApi();
final String xApiKey = xApiKey_example; // String | 
final String acceptLanguage = acceptLanguage_example; // String | 
final String xRequestKey = xRequestKey_example; // String | 

try {
    final response = api.shipmentGetShipmentsPost(xApiKey, acceptLanguage, xRequestKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentApi->shipmentGetShipmentsPost: $e\n');
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

