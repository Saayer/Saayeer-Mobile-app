//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'customer_query.g.dart';

/// CustomerQuery
///
/// Properties:
/// * [general] 
/// * [phone] 
/// * [countryId] 
/// * [governorateId] 
/// * [cityId] 
/// * [shipmentDateFrom] 
/// * [shipmentDateTo] 
/// * [totalShipmentsMin] 
/// * [totalShipmentsMax] 
/// * [skip] 
/// * [take] 
@BuiltValue()
abstract class CustomerQuery implements Built<CustomerQuery, CustomerQueryBuilder> {
  @BuiltValueField(wireName: r'general')
  String? get general;

  @BuiltValueField(wireName: r'phone')
  String? get phone;

  @BuiltValueField(wireName: r'countryId')
  int? get countryId;

  @BuiltValueField(wireName: r'governorateId')
  int? get governorateId;

  @BuiltValueField(wireName: r'cityId')
  int? get cityId;

  @BuiltValueField(wireName: r'shipmentDateFrom')
  DateTime? get shipmentDateFrom;

  @BuiltValueField(wireName: r'shipmentDateTo')
  DateTime? get shipmentDateTo;

  @BuiltValueField(wireName: r'totalShipmentsMin')
  int? get totalShipmentsMin;

  @BuiltValueField(wireName: r'totalShipmentsMax')
  int? get totalShipmentsMax;

  @BuiltValueField(wireName: r'skip')
  int? get skip;

  @BuiltValueField(wireName: r'take')
  int? get take;

  CustomerQuery._();

  factory CustomerQuery([void updates(CustomerQueryBuilder b)]) = _$CustomerQuery;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CustomerQueryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CustomerQuery> get serializer => _$CustomerQuerySerializer();
}

class _$CustomerQuerySerializer implements PrimitiveSerializer<CustomerQuery> {
  @override
  final Iterable<Type> types = const [CustomerQuery, _$CustomerQuery];

  @override
  final String wireName = r'CustomerQuery';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CustomerQuery object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.general != null) {
      yield r'general';
      yield serializers.serialize(
        object.general,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.phone != null) {
      yield r'phone';
      yield serializers.serialize(
        object.phone,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.countryId != null) {
      yield r'countryId';
      yield serializers.serialize(
        object.countryId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.governorateId != null) {
      yield r'governorateId';
      yield serializers.serialize(
        object.governorateId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.cityId != null) {
      yield r'cityId';
      yield serializers.serialize(
        object.cityId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.shipmentDateFrom != null) {
      yield r'shipmentDateFrom';
      yield serializers.serialize(
        object.shipmentDateFrom,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.shipmentDateTo != null) {
      yield r'shipmentDateTo';
      yield serializers.serialize(
        object.shipmentDateTo,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.totalShipmentsMin != null) {
      yield r'totalShipmentsMin';
      yield serializers.serialize(
        object.totalShipmentsMin,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.totalShipmentsMax != null) {
      yield r'totalShipmentsMax';
      yield serializers.serialize(
        object.totalShipmentsMax,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.skip != null) {
      yield r'skip';
      yield serializers.serialize(
        object.skip,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.take != null) {
      yield r'take';
      yield serializers.serialize(
        object.take,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CustomerQuery object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CustomerQueryBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'general':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.general = valueDes;
          break;
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phone = valueDes;
          break;
        case r'countryId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.countryId = valueDes;
          break;
        case r'governorateId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.governorateId = valueDes;
          break;
        case r'cityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.cityId = valueDes;
          break;
        case r'shipmentDateFrom':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.shipmentDateFrom = valueDes;
          break;
        case r'shipmentDateTo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.shipmentDateTo = valueDes;
          break;
        case r'totalShipmentsMin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalShipmentsMin = valueDes;
          break;
        case r'totalShipmentsMax':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalShipmentsMax = valueDes;
          break;
        case r'skip':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.skip = valueDes;
          break;
        case r'take':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.take = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CustomerQuery deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CustomerQueryBuilder();
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

