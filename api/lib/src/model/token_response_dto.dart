//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/token_reponse_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'token_response_dto.g.dart';

/// TokenResponseDto
///
/// Properties:
/// * [role] 
/// * [token] 
/// * [expiration] 
/// * [reponseStatus] 
/// * [errorMessage] 
@BuiltValue()
abstract class TokenResponseDto implements Built<TokenResponseDto, TokenResponseDtoBuilder> {
  @BuiltValueField(wireName: r'role')
  String? get role;

  @BuiltValueField(wireName: r'token')
  String? get token;

  @BuiltValueField(wireName: r'expiration')
  DateTime? get expiration;

  @BuiltValueField(wireName: r'reponseStatus')
  TokenReponseStatus? get reponseStatus;
  // enum reponseStatusEnum {  Success,  Invalid_OTP_Code,  PhoneNumber_Not_Registered,  };

  @BuiltValueField(wireName: r'errorMessage')
  String? get errorMessage;

  TokenResponseDto._();

  factory TokenResponseDto([void updates(TokenResponseDtoBuilder b)]) = _$TokenResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TokenResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TokenResponseDto> get serializer => _$TokenResponseDtoSerializer();
}

class _$TokenResponseDtoSerializer implements PrimitiveSerializer<TokenResponseDto> {
  @override
  final Iterable<Type> types = const [TokenResponseDto, _$TokenResponseDto];

  @override
  final String wireName = r'TokenResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TokenResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.token != null) {
      yield r'token';
      yield serializers.serialize(
        object.token,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.expiration != null) {
      yield r'expiration';
      yield serializers.serialize(
        object.expiration,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.reponseStatus != null) {
      yield r'reponseStatus';
      yield serializers.serialize(
        object.reponseStatus,
        specifiedType: const FullType(TokenReponseStatus),
      );
    }
    if (object.errorMessage != null) {
      yield r'errorMessage';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TokenResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TokenResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.role = valueDes;
          break;
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.token = valueDes;
          break;
        case r'expiration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.expiration = valueDes;
          break;
        case r'reponseStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TokenReponseStatus),
          ) as TokenReponseStatus;
          result.reponseStatus = valueDes;
          break;
        case r'errorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TokenResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TokenResponseDtoBuilder();
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

