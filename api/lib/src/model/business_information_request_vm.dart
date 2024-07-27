//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'business_information_request_vm.g.dart';

/// BusinessInformationRequestVM
///
/// Properties:
/// * [companyName] 
/// * [email] 
/// * [mobileNumber] 
/// * [commercialRegistrationNo] 
/// * [shortAddress] 
/// * [districtId] 
/// * [cityId] 
/// * [countryId] 
@BuiltValue()
abstract class BusinessInformationRequestVM implements Built<BusinessInformationRequestVM, BusinessInformationRequestVMBuilder> {
  @BuiltValueField(wireName: r'CompanyName')
  String? get companyName;

  @BuiltValueField(wireName: r'Email')
  String? get email;

  @BuiltValueField(wireName: r'MobileNumber')
  String? get mobileNumber;

  @BuiltValueField(wireName: r'CommercialRegistrationNo')
  String? get commercialRegistrationNo;

  @BuiltValueField(wireName: r'ShortAddress')
  String? get shortAddress;

  @BuiltValueField(wireName: r'DistrictId')
  int? get districtId;

  @BuiltValueField(wireName: r'CityId')
  int? get cityId;

  @BuiltValueField(wireName: r'CountryId')
  int? get countryId;

  BusinessInformationRequestVM._();

  factory BusinessInformationRequestVM([void updates(BusinessInformationRequestVMBuilder b)]) = _$BusinessInformationRequestVM;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BusinessInformationRequestVMBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BusinessInformationRequestVM> get serializer => _$BusinessInformationRequestVMSerializer();
}

class _$BusinessInformationRequestVMSerializer implements PrimitiveSerializer<BusinessInformationRequestVM> {
  @override
  final Iterable<Type> types = const [BusinessInformationRequestVM, _$BusinessInformationRequestVM];

  @override
  final String wireName = r'BusinessInformationRequestVM';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BusinessInformationRequestVM object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.companyName != null) {
      yield r'CompanyName';
      yield serializers.serialize(
        object.companyName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.email != null) {
      yield r'Email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.mobileNumber != null) {
      yield r'MobileNumber';
      yield serializers.serialize(
        object.mobileNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.commercialRegistrationNo != null) {
      yield r'CommercialRegistrationNo';
      yield serializers.serialize(
        object.commercialRegistrationNo,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.shortAddress != null) {
      yield r'ShortAddress';
      yield serializers.serialize(
        object.shortAddress,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.districtId != null) {
      yield r'DistrictId';
      yield serializers.serialize(
        object.districtId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.cityId != null) {
      yield r'CityId';
      yield serializers.serialize(
        object.cityId,
        specifiedType: const FullType(int),
      );
    }
    if (object.countryId != null) {
      yield r'CountryId';
      yield serializers.serialize(
        object.countryId,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BusinessInformationRequestVM object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BusinessInformationRequestVMBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'CompanyName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.companyName = valueDes;
          break;
        case r'Email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'MobileNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.mobileNumber = valueDes;
          break;
        case r'CommercialRegistrationNo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.commercialRegistrationNo = valueDes;
          break;
        case r'ShortAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.shortAddress = valueDes;
          break;
        case r'DistrictId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.districtId = valueDes;
          break;
        case r'CityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cityId = valueDes;
          break;
        case r'CountryId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.countryId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BusinessInformationRequestVM deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BusinessInformationRequestVMBuilder();
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

