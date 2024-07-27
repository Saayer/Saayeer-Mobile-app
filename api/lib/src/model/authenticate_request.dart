//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authenticate_request.g.dart';

/// AuthenticateRequest
///
/// Properties:
/// * [mobileNumber] 
@BuiltValue()
abstract class AuthenticateRequest implements Built<AuthenticateRequest, AuthenticateRequestBuilder> {
  @BuiltValueField(wireName: r'MobileNumber')
  String get mobileNumber;

  AuthenticateRequest._();

  factory AuthenticateRequest([void updates(AuthenticateRequestBuilder b)]) = _$AuthenticateRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthenticateRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthenticateRequest> get serializer => _$AuthenticateRequestSerializer();
}

class _$AuthenticateRequestSerializer implements PrimitiveSerializer<AuthenticateRequest> {
  @override
  final Iterable<Type> types = const [AuthenticateRequest, _$AuthenticateRequest];

  @override
  final String wireName = r'AuthenticateRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthenticateRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'MobileNumber';
    yield serializers.serialize(
      object.mobileNumber,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthenticateRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthenticateRequestBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuthenticateRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthenticateRequestBuilder();
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

