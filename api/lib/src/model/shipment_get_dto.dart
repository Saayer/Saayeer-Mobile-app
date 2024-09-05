//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/store_shipment_get_dto.dart';
import 'package:openapi/src/model/shipment_status.dart';
import 'package:openapi/src/model/customer_shipment_get_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipment_get_dto.g.dart';

/// ShipmentGetDto
///
/// Properties:
/// * [shipmentId] 
/// * [length] 
/// * [height] 
/// * [width] 
/// * [weight] 
/// * [contentDesc] 
/// * [contentValue] 
/// * [cost] 
/// * [createdAt] 
/// * [logisticServiceName] 
/// * [status] 
/// * [senderCustomerId] 
/// * [receiverCustomerId] 
/// * [senderStoreId] 
/// * [receiverStoreId] 
/// * [senderCustomer] 
/// * [receiverCustomer] 
/// * [senderStore] 
/// * [receiverStore] 
@BuiltValue()
abstract class ShipmentGetDto implements Built<ShipmentGetDto, ShipmentGetDtoBuilder> {
  @BuiltValueField(wireName: r'shipmentId')
  int? get shipmentId;

  @BuiltValueField(wireName: r'length')
  double? get length;

  @BuiltValueField(wireName: r'height')
  double? get height;

  @BuiltValueField(wireName: r'width')
  double? get width;

  @BuiltValueField(wireName: r'weight')
  double? get weight;

  @BuiltValueField(wireName: r'contentDesc')
  String? get contentDesc;

  @BuiltValueField(wireName: r'contentValue')
  double? get contentValue;

  @BuiltValueField(wireName: r'cost')
  double? get cost;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'logisticServiceName')
  String? get logisticServiceName;

  @BuiltValueField(wireName: r'status')
  ShipmentStatus? get status;
  // enum statusEnum {  Pending,  Paid,  Requested,  };

  @BuiltValueField(wireName: r'senderCustomerId')
  int? get senderCustomerId;

  @BuiltValueField(wireName: r'receiverCustomerId')
  int? get receiverCustomerId;

  @BuiltValueField(wireName: r'senderStoreId')
  int? get senderStoreId;

  @BuiltValueField(wireName: r'receiverStoreId')
  int? get receiverStoreId;

  @BuiltValueField(wireName: r'senderCustomer')
  CustomerShipmentGetDto? get senderCustomer;

  @BuiltValueField(wireName: r'receiverCustomer')
  CustomerShipmentGetDto? get receiverCustomer;

  @BuiltValueField(wireName: r'senderStore')
  StoreShipmentGetDto? get senderStore;

  @BuiltValueField(wireName: r'receiverStore')
  StoreShipmentGetDto? get receiverStore;

  ShipmentGetDto._();

  factory ShipmentGetDto([void updates(ShipmentGetDtoBuilder b)]) = _$ShipmentGetDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShipmentGetDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShipmentGetDto> get serializer => _$ShipmentGetDtoSerializer();
}

class _$ShipmentGetDtoSerializer implements PrimitiveSerializer<ShipmentGetDto> {
  @override
  final Iterable<Type> types = const [ShipmentGetDto, _$ShipmentGetDto];

  @override
  final String wireName = r'ShipmentGetDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShipmentGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.shipmentId != null) {
      yield r'shipmentId';
      yield serializers.serialize(
        object.shipmentId,
        specifiedType: const FullType(int),
      );
    }
    if (object.length != null) {
      yield r'length';
      yield serializers.serialize(
        object.length,
        specifiedType: const FullType(double),
      );
    }
    if (object.height != null) {
      yield r'height';
      yield serializers.serialize(
        object.height,
        specifiedType: const FullType(double),
      );
    }
    if (object.width != null) {
      yield r'width';
      yield serializers.serialize(
        object.width,
        specifiedType: const FullType(double),
      );
    }
    if (object.weight != null) {
      yield r'weight';
      yield serializers.serialize(
        object.weight,
        specifiedType: const FullType(double),
      );
    }
    if (object.contentDesc != null) {
      yield r'contentDesc';
      yield serializers.serialize(
        object.contentDesc,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.contentValue != null) {
      yield r'contentValue';
      yield serializers.serialize(
        object.contentValue,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.cost != null) {
      yield r'cost';
      yield serializers.serialize(
        object.cost,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.logisticServiceName != null) {
      yield r'logisticServiceName';
      yield serializers.serialize(
        object.logisticServiceName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType.nullable(ShipmentStatus),
      );
    }
    if (object.senderCustomerId != null) {
      yield r'senderCustomerId';
      yield serializers.serialize(
        object.senderCustomerId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.receiverCustomerId != null) {
      yield r'receiverCustomerId';
      yield serializers.serialize(
        object.receiverCustomerId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.senderStoreId != null) {
      yield r'senderStoreId';
      yield serializers.serialize(
        object.senderStoreId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.receiverStoreId != null) {
      yield r'receiverStoreId';
      yield serializers.serialize(
        object.receiverStoreId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.senderCustomer != null) {
      yield r'senderCustomer';
      yield serializers.serialize(
        object.senderCustomer,
        specifiedType: const FullType.nullable(CustomerShipmentGetDto),
      );
    }
    if (object.receiverCustomer != null) {
      yield r'receiverCustomer';
      yield serializers.serialize(
        object.receiverCustomer,
        specifiedType: const FullType.nullable(CustomerShipmentGetDto),
      );
    }
    if (object.senderStore != null) {
      yield r'senderStore';
      yield serializers.serialize(
        object.senderStore,
        specifiedType: const FullType.nullable(StoreShipmentGetDto),
      );
    }
    if (object.receiverStore != null) {
      yield r'receiverStore';
      yield serializers.serialize(
        object.receiverStore,
        specifiedType: const FullType.nullable(StoreShipmentGetDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShipmentGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShipmentGetDtoBuilder result,
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
        case r'length':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.length = valueDes;
          break;
        case r'height':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.height = valueDes;
          break;
        case r'width':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.width = valueDes;
          break;
        case r'weight':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.weight = valueDes;
          break;
        case r'contentDesc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.contentDesc = valueDes;
          break;
        case r'contentValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.contentValue = valueDes;
          break;
        case r'cost':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.cost = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'logisticServiceName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.logisticServiceName = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ShipmentStatus),
          ) as ShipmentStatus?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'senderCustomerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.senderCustomerId = valueDes;
          break;
        case r'receiverCustomerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.receiverCustomerId = valueDes;
          break;
        case r'senderStoreId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.senderStoreId = valueDes;
          break;
        case r'receiverStoreId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.receiverStoreId = valueDes;
          break;
        case r'senderCustomer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CustomerShipmentGetDto),
          ) as CustomerShipmentGetDto?;
          if (valueDes == null) continue;
          result.senderCustomer.replace(valueDes);
          break;
        case r'receiverCustomer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CustomerShipmentGetDto),
          ) as CustomerShipmentGetDto?;
          if (valueDes == null) continue;
          result.receiverCustomer.replace(valueDes);
          break;
        case r'senderStore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(StoreShipmentGetDto),
          ) as StoreShipmentGetDto?;
          if (valueDes == null) continue;
          result.senderStore.replace(valueDes);
          break;
        case r'receiverStore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(StoreShipmentGetDto),
          ) as StoreShipmentGetDto?;
          if (valueDes == null) continue;
          result.receiverStore.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShipmentGetDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShipmentGetDtoBuilder();
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

