# openapi.api.AddressLookupsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-26/app*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAddressLookupsAreasCityIdGet**](AddressLookupsApi.md#apiaddresslookupsareascityidget) | **GET** /api/AddressLookups/Areas/{cityId} | 
[**apiAddressLookupsCitiesGovernorateIdGet**](AddressLookupsApi.md#apiaddresslookupscitiesgovernorateidget) | **GET** /api/AddressLookups/Cities/{governorateId} | 
[**apiAddressLookupsCountriesGet**](AddressLookupsApi.md#apiaddresslookupscountriesget) | **GET** /api/AddressLookups/Countries | 
[**apiAddressLookupsGovernoratesCountryIdGet**](AddressLookupsApi.md#apiaddresslookupsgovernoratescountryidget) | **GET** /api/AddressLookups/Governorates/{countryId} | 


# **apiAddressLookupsAreasCityIdGet**
> BuiltList<AddressLookUpDto> apiAddressLookupsAreasCityIdGet(cityId, apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAddressLookupsApi();
final int cityId = 56; // int | 
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiAddressLookupsAreasCityIdGet(cityId, apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AddressLookupsApi->apiAddressLookupsAreasCityIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **int**|  | 
 **apiKey** | **String**|  | 

### Return type

[**BuiltList&lt;AddressLookUpDto&gt;**](AddressLookUpDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressLookupsCitiesGovernorateIdGet**
> BuiltList<CityGetDto> apiAddressLookupsCitiesGovernorateIdGet(governorateId, apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAddressLookupsApi();
final int governorateId = 56; // int | 
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiAddressLookupsCitiesGovernorateIdGet(governorateId, apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AddressLookupsApi->apiAddressLookupsCitiesGovernorateIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **governorateId** | **int**|  | 
 **apiKey** | **String**|  | 

### Return type

[**BuiltList&lt;CityGetDto&gt;**](CityGetDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressLookupsCountriesGet**
> BuiltList<AddressLookUpDto> apiAddressLookupsCountriesGet(apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAddressLookupsApi();
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiAddressLookupsCountriesGet(apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AddressLookupsApi->apiAddressLookupsCountriesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 

### Return type

[**BuiltList&lt;AddressLookUpDto&gt;**](AddressLookUpDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressLookupsGovernoratesCountryIdGet**
> BuiltList<AddressLookUpDto> apiAddressLookupsGovernoratesCountryIdGet(countryId, apiKey)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAddressLookupsApi();
final int countryId = 56; // int | 
final String apiKey = apiKey_example; // String | 

try {
    final response = api.apiAddressLookupsGovernoratesCountryIdGet(countryId, apiKey);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AddressLookupsApi->apiAddressLookupsGovernoratesCountryIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countryId** | **int**|  | 
 **apiKey** | **String**|  | 

### Return type

[**BuiltList&lt;AddressLookUpDto&gt;**](AddressLookUpDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

