# openapi.api.AccountingApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/saayer-37/app*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAccountingCreatePaymentPost**](AccountingApi.md#apiaccountingcreatepaymentpost) | **POST** /api/Accounting/create-payment | 


# **apiAccountingCreatePaymentPost**
> CreatePaymentResponse apiAccountingCreatePaymentPost(apiKey, paymentAddDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAccountingApi();
final String apiKey = apiKey_example; // String | 
final PaymentAddDto paymentAddDto = ; // PaymentAddDto | 

try {
    final response = api.apiAccountingCreatePaymentPost(apiKey, paymentAddDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AccountingApi->apiAccountingCreatePaymentPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKey** | **String**|  | 
 **paymentAddDto** | [**PaymentAddDto**](PaymentAddDto.md)|  | [optional] 

### Return type

[**CreatePaymentResponse**](CreatePaymentResponse.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

