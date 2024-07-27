//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/login_device_informations.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authenticate_request_verify.g.dart';

/// AuthenticateRequestVerify
///
/// Properties:
/// * [mobileNumber] 
/// * [otp] 
/// * [deviceInformation] 
@BuiltValue()
abstract class AuthenticateRequestVerify implements Built<AuthenticateRequestVerify, AuthenticateRequestVerifyBuilder> {
  @BuiltValueField(wireName: r'MobileNumber')
  String get mobileNumber;

  @BuiltValueField(wireName: r'Otp')
  String get otp;

  @BuiltValueField(wireName: r'DeviceInformation')
  LoginDeviceInformations? get deviceInformation;

  AuthenticateRequestVerify._();

  factory AuthenticateRequestVerify([void updates(AuthenticateRequestVerifyBuilder b)]) = _$AuthenticateRequestVerify;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthenticateRequestVerifyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthenticateRequestVerify> get serializer => _$AuthenticateRequestVerifySerializer();
}

class _$AuthenticateRequestVerifySerializer implements PrimitiveSerializer<AuthenticateRequestVerify> {
  @override
  final Iterable<Type> types = const [AuthenticateRequestVerify, _$AuthenticateRequestVerify];

  @override
  final String wireName = r'AuthenticateRequestVerify';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthenticateRequestVerify object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'MobileNumber';
    yield serializers.serialize(
      object.mobileNumber,
      specifiedType: const FullType(String),
    );
    yield r'Otp';
    yield serializers.serialize(
      object.otp,
      specifiedType: const FullType(String),
    );
    if (object.deviceInformation != null) {
      yield r'DeviceInformation';
      yield serializers.serialize(
        object.deviceInformation,
        specifiedType: const FullType(LoginDeviceInformations),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthenticateRequestVerify object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthenticateRequestVerifyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'MobileNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mobileNumber = valueDes;
          break;
        case r'Otp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.otp = valueDes;
          break;
        case r'DeviceInformation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(LoginDeviceInformations),
          ) as LoginDeviceInformations;
          result.deviceInformation.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuthenticateRequestVerify deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthenticateRequestVerifyBuilder();
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

