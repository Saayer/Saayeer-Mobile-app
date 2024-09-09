//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'store_get_dto.g.dart';

/// StoreGetDto
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
/// * [cityNameAr] 
/// * [areaNameEn] 
/// * [areaNameAr] 
/// * [storeId] 
/// * [name] 
/// * [financialRecordNumber] 
/// * [freelanceCertificateNumber] 
/// * [phoneNo] 
@BuiltValue()
abstract class StoreGetDto implements Built<StoreGetDto, StoreGetDtoBuilder> {
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

  @BuiltValueField(wireName: r'cityName_ar')
  String? get cityNameAr;

  @BuiltValueField(wireName: r'areaName_en')
  String? get areaNameEn;

  @BuiltValueField(wireName: r'areaName_ar')
  String? get areaNameAr;

  @BuiltValueField(wireName: r'storeId')
  int? get storeId;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'financialRecordNumber')
  String? get financialRecordNumber;

  @BuiltValueField(wireName: r'freelanceCertificateNumber')
  String? get freelanceCertificateNumber;

  @BuiltValueField(wireName: r'phoneNo')
  String? get phoneNo;

  StoreGetDto._();

  factory StoreGetDto([void updates(StoreGetDtoBuilder b)]) = _$StoreGetDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StoreGetDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StoreGetDto> get serializer => _$StoreGetDtoSerializer();
}

class _$StoreGetDtoSerializer implements PrimitiveSerializer<StoreGetDto> {
  @override
  final Iterable<Type> types = const [StoreGetDto, _$StoreGetDto];

  @override
  final String wireName = r'StoreGetDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StoreGetDto object, {
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
    if (object.storeId != null) {
      yield r'storeId';
      yield serializers.serialize(
        object.storeId,
        specifiedType: const FullType(int),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.financialRecordNumber != null) {
      yield r'financialRecordNumber';
      yield serializers.serialize(
        object.financialRecordNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.freelanceCertificateNumber != null) {
      yield r'freelanceCertificateNumber';
      yield serializers.serialize(
        object.freelanceCertificateNumber,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    StoreGetDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StoreGetDtoBuilder result,
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
        case r'storeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.storeId = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'financialRecordNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.financialRecordNumber = valueDes;
          break;
        case r'freelanceCertificateNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.freelanceCertificateNumber = valueDes;
          break;
        case r'phoneNo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phoneNo = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StoreGetDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StoreGetDtoBuilder();
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

