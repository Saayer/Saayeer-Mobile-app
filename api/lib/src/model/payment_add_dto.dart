//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_add_dto.g.dart';

/// PaymentAddDto
///
/// Properties:
/// * [shipmentId] 
/// * [transactionId] 
/// * [amount] 
/// * [fee] 
/// * [currency] 
@BuiltValue()
abstract class PaymentAddDto implements Built<PaymentAddDto, PaymentAddDtoBuilder> {
  @BuiltValueField(wireName: r'shipmentId')
  int get shipmentId;

  @BuiltValueField(wireName: r'transactionId')
  String get transactionId;

  @BuiltValueField(wireName: r'amount')
  double get amount;

  @BuiltValueField(wireName: r'fee')
  double get fee;

  @BuiltValueField(wireName: r'currency')
  String get currency;

  PaymentAddDto._();

  factory PaymentAddDto([void updates(PaymentAddDtoBuilder b)]) = _$PaymentAddDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaymentAddDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaymentAddDto> get serializer => _$PaymentAddDtoSerializer();
}

class _$PaymentAddDtoSerializer implements PrimitiveSerializer<PaymentAddDto> {
  @override
  final Iterable<Type> types = const [PaymentAddDto, _$PaymentAddDto];

  @override
  final String wireName = r'PaymentAddDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaymentAddDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'shipmentId';
    yield serializers.serialize(
      object.shipmentId,
      specifiedType: const FullType(int),
    );
    yield r'transactionId';
    yield serializers.serialize(
      object.transactionId,
      specifiedType: const FullType(String),
    );
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(double),
    );
    yield r'fee';
    yield serializers.serialize(
      object.fee,
      specifiedType: const FullType(double),
    );
    yield r'currency';
    yield serializers.serialize(
      object.currency,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PaymentAddDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaymentAddDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'shipmentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.shipmentId = valueDes;
          break;
        case r'transactionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.transactionId = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.amount = valueDes;
          break;
        case r'fee':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.fee = valueDes;
          break;
        case r'currency':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currency = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaymentAddDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaymentAddDtoBuilder();
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

