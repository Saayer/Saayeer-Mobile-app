//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'client_get_dto.g.dart';

/// ClientGetDto
///
/// Properties:
/// * [fullName] 
/// * [phoneNo] 
/// * [email] 
/// * [businessName] 
@BuiltValue()
abstract class ClientGetDto implements Built<ClientGetDto, ClientGetDtoBuilder> {
  @BuiltValueField(wireName: r'fullName')
  String? get fullName;

  @BuiltValueField(wireName: r'phoneNo')
  String? get phoneNo;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'businessName')
  String? get businessName;

  ClientGetDto._();

  factory ClientGetDto([void updates(ClientGetDtoBuilder b)]) = _$ClientGetDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClientGetDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClientGetDto> get serializer => _$ClientGetDtoSerializer();
}

class _$ClientGetDtoSerializer implements PrimitiveSerializer<ClientGetDto> {
  @override
  final Iterable<Type> types = const [ClientGetDto, _$ClientGetDto];

  @override
  final String wireName = r'ClientGetDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClientGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.fullName != null) {
      yield r'fullName';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.phoneNo != null) {
      yield r'phoneNo';
      yield serializers.serialize(
        object.phoneNo,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.businessName != null) {
      yield r'businessName';
      yield serializers.serialize(
        object.businessName,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClientGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClientGetDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fullName = valueDes;
          break;
        case r'phoneNo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phoneNo = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'businessName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.businessName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClientGetDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClientGetDtoBuilder();
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

