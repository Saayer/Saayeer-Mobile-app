# openapi.api.AddressLookupsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/v0-2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAddressLookupsAreasCityIdGet**](AddressLookupsApi.md#apiaddresslookupsareascityidget) | **GET** /api/AddressLookups/Areas/{cityId} | 
[**apiAddressLookupsCitiesGovernorateIdGet**](AddressLookupsApi.md#apiaddresslookupscitiesgovernorateidget) | **GET** /api/AddressLookups/Cities/{governorateId} | 
[**apiAddressLookupsCountriesGet**](AddressLookupsApi.md#apiaddresslookupscountriesget) | **GET** /api/AddressLookups/Countries | 
[**apiAddressLookupsGovernoratesCountryIdGet**](AddressLookupsApi.md#apiaddresslookupsgovernoratescountryidget) | **GET** /api/AddressLookups/Governorates/{countryId} | 


# **apiAddressLookupsAreasCityIdGet**
> BuiltList<AddressLookUpDto> apiAddressLookupsAreasCityIdGet(cityId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAddressLookupsApi();
final int cityId = 56; // int | 

try {
    final response = api.apiAddressLookupsAreasCityIdGet(cityId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AddressLookupsApi->apiAddressLookupsAreasCityIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **int**|  | 

### Return type

[**BuiltList&lt;AddressLookUpDto&gt;**](AddressLookUpDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressLookupsCitiesGovernorateIdGet**
> BuiltList<AddressLookUpDto> apiAddressLookupsCitiesGovernorateIdGet(governorateId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAddressLookupsApi();
final int governorateId = 56; // int | 

try {
    final response = api.apiAddressLookupsCitiesGovernorateIdGet(governorateId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AddressLookupsApi->apiAddressLookupsCitiesGovernorateIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **governorateId** | **int**|  | 

### Return type

[**BuiltList&lt;AddressLookUpDto&gt;**](AddressLookUpDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressLookupsCountriesGet**
> BuiltList<AddressLookUpDto> apiAddressLookupsCountriesGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAddressLookupsApi();

try {
    final response = api.apiAddressLookupsCountriesGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AddressLookupsApi->apiAddressLookupsCountriesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AddressLookUpDto&gt;**](AddressLookUpDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressLookupsGovernoratesCountryIdGet**
> BuiltList<AddressLookUpDto> apiAddressLookupsGovernoratesCountryIdGet(countryId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAddressLookupsApi();
final int countryId = 56; // int | 

try {
    final response = api.apiAddressLookupsGovernoratesCountryIdGet(countryId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AddressLookupsApi->apiAddressLookupsGovernoratesCountryIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countryId** | **int**|  | 

### Return type

[**BuiltList&lt;AddressLookUpDto&gt;**](AddressLookUpDto.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

