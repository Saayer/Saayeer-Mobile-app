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
import 'package:openapi/src/model/customer_add_dto.dart';
import 'package:openapi/src/model/customer_get_dto.dart';
import 'package:openapi/src/model/customer_query.dart';
import 'package:openapi/src/model/login_request_dto.dart';
import 'package:openapi/src/model/login_response_dto.dart';
import 'package:openapi/src/model/token_request_dto.dart';
import 'package:openapi/src/model/token_response_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  AddressLookUpDto,
  CustomerAddDto,
  CustomerGetDto,
  CustomerQuery,
  LoginRequestDto,
  LoginResponseDto,
  TokenRequestDto,
  TokenResponseDto,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(AddressLookUpDto)]),
        () => ListBuilder<AddressLookUpDto>(),
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
