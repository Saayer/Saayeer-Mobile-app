//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authenticated_response.g.dart';

/// AuthenticatedResponse
///
/// Properties:
/// * [token] 
/// * [refreshToken] 
@BuiltValue()
abstract class AuthenticatedResponse implements Built<AuthenticatedResponse, AuthenticatedResponseBuilder> {
  @BuiltValueField(wireName: r'Token')
  String? get token;

  @BuiltValueField(wireName: r'RefreshToken')
  String? get refreshToken;

  AuthenticatedResponse._();

  factory AuthenticatedResponse([void updates(AuthenticatedResponseBuilder b)]) = _$AuthenticatedResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthenticatedResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthenticatedResponse> get serializer => _$AuthenticatedResponseSerializer();
}

class _$AuthenticatedResponseSerializer implements PrimitiveSerializer<AuthenticatedResponse> {
  @override
  final Iterable<Type> types = const [AuthenticatedResponse, _$AuthenticatedResponse];

  @override
  final String wireName = r'AuthenticatedResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthenticatedResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.token != null) {
      yield r'Token';
      yield serializers.serialize(
        object.token,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.refreshToken != null) {
      yield r'RefreshToken';
      yield serializers.serialize(
        object.refreshToken,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthenticatedResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthenticatedResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'Token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.token = valueDes;
          break;
        case r'RefreshToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.refreshToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuthenticatedResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthenticatedResponseBuilder();
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

