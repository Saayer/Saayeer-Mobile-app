//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/user_information_vm.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_information_vm_api_response_model.g.dart';

/// UserInformationVMApiResponseModel
///
/// Properties:
/// * [success] 
/// * [data] 
/// * [errorMessage] 
/// * [reqSecureKey] 
@BuiltValue()
abstract class UserInformationVMApiResponseModel implements Built<UserInformationVMApiResponseModel, UserInformationVMApiResponseModelBuilder> {
  @BuiltValueField(wireName: r'Success')
  bool? get success;

  @BuiltValueField(wireName: r'Data')
  UserInformationVM? get data;

  @BuiltValueField(wireName: r'ErrorMessage')
  String? get errorMessage;

  @BuiltValueField(wireName: r'ReqSecureKey')
  String? get reqSecureKey;

  UserInformationVMApiResponseModel._();

  factory UserInformationVMApiResponseModel([void updates(UserInformationVMApiResponseModelBuilder b)]) = _$UserInformationVMApiResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserInformationVMApiResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserInformationVMApiResponseModel> get serializer => _$UserInformationVMApiResponseModelSerializer();
}

class _$UserInformationVMApiResponseModelSerializer implements PrimitiveSerializer<UserInformationVMApiResponseModel> {
  @override
  final Iterable<Type> types = const [UserInformationVMApiResponseModel, _$UserInformationVMApiResponseModel];

  @override
  final String wireName = r'UserInformationVMApiResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserInformationVMApiResponseModel object, {
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
        specifiedType: const FullType(UserInformationVM),
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
    UserInformationVMApiResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserInformationVMApiResponseModelBuilder result,
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
            specifiedType: const FullType(UserInformationVM),
          ) as UserInformationVM;
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
  UserInformationVMApiResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserInformationVMApiResponseModelBuilder();
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

