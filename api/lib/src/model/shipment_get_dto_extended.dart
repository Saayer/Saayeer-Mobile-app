//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/client_get_dto.dart';
import 'package:openapi/src/model/shipment_status_enum.dart';
import 'package:openapi/src/model/store_shipment_get_dto.dart';
import 'package:openapi/src/model/customer_shipment_get_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipment_get_dto_extended.g.dart';

/// ShipmentGetDtoExtended
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
/// * [labelURL] 
/// * [traceId] 
/// * [senderCustomerId] 
/// * [receiverCustomerId] 
/// * [senderStoreId] 
/// * [receiverStoreId] 
/// * [senderCustomer] 
/// * [receiverCustomer] 
/// * [senderStore] 
/// * [receiverStore] 
/// * [client] 
@BuiltValue()
abstract class ShipmentGetDtoExtended implements Built<ShipmentGetDtoExtended, ShipmentGetDtoExtendedBuilder> {
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
  ShipmentStatusEnum? get status;
  // enum statusEnum {  Pending,  Paid,  Requested,  Picked,  OnTheWay,  Delivered,  NeedAction,  UnKnown,  Canceled,  HasError,  };

  @BuiltValueField(wireName: r'labelURL')
  String? get labelURL;

  @BuiltValueField(wireName: r'traceId')
  String? get traceId;

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

  @BuiltValueField(wireName: r'client')
  ClientGetDto? get client;

  ShipmentGetDtoExtended._();

  factory ShipmentGetDtoExtended([void updates(ShipmentGetDtoExtendedBuilder b)]) = _$ShipmentGetDtoExtended;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShipmentGetDtoExtendedBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShipmentGetDtoExtended> get serializer => _$ShipmentGetDtoExtendedSerializer();
}

class _$ShipmentGetDtoExtendedSerializer implements PrimitiveSerializer<ShipmentGetDtoExtended> {
  @override
  final Iterable<Type> types = const [ShipmentGetDtoExtended, _$ShipmentGetDtoExtended];

  @override
  final String wireName = r'ShipmentGetDtoExtended';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShipmentGetDtoExtended object, {
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
        specifiedType: const FullType.nullable(ShipmentStatusEnum),
      );
    }
    if (object.labelURL != null) {
      yield r'labelURL';
      yield serializers.serialize(
        object.labelURL,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.traceId != null) {
      yield r'traceId';
      yield serializers.serialize(
        object.traceId,
        specifiedType: const FullType.nullable(String),
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
    if (object.client != null) {
      yield r'client';
      yield serializers.serialize(
        object.client,
        specifiedType: const FullType.nullable(ClientGetDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShipmentGetDtoExtended object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShipmentGetDtoExtendedBuilder result,
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
            specifiedType: const FullType.nullable(ShipmentStatusEnum),
          ) as ShipmentStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'labelURL':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.labelURL = valueDes;
          break;
        case r'traceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.traceId = valueDes;
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
        case r'client':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ClientGetDto),
          ) as ClientGetDto?;
          if (valueDes == null) continue;
          result.client.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShipmentGetDtoExtended deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShipmentGetDtoExtendedBuilder();
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

