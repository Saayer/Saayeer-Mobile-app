//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/authenticated_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authenticated_response_api_response_model.g.dart';

/// AuthenticatedResponseApiResponseModel
///
/// Properties:
/// * [success] 
/// * [data] 
/// * [errorMessage] 
/// * [reqSecureKey] 
@BuiltValue()
abstract class AuthenticatedResponseApiResponseModel implements Built<AuthenticatedResponseApiResponseModel, AuthenticatedResponseApiResponseModelBuilder> {
  @BuiltValueField(wireName: r'Success')
  bool? get success;

  @BuiltValueField(wireName: r'Data')
  AuthenticatedResponse? get data;

  @BuiltValueField(wireName: r'ErrorMessage')
  String? get errorMessage;

  @BuiltValueField(wireName: r'ReqSecureKey')
  String? get reqSecureKey;

  AuthenticatedResponseApiResponseModel._();

  factory AuthenticatedResponseApiResponseModel([void updates(AuthenticatedResponseApiResponseModelBuilder b)]) = _$AuthenticatedResponseApiResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthenticatedResponseApiResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthenticatedResponseApiResponseModel> get serializer => _$AuthenticatedResponseApiResponseModelSerializer();
}

class _$AuthenticatedResponseApiResponseModelSerializer implements PrimitiveSerializer<AuthenticatedResponseApiResponseModel> {
  @override
  final Iterable<Type> types = const [AuthenticatedResponseApiResponseModel, _$AuthenticatedResponseApiResponseModel];

  @override
  final String wireName = r'AuthenticatedResponseApiResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthenticatedResponseApiResponseModel object, {
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
        specifiedType: const FullType(AuthenticatedResponse),
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
    AuthenticatedResponseApiResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthenticatedResponseApiResponseModelBuilder result,
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
            specifiedType: const FullType(AuthenticatedResponse),
          ) as AuthenticatedResponse;
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
  AuthenticatedResponseApiResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthenticatedResponseApiResponseModelBuilder();
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

