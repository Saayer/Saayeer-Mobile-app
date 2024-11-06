//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/error_message.dart';
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/shipment_get_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_payment_response.g.dart';

/// CreatePaymentResponse
///
/// Properties:
/// * [hasError] 
/// * [errorMessages] 
/// * [shipment] 
@BuiltValue()
abstract class CreatePaymentResponse implements Built<CreatePaymentResponse, CreatePaymentResponseBuilder> {
  @BuiltValueField(wireName: r'hasError')
  bool? get hasError;

  @BuiltValueField(wireName: r'errorMessages')
  BuiltList<ErrorMessage>? get errorMessages;

  @BuiltValueField(wireName: r'shipment')
  ShipmentGetDto? get shipment;

  CreatePaymentResponse._();

  factory CreatePaymentResponse([void updates(CreatePaymentResponseBuilder b)]) = _$CreatePaymentResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreatePaymentResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreatePaymentResponse> get serializer => _$CreatePaymentResponseSerializer();
}

class _$CreatePaymentResponseSerializer implements PrimitiveSerializer<CreatePaymentResponse> {
  @override
  final Iterable<Type> types = const [CreatePaymentResponse, _$CreatePaymentResponse];

  @override
  final String wireName = r'CreatePaymentResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreatePaymentResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.hasError != null) {
      yield r'hasError';
      yield serializers.serialize(
        object.hasError,
        specifiedType: const FullType(bool),
      );
    }
    if (object.errorMessages != null) {
      yield r'errorMessages';
      yield serializers.serialize(
        object.errorMessages,
        specifiedType: const FullType.nullable(BuiltList, [FullType(ErrorMessage)]),
      );
    }
    if (object.shipment != null) {
      yield r'shipment';
      yield serializers.serialize(
        object.shipment,
        specifiedType: const FullType.nullable(ShipmentGetDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreatePaymentResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreatePaymentResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'hasError':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hasError = valueDes;
          break;
        case r'errorMessages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ErrorMessage)]),
          ) as BuiltList<ErrorMessage>?;
          if (valueDes == null) continue;
          result.errorMessages.replace(valueDes);
          break;
        case r'shipment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ShipmentGetDto),
          ) as ShipmentGetDto?;
          if (valueDes == null) continue;
          result.shipment.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreatePaymentResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreatePaymentResponseBuilder();
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

