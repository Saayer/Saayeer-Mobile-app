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
/// * [amount] 
/// * [currency] 
/// * [fee] 
/// * [transactionId] 
/// * [sourceCompany] 
/// * [sourceGatewayId] 
/// * [sourceMessage] 
/// * [sourceName] 
/// * [sourceNumber] 
/// * [sourceReferenceNumber] 
/// * [sourceType] 
/// * [status] 
@BuiltValue()
abstract class PaymentAddDto implements Built<PaymentAddDto, PaymentAddDtoBuilder> {
  @BuiltValueField(wireName: r'shipmentId')
  int get shipmentId;

  @BuiltValueField(wireName: r'amount')
  double get amount;

  @BuiltValueField(wireName: r'currency')
  String get currency;

  @BuiltValueField(wireName: r'fee')
  double get fee;

  @BuiltValueField(wireName: r'transactionId')
  String get transactionId;

  @BuiltValueField(wireName: r'sourceCompany')
  String? get sourceCompany;

  @BuiltValueField(wireName: r'sourceGateway_id')
  String? get sourceGatewayId;

  @BuiltValueField(wireName: r'sourceMessage')
  String? get sourceMessage;

  @BuiltValueField(wireName: r'sourceName')
  String? get sourceName;

  @BuiltValueField(wireName: r'sourceNumber')
  String? get sourceNumber;

  @BuiltValueField(wireName: r'sourceReference_Number')
  String? get sourceReferenceNumber;

  @BuiltValueField(wireName: r'sourceType')
  String? get sourceType;

  @BuiltValueField(wireName: r'status')
  String? get status;

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
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(double),
    );
    yield r'currency';
    yield serializers.serialize(
      object.currency,
      specifiedType: const FullType(String),
    );
    yield r'fee';
    yield serializers.serialize(
      object.fee,
      specifiedType: const FullType(double),
    );
    yield r'transactionId';
    yield serializers.serialize(
      object.transactionId,
      specifiedType: const FullType(String),
    );
    if (object.sourceCompany != null) {
      yield r'sourceCompany';
      yield serializers.serialize(
        object.sourceCompany,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sourceGatewayId != null) {
      yield r'sourceGateway_id';
      yield serializers.serialize(
        object.sourceGatewayId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sourceMessage != null) {
      yield r'sourceMessage';
      yield serializers.serialize(
        object.sourceMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sourceName != null) {
      yield r'sourceName';
      yield serializers.serialize(
        object.sourceName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sourceNumber != null) {
      yield r'sourceNumber';
      yield serializers.serialize(
        object.sourceNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sourceReferenceNumber != null) {
      yield r'sourceReference_Number';
      yield serializers.serialize(
        object.sourceReferenceNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sourceType != null) {
      yield r'sourceType';
      yield serializers.serialize(
        object.sourceType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType.nullable(String),
      );
    }
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
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.amount = valueDes;
          break;
        case r'currency':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currency = valueDes;
          break;
        case r'fee':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.fee = valueDes;
          break;
        case r'transactionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.transactionId = valueDes;
          break;
        case r'sourceCompany':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceCompany = valueDes;
          break;
        case r'sourceGateway_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceGatewayId = valueDes;
          break;
        case r'sourceMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceMessage = valueDes;
          break;
        case r'sourceName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceName = valueDes;
          break;
        case r'sourceNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceNumber = valueDes;
          break;
        case r'sourceReference_Number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceReferenceNumber = valueDes;
          break;
        case r'sourceType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceType = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.status = valueDes;
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

