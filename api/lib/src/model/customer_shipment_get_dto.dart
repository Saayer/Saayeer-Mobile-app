//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'customer_shipment_get_dto.g.dart';

/// CustomerShipmentGetDto
///
/// Properties:
/// * [addressDetails] 
/// * [countryNameEn] 
/// * [countryNameAr] 
/// * [governorateNameEn] 
/// * [governorateNameAr] 
/// * [cityNameEn] 
/// * [cityNameAr] 
/// * [areaNameEn] 
/// * [areaNameAr] 
/// * [fullName] 
@BuiltValue()
abstract class CustomerShipmentGetDto implements Built<CustomerShipmentGetDto, CustomerShipmentGetDtoBuilder> {
  @BuiltValueField(wireName: r'addressDetails')
  String? get addressDetails;

  @BuiltValueField(wireName: r'countryName_en')
  String? get countryNameEn;

  @BuiltValueField(wireName: r'countryName_ar')
  String? get countryNameAr;

  @BuiltValueField(wireName: r'governorateName_en')
  String? get governorateNameEn;

  @BuiltValueField(wireName: r'governorateName_ar')
  String? get governorateNameAr;

  @BuiltValueField(wireName: r'cityName_en')
  String? get cityNameEn;

  @BuiltValueField(wireName: r'cityName_ar')
  String? get cityNameAr;

  @BuiltValueField(wireName: r'areaName_en')
  String? get areaNameEn;

  @BuiltValueField(wireName: r'areaName_ar')
  String? get areaNameAr;

  @BuiltValueField(wireName: r'fullName')
  String? get fullName;

  CustomerShipmentGetDto._();

  factory CustomerShipmentGetDto([void updates(CustomerShipmentGetDtoBuilder b)]) = _$CustomerShipmentGetDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CustomerShipmentGetDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CustomerShipmentGetDto> get serializer => _$CustomerShipmentGetDtoSerializer();
}

class _$CustomerShipmentGetDtoSerializer implements PrimitiveSerializer<CustomerShipmentGetDto> {
  @override
  final Iterable<Type> types = const [CustomerShipmentGetDto, _$CustomerShipmentGetDto];

  @override
  final String wireName = r'CustomerShipmentGetDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CustomerShipmentGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.addressDetails != null) {
      yield r'addressDetails';
      yield serializers.serialize(
        object.addressDetails,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.countryNameEn != null) {
      yield r'countryName_en';
      yield serializers.serialize(
        object.countryNameEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.countryNameAr != null) {
      yield r'countryName_ar';
      yield serializers.serialize(
        object.countryNameAr,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.governorateNameEn != null) {
      yield r'governorateName_en';
      yield serializers.serialize(
        object.governorateNameEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.governorateNameAr != null) {
      yield r'governorateName_ar';
      yield serializers.serialize(
        object.governorateNameAr,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.cityNameEn != null) {
      yield r'cityName_en';
      yield serializers.serialize(
        object.cityNameEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.cityNameAr != null) {
      yield r'cityName_ar';
      yield serializers.serialize(
        object.cityNameAr,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.areaNameEn != null) {
      yield r'areaName_en';
      yield serializers.serialize(
        object.areaNameEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.areaNameAr != null) {
      yield r'areaName_ar';
      yield serializers.serialize(
        object.areaNameAr,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.fullName != null) {
      yield r'fullName';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CustomerShipmentGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CustomerShipmentGetDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'addressDetails':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.addressDetails = valueDes;
          break;
        case r'countryName_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.countryNameEn = valueDes;
          break;
        case r'countryName_ar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.countryNameAr = valueDes;
          break;
        case r'governorateName_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.governorateNameEn = valueDes;
          break;
        case r'governorateName_ar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.governorateNameAr = valueDes;
          break;
        case r'cityName_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.cityNameEn = valueDes;
          break;
        case r'cityName_ar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.cityNameAr = valueDes;
          break;
        case r'areaName_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.areaNameEn = valueDes;
          break;
        case r'areaName_ar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.areaNameAr = valueDes;
          break;
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fullName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CustomerShipmentGetDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CustomerShipmentGetDtoBuilder();
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

