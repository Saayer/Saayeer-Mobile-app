//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'store_add_dto.g.dart';

/// StoreAddDto
///
/// Properties:
/// * [addressDetails] 
/// * [zipcode] 
/// * [countryId] 
/// * [governorateId] 
/// * [cityId] 
/// * [areaId] 
/// * [storeId] 
/// * [name] 
/// * [financialRecordNumber] 
/// * [freelanceCertificateNumber] 
/// * [phoneNo] 
@BuiltValue()
abstract class StoreAddDto implements Built<StoreAddDto, StoreAddDtoBuilder> {
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

  StoreAddDto._();

  factory StoreAddDto([void updates(StoreAddDtoBuilder b)]) = _$StoreAddDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StoreAddDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StoreAddDto> get serializer => _$StoreAddDtoSerializer();
}

class _$StoreAddDtoSerializer implements PrimitiveSerializer<StoreAddDto> {
  @override
  final Iterable<Type> types = const [StoreAddDto, _$StoreAddDto];

  @override
  final String wireName = r'StoreAddDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StoreAddDto object, {
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
    if (object.storeId != null) {
      yield r'storeId';
      yield serializers.serialize(
        object.storeId,
        specifiedType: const FullType.nullable(int),
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
    StoreAddDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StoreAddDtoBuilder result,
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
        case r'storeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
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
  StoreAddDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StoreAddDtoBuilder();
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

