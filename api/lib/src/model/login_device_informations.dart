//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_device_informations.g.dart';

/// LoginDeviceInformations
///
/// Properties:
/// * [isMobile] 
/// * [deviceInformation] 
/// * [locationInformations] 
@BuiltValue()
abstract class LoginDeviceInformations implements Built<LoginDeviceInformations, LoginDeviceInformationsBuilder> {
  @BuiltValueField(wireName: r'IsMobile')
  bool? get isMobile;

  @BuiltValueField(wireName: r'DeviceInformation')
  String? get deviceInformation;

  @BuiltValueField(wireName: r'LocationInformations')
  String? get locationInformations;

  LoginDeviceInformations._();

  factory LoginDeviceInformations([void updates(LoginDeviceInformationsBuilder b)]) = _$LoginDeviceInformations;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginDeviceInformationsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginDeviceInformations> get serializer => _$LoginDeviceInformationsSerializer();
}

class _$LoginDeviceInformationsSerializer implements PrimitiveSerializer<LoginDeviceInformations> {
  @override
  final Iterable<Type> types = const [LoginDeviceInformations, _$LoginDeviceInformations];

  @override
  final String wireName = r'LoginDeviceInformations';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginDeviceInformations object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.isMobile != null) {
      yield r'IsMobile';
      yield serializers.serialize(
        object.isMobile,
        specifiedType: const FullType(bool),
      );
    }
    if (object.deviceInformation != null) {
      yield r'DeviceInformation';
      yield serializers.serialize(
        object.deviceInformation,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.locationInformations != null) {
      yield r'LocationInformations';
      yield serializers.serialize(
        object.locationInformations,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    LoginDeviceInformations object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LoginDeviceInformationsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'IsMobile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isMobile = valueDes;
          break;
        case r'DeviceInformation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceInformation = valueDes;
          break;
        case r'LocationInformations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.locationInformations = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LoginDeviceInformations deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginDeviceInformationsBuilder();
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

