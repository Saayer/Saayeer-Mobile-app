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

import 'package:openapi/src/model/address_add_dto.dart';
import 'package:openapi/src/model/address_get_dto.dart';
import 'package:openapi/src/model/address_look_up_dto.dart';
import 'package:openapi/src/model/app_settings.dart';
import 'package:openapi/src/model/app_settings_api_response_public_model.dart';
import 'package:openapi/src/model/authenticate_request.dart';
import 'package:openapi/src/model/authenticate_request_verify.dart';
import 'package:openapi/src/model/authenticate_response_verify.dart';
import 'package:openapi/src/model/authenticate_response_verify_data.dart';
import 'package:openapi/src/model/authenticated_response.dart';
import 'package:openapi/src/model/authenticated_response_api_response_model.dart';
import 'package:openapi/src/model/boolean_api_response_model.dart';
import 'package:openapi/src/model/business_information_request_vm.dart';
import 'package:openapi/src/model/business_information_response_vm.dart';
import 'package:openapi/src/model/clients_information_request_vm.dart';
import 'package:openapi/src/model/clients_information_response_vm.dart';
import 'package:openapi/src/model/clients_information_response_vm_list_api_response_model.dart';
import 'package:openapi/src/model/cost_response_dto.dart';
import 'package:openapi/src/model/cost_response_dto_list_api_response_model.dart';
import 'package:openapi/src/model/create_shipment_request_dto.dart';
import 'package:openapi/src/model/create_store_information_vm.dart';
import 'package:openapi/src/model/customer_add_dto.dart';
import 'package:openapi/src/model/customer_get_dto.dart';
import 'package:openapi/src/model/login_device_informations.dart';
import 'package:openapi/src/model/lookup_dto.dart';
import 'package:openapi/src/model/lookup_dto_list_api_response_model.dart';
import 'package:openapi/src/model/object_api_response_model.dart';
import 'package:openapi/src/model/package_details.dart';
import 'package:openapi/src/model/personal_information_request_vm.dart';
import 'package:openapi/src/model/personal_information_response_vm.dart';
import 'package:openapi/src/model/problem_details.dart';
import 'package:openapi/src/model/profile_tye.dart';
import 'package:openapi/src/model/shipment_vm.dart';
import 'package:openapi/src/model/store_information_vm.dart';
import 'package:openapi/src/model/token_api_model.dart';
import 'package:openapi/src/model/user_information_vm.dart';
import 'package:openapi/src/model/user_information_vm_api_response_model.dart';
import 'package:openapi/src/model/user_profile_vm.dart';
import 'package:openapi/src/model/user_profile_vm_api_response_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  AddressAddDto,
  AddressGetDto,
  AddressLookUpDto,
  AppSettings,
  AppSettingsApiResponsePublicModel,
  AuthenticateRequest,
  AuthenticateRequestVerify,
  AuthenticateResponseVerify,
  AuthenticateResponseVerifyData,
  AuthenticatedResponse,
  AuthenticatedResponseApiResponseModel,
  BooleanApiResponseModel,
  BusinessInformationRequestVM,
  BusinessInformationResponseVM,
  ClientsInformationRequestVM,
  ClientsInformationResponseVM,
  ClientsInformationResponseVMListApiResponseModel,
  CostResponseDto,
  CostResponseDtoListApiResponseModel,
  CreateShipmentRequestDto,
  CreateStoreInformationVM,
  CustomerAddDto,
  CustomerGetDto,
  LoginDeviceInformations,
  LookupDto,
  LookupDtoListApiResponseModel,
  ObjectApiResponseModel,
  PackageDetails,
  PersonalInformationRequestVM,
  PersonalInformationResponseVM,
  ProblemDetails,
  ProfileTye,
  ShipmentVM,
  StoreInformationVM,
  TokenApiModel,
  UserInformationVM,
  UserInformationVMApiResponseModel,
  UserProfileVM,
  UserProfileVMApiResponseModel,
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
