//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'customer_get_dto.g.dart';

/// CustomerGetDto
///
/// Properties:
/// * [addressDetails] 
/// * [zipcode] 
/// * [countryId] 
/// * [governorateId] 
/// * [cityId] 
/// * [areaId] 
/// * [citySplId] 
/// * [countryNameEn] 
/// * [countryNameAr] 
/// * [countryCode] 
/// * [governorateNameEn] 
/// * [governorateNameAr] 
/// * [cityNameEn] 
/// * [cityAramexName] 
/// * [cityNameAr] 
/// * [areaNameEn] 
/// * [areaNameAr] 
/// * [customerId] 
/// * [fullName] 
/// * [phoneNo] 
/// * [email] 
/// * [phoneNo2] 
/// * [totalShipments] 
/// * [lastShipmentDate] 
/// * [totalPaid] 
/// * [totalGain] 
@BuiltValue()
abstract class CustomerGetDto implements Built<CustomerGetDto, CustomerGetDtoBuilder> {
  @BuiltValueField(wireName: r'addressDetails')
  String? get addressDetails;

  @BuiltValueField(wireName: r'zipcode')
  String? get zipcode;

  @BuiltValueField(wireName: r'countryId')
  int? get countryId;

  @BuiltValueField(wireName: r'governorateId')
  int? get governorateId;

  @BuiltValueField(wireName: r'cityId')
  int? get cityId;

  @BuiltValueField(wireName: r'areaId')
  int? get areaId;

  @BuiltValueField(wireName: r'citySplId')
  String? get citySplId;

  @BuiltValueField(wireName: r'countryName_en')
  String? get countryNameEn;

  @BuiltValueField(wireName: r'countryName_ar')
  String? get countryNameAr;

  @BuiltValueField(wireName: r'countryCode')
  String? get countryCode;

  @BuiltValueField(wireName: r'governorateName_en')
  String? get governorateNameEn;

  @BuiltValueField(wireName: r'governorateName_ar')
  String? get governorateNameAr;

  @BuiltValueField(wireName: r'cityName_en')
  String? get cityNameEn;

  @BuiltValueField(wireName: r'cityAramexName')
  String? get cityAramexName;

  @BuiltValueField(wireName: r'cityName_ar')
  String? get cityNameAr;

  @BuiltValueField(wireName: r'areaName_en')
  String? get areaNameEn;

  @BuiltValueField(wireName: r'areaName_ar')
  String? get areaNameAr;

  @BuiltValueField(wireName: r'customerId')
  int? get customerId;

  @BuiltValueField(wireName: r'fullName')
  String? get fullName;

  @BuiltValueField(wireName: r'phoneNo')
  String? get phoneNo;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'phoneNo2')
  String? get phoneNo2;

  @BuiltValueField(wireName: r'totalShipments')
  int? get totalShipments;

  @BuiltValueField(wireName: r'lastShipmentDate')
  DateTime? get lastShipmentDate;

  @BuiltValueField(wireName: r'totalPaid')
  double? get totalPaid;

  @BuiltValueField(wireName: r'totalGain')
  double? get totalGain;

  CustomerGetDto._();

  factory CustomerGetDto([void updates(CustomerGetDtoBuilder b)]) = _$CustomerGetDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CustomerGetDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CustomerGetDto> get serializer => _$CustomerGetDtoSerializer();
}

class _$CustomerGetDtoSerializer implements PrimitiveSerializer<CustomerGetDto> {
  @override
  final Iterable<Type> types = const [CustomerGetDto, _$CustomerGetDto];

  @override
  final String wireName = r'CustomerGetDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CustomerGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.addressDetails != null) {
      yield r'addressDetails';
      yield serializers.serialize(
        object.addressDetails,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.zipcode != null) {
      yield r'zipcode';
      yield serializers.serialize(
        object.zipcode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.countryId != null) {
      yield r'countryId';
      yield serializers.serialize(
        object.countryId,
        specifiedType: const FullType(int),
      );
    }
    if (object.governorateId != null) {
      yield r'governorateId';
      yield serializers.serialize(
        object.governorateId,
        specifiedType: const FullType(int),
      );
    }
    if (object.cityId != null) {
      yield r'cityId';
      yield serializers.serialize(
        object.cityId,
        specifiedType: const FullType(int),
      );
    }
    if (object.areaId != null) {
      yield r'areaId';
      yield serializers.serialize(
        object.areaId,
        specifiedType: const FullType(int),
      );
    }
    if (object.citySplId != null) {
      yield r'citySplId';
      yield serializers.serialize(
        object.citySplId,
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
    if (object.countryCode != null) {
      yield r'countryCode';
      yield serializers.serialize(
        object.countryCode,
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
    if (object.cityAramexName != null) {
      yield r'cityAramexName';
      yield serializers.serialize(
        object.cityAramexName,
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
    if (object.customerId != null) {
      yield r'customerId';
      yield serializers.serialize(
        object.customerId,
        specifiedType: const FullType(int),
      );
    }
    if (object.fullName != null) {
      yield r'fullName';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.phoneNo != null) {
      yield r'phoneNo';
      yield serializers.serialize(
        object.phoneNo,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.phoneNo2 != null) {
      yield r'phoneNo2';
      yield serializers.serialize(
        object.phoneNo2,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.totalShipments != null) {
      yield r'totalShipments';
      yield serializers.serialize(
        object.totalShipments,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.lastShipmentDate != null) {
      yield r'lastShipmentDate';
      yield serializers.serialize(
        object.lastShipmentDate,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.totalPaid != null) {
      yield r'totalPaid';
      yield serializers.serialize(
        object.totalPaid,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.totalGain != null) {
      yield r'totalGain';
      yield serializers.serialize(
        object.totalGain,
        specifiedType: const FullType.nullable(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CustomerGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CustomerGetDtoBuilder result,
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
        case r'zipcode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.zipcode = valueDes;
          break;
        case r'countryId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.countryId = valueDes;
          break;
        case r'governorateId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.governorateId = valueDes;
          break;
        case r'cityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cityId = valueDes;
          break;
        case r'areaId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.areaId = valueDes;
          break;
        case r'citySplId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.citySplId = valueDes;
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
        case r'countryCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.countryCode = valueDes;
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
        case r'cityAramexName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.cityAramexName = valueDes;
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
        case r'customerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.customerId = valueDes;
          break;
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fullName = valueDes;
          break;
        case r'phoneNo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phoneNo = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'phoneNo2':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phoneNo2 = valueDes;
          break;
        case r'totalShipments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalShipments = valueDes;
          break;
        case r'lastShipmentDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.lastShipmentDate = valueDes;
          break;
        case r'totalPaid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.totalPaid = valueDes;
          break;
        case r'totalGain':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.totalGain = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CustomerGetDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CustomerGetDtoBuilder();
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

