//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/package_details.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_shipment_request_dto.g.dart';

/// CreateShipmentRequestDto
///
/// Properties:
/// * [shipperId] 
/// * [storeId] 
/// * [senderCityId] 
/// * [reciverCityId] 
/// * [orderAmount] 
/// * [reciverName] 
/// * [reciverAddress] 
/// * [reciverPhone] 
/// * [senderName] 
/// * [senderAddress] 
/// * [senderPhone] 
/// * [packageDescription] 
/// * [packageDetails] 
@BuiltValue()
abstract class CreateShipmentRequestDto implements Built<CreateShipmentRequestDto, CreateShipmentRequestDtoBuilder> {
  @BuiltValueField(wireName: r'shipperId')
  int? get shipperId;

  @BuiltValueField(wireName: r'storeId')
  int? get storeId;

  @BuiltValueField(wireName: r'senderCityId')
  int? get senderCityId;

  @BuiltValueField(wireName: r'reciverCityId')
  int? get reciverCityId;

  @BuiltValueField(wireName: r'orderAmount')
  int? get orderAmount;

  @BuiltValueField(wireName: r'reciverName')
  String? get reciverName;

  @BuiltValueField(wireName: r'reciverAddress')
  String? get reciverAddress;

  @BuiltValueField(wireName: r'reciverPhone')
  int? get reciverPhone;

  @BuiltValueField(wireName: r'senderName')
  String? get senderName;

  @BuiltValueField(wireName: r'senderAddress')
  String? get senderAddress;

  @BuiltValueField(wireName: r'senderPhone')
  int? get senderPhone;

  @BuiltValueField(wireName: r'packageDescription')
  String? get packageDescription;

  @BuiltValueField(wireName: r'PackageDetails')
  PackageDetails? get packageDetails;

  CreateShipmentRequestDto._();

  factory CreateShipmentRequestDto([void updates(CreateShipmentRequestDtoBuilder b)]) = _$CreateShipmentRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateShipmentRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateShipmentRequestDto> get serializer => _$CreateShipmentRequestDtoSerializer();
}

class _$CreateShipmentRequestDtoSerializer implements PrimitiveSerializer<CreateShipmentRequestDto> {
  @override
  final Iterable<Type> types = const [CreateShipmentRequestDto, _$CreateShipmentRequestDto];

  @override
  final String wireName = r'CreateShipmentRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateShipmentRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.shipperId != null) {
      yield r'shipperId';
      yield serializers.serialize(
        object.shipperId,
        specifiedType: const FullType(int),
      );
    }
    if (object.storeId != null) {
      yield r'storeId';
      yield serializers.serialize(
        object.storeId,
        specifiedType: const FullType(int),
      );
    }
    if (object.senderCityId != null) {
      yield r'senderCityId';
      yield serializers.serialize(
        object.senderCityId,
        specifiedType: const FullType(int),
      );
    }
    if (object.reciverCityId != null) {
      yield r'reciverCityId';
      yield serializers.serialize(
        object.reciverCityId,
        specifiedType: const FullType(int),
      );
    }
    if (object.orderAmount != null) {
      yield r'orderAmount';
      yield serializers.serialize(
        object.orderAmount,
        specifiedType: const FullType(int),
      );
    }
    if (object.reciverName != null) {
      yield r'reciverName';
      yield serializers.serialize(
        object.reciverName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.reciverAddress != null) {
      yield r'reciverAddress';
      yield serializers.serialize(
        object.reciverAddress,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.reciverPhone != null) {
      yield r'reciverPhone';
      yield serializers.serialize(
        object.reciverPhone,
        specifiedType: const FullType(int),
      );
    }
    if (object.senderName != null) {
      yield r'senderName';
      yield serializers.serialize(
        object.senderName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.senderAddress != null) {
      yield r'senderAddress';
      yield serializers.serialize(
        object.senderAddress,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.senderPhone != null) {
      yield r'senderPhone';
      yield serializers.serialize(
        object.senderPhone,
        specifiedType: const FullType(int),
      );
    }
    if (object.packageDescription != null) {
      yield r'packageDescription';
      yield serializers.serialize(
        object.packageDescription,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.packageDetails != null) {
      yield r'PackageDetails';
      yield serializers.serialize(
        object.packageDetails,
        specifiedType: const FullType(PackageDetails),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateShipmentRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateShipmentRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'shipperId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.shipperId = valueDes;
          break;
        case r'storeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.storeId = valueDes;
          break;
        case r'senderCityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.senderCityId = valueDes;
          break;
        case r'reciverCityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.reciverCityId = valueDes;
          break;
        case r'orderAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.orderAmount = valueDes;
          break;
        case r'reciverName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reciverName = valueDes;
          break;
        case r'reciverAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reciverAddress = valueDes;
          break;
        case r'reciverPhone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.reciverPhone = valueDes;
          break;
        case r'senderName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.senderName = valueDes;
          break;
        case r'senderAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.senderAddress = valueDes;
          break;
        case r'senderPhone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.senderPhone = valueDes;
          break;
        case r'packageDescription':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.packageDescription = valueDes;
          break;
        case r'PackageDetails':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PackageDetails),
          ) as PackageDetails;
          result.packageDetails.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateShipmentRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateShipmentRequestDtoBuilder();
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

