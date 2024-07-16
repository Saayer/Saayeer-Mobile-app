//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/clients_information_response_vm.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clients_information_response_vm_list_api_response_model.g.dart';

/// ClientsInformationResponseVMListApiResponseModel
///
/// Properties:
/// * [success] 
/// * [data] 
/// * [errorMessage] 
/// * [reqSecureKey] 
@BuiltValue()
abstract class ClientsInformationResponseVMListApiResponseModel implements Built<ClientsInformationResponseVMListApiResponseModel, ClientsInformationResponseVMListApiResponseModelBuilder> {
  @BuiltValueField(wireName: r'Success')
  bool? get success;

  @BuiltValueField(wireName: r'Data')
  BuiltList<ClientsInformationResponseVM>? get data;

  @BuiltValueField(wireName: r'ErrorMessage')
  String? get errorMessage;

  @BuiltValueField(wireName: r'ReqSecureKey')
  String? get reqSecureKey;

  ClientsInformationResponseVMListApiResponseModel._();

  factory ClientsInformationResponseVMListApiResponseModel([void updates(ClientsInformationResponseVMListApiResponseModelBuilder b)]) = _$ClientsInformationResponseVMListApiResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClientsInformationResponseVMListApiResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClientsInformationResponseVMListApiResponseModel> get serializer => _$ClientsInformationResponseVMListApiResponseModelSerializer();
}

class _$ClientsInformationResponseVMListApiResponseModelSerializer implements PrimitiveSerializer<ClientsInformationResponseVMListApiResponseModel> {
  @override
  final Iterable<Type> types = const [ClientsInformationResponseVMListApiResponseModel, _$ClientsInformationResponseVMListApiResponseModel];

  @override
  final String wireName = r'ClientsInformationResponseVMListApiResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClientsInformationResponseVMListApiResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.success != null) {
      yield r'Success';
      yield serializers.serialize(
        object.success,
        specifiedType: const FullType(bool),
      );
    }
    if (object.data != null) {
      yield r'Data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType.nullable(BuiltList, [FullType(ClientsInformationResponseVM)]),
      );
    }
    if (object.errorMessage != null) {
      yield r'ErrorMessage';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.reqSecureKey != null) {
      yield r'ReqSecureKey';
      yield serializers.serialize(
        object.reqSecureKey,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClientsInformationResponseVMListApiResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClientsInformationResponseVMListApiResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'Success':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.success = valueDes;
          break;
        case r'Data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ClientsInformationResponseVM)]),
          ) as BuiltList<ClientsInformationResponseVM>?;
          if (valueDes == null) continue;
          result.data.replace(valueDes);
          break;
        case r'ErrorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
          break;
        case r'ReqSecureKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reqSecureKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClientsInformationResponseVMListApiResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClientsInformationResponseVMListApiResponseModelBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

