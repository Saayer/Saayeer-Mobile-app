//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/address_look_up_dto.dart';
import 'package:openapi/src/model/addressable_add_dto.dart';
import 'package:openapi/src/model/amount_per_date_dto.dart';
import 'package:openapi/src/model/amount_per_date_response.dart';
import 'package:openapi/src/model/aramex_webhook_request.dart';
import 'package:openapi/src/model/aramex_webhook_value.dart';
import 'package:openapi/src/model/city_get_dto.dart';
import 'package:openapi/src/model/client_add_dto.dart';
import 'package:openapi/src/model/client_get_dto.dart';
import 'package:openapi/src/model/count_per_date_item_dto.dart';
import 'package:openapi/src/model/count_per_date_response.dart';
import 'package:openapi/src/model/create_payment_response.dart';
import 'package:openapi/src/model/create_shipment_status.dart';
import 'package:openapi/src/model/customer_add_dto.dart';
import 'package:openapi/src/model/customer_get_dto.dart';
import 'package:openapi/src/model/customer_query.dart';
import 'package:openapi/src/model/customer_shipment_get_dto.dart';
import 'package:openapi/src/model/date_range_dto.dart';
import 'package:openapi/src/model/error_codes.dart';
import 'package:openapi/src/model/error_message.dart';
import 'package:openapi/src/model/experimental_shipment_created_at_request.dart';
import 'package:openapi/src/model/experimental_shipment_status_add.dart';
import 'package:openapi/src/model/login_request_dto.dart';
import 'package:openapi/src/model/login_response_dto.dart';
import 'package:openapi/src/model/logistics_service_base.dart';
import 'package:openapi/src/model/payment_add_dto.dart';
import 'package:openapi/src/model/service_cost.dart';
import 'package:openapi/src/model/shipment_add_dto.dart';
import 'package:openapi/src/model/shipment_cost_dto.dart';
import 'package:openapi/src/model/shipment_get_dto.dart';
import 'package:openapi/src/model/shipment_query.dart';
import 'package:openapi/src/model/shipment_status_enum.dart';
import 'package:openapi/src/model/shipment_status_get_dto.dart';
import 'package:openapi/src/model/shipments_count_response.dart';
import 'package:openapi/src/model/store_add_dto.dart';
import 'package:openapi/src/model/store_get_dto.dart';
import 'package:openapi/src/model/store_shipment_get_dto.dart';
import 'package:openapi/src/model/token_reponse_status.dart';
import 'package:openapi/src/model/token_request_dto.dart';
import 'package:openapi/src/model/token_response_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  AddressLookUpDto,
  AddressableAddDto,
  AmountPerDateDto,
  AmountPerDateResponse,
  AramexWebhookRequest,
  AramexWebhookValue,
  CityGetDto,
  ClientAddDto,
  ClientGetDto,
  CountPerDateItemDto,
  CountPerDateResponse,
  CreatePaymentResponse,
  CreateShipmentStatus,
  CustomerAddDto,
  CustomerGetDto,
  CustomerQuery,
  CustomerShipmentGetDto,
  DateRangeDto,
  ErrorCodes,
  ErrorMessage,
  ExperimentalShipmentCreatedAtRequest,
  ExperimentalShipmentStatusAdd,
  LoginRequestDto,
  LoginResponseDto,
  LogisticsServiceBase,
  PaymentAddDto,
  ServiceCost,
  ShipmentAddDto,
  ShipmentCostDto,
  ShipmentGetDto,
  ShipmentQuery,
  ShipmentStatusEnum,
  ShipmentStatusGetDto,
  ShipmentsCountResponse,
  StoreAddDto,
  StoreGetDto,
  StoreShipmentGetDto,
  TokenReponseStatus,
  TokenRequestDto,
  TokenResponseDto,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ShipmentStatusGetDto)]),
        () => ListBuilder<ShipmentStatusGetDto>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CityGetDto)]),
        () => ListBuilder<CityGetDto>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ServiceCost)]),
        () => ListBuilder<ServiceCost>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(LogisticsServiceBase)]),
        () => ListBuilder<LogisticsServiceBase>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(AddressLookUpDto)]),
        () => ListBuilder<AddressLookUpDto>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ShipmentGetDto)]),
        () => ListBuilder<ShipmentGetDto>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(StoreGetDto)]),
        () => ListBuilder<StoreGetDto>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CustomerGetDto)]),
        () => ListBuilder<CustomerGetDto>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
