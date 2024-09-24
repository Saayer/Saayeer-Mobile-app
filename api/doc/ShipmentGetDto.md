# openapi.model.ShipmentGetDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**shipmentId** | **int** |  | [optional] 
**length** | **double** |  | [optional] 
**height** | **double** |  | [optional] 
**width** | **double** |  | [optional] 
**weight** | **double** |  | [optional] 
**contentDesc** | **String** |  | [optional] 
**contentValue** | **double** |  | [optional] 
**cost** | **double** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 
**logisticServiceName** | **String** |  | [optional] 
**status** | [**ShipmentStatusEnum**](ShipmentStatusEnum.md) |  | [optional] 
**senderCustomerId** | **int** |  | [optional] 
**receiverCustomerId** | **int** |  | [optional] 
**senderStoreId** | **int** |  | [optional] 
**receiverStoreId** | **int** |  | [optional] 
**senderCustomer** | [**CustomerShipmentGetDto**](CustomerShipmentGetDto.md) |  | [optional] 
**receiverCustomer** | [**CustomerShipmentGetDto**](CustomerShipmentGetDto.md) |  | [optional] 
**senderStore** | [**StoreShipmentGetDto**](StoreShipmentGetDto.md) |  | [optional] 
**receiverStore** | [**StoreShipmentGetDto**](StoreShipmentGetDto.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


