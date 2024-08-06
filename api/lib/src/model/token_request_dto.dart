//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'token_request_dto.g.dart';

/// TokenRequestDto
///
/// Properties:
/// * [phoneNumber] 
/// * [verificationCode] 
@BuiltValue()
abstract class TokenRequestDto implements Built<TokenRequestDto, TokenRequestDtoBuilder> {
  @BuiltValueField(wireName: r'phoneNumber')
  String? get phoneNumber;

  @BuiltValueField(wireName: r'verificationCode')
  String? get verificationCode;

  TokenRequestDto._();

  factory TokenRequestDto([void updates(TokenRequestDtoBuilder b)]) = _$TokenRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TokenRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TokenRequestDto> get serializer => _$TokenRequestDtoSerializer();
}

class _$TokenRequestDtoSerializer implements PrimitiveSerializer<TokenRequestDto> {
  @override
  final Iterable<Type> types = const [TokenRequestDto, _$TokenRequestDto];

  @override
  final String wireName = r'TokenRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TokenRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.phoneNumber != null) {
      yield r'phoneNumber';
      yield serializers.serialize(
        object.phoneNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.verificationCode != null) {
      yield r'verificationCode';
      yield serializers.serialize(
        object.verificationCode,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TokenRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TokenRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'phoneNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phoneNumber = valueDes;
          break;
        case r'verificationCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.verificationCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TokenRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TokenRequestDtoBuilder();
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

