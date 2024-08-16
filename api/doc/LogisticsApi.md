# openapi.api.LogisticsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-6/dev*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiLogisticsShipmentCostsGet**](LogisticsApi.md#apilogisticsshipmentcostsget) | **GET** /api/Logistics/shipment-costs | 


# **apiLogisticsShipmentCostsGet**
> BuiltList<ShipmentCost> apiLogisticsShipmentCostsGet(apiKey, shipmentAddDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getLogisticsApi();
final String apiKey = apiKey_example; // String | 
final ShipmentAddDto shipmentAddDto = ; // ShipmentAddDto | 

try {
    final response = api.apiLogisticsShipmentCostsGet(apiKey, shipmentAddDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LogisticsApi->apiLogisticsShipmentCostsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **shipmentAddDto** | [**ShipmentAddDto**](ShipmentAddDto.md)|  | [optional] 

### Return type

[**BuiltList&lt;ShipmentCost&gt;**](ShipmentCost.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

