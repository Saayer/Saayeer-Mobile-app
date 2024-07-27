//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'business_information_response_vm.g.dart';

/// BusinessInformationResponseVM
///
/// Properties:
/// * [companyName] 
/// * [email] 
/// * [mobileNumber] 
/// * [commercialRegistrationNo] 
/// * [shortAddress] 
/// * [district] 
/// * [city] 
/// * [country] 
@BuiltValue()
abstract class BusinessInformationResponseVM implements Built<BusinessInformationResponseVM, BusinessInformationResponseVMBuilder> {
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

  @BuiltValueField(wireName: r'District')
  String? get district;

  @BuiltValueField(wireName: r'City')
  String? get city;

  @BuiltValueField(wireName: r'Country')
  String? get country;

  BusinessInformationResponseVM._();

  factory BusinessInformationResponseVM([void updates(BusinessInformationResponseVMBuilder b)]) = _$BusinessInformationResponseVM;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BusinessInformationResponseVMBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BusinessInformationResponseVM> get serializer => _$BusinessInformationResponseVMSerializer();
}

class _$BusinessInformationResponseVMSerializer implements PrimitiveSerializer<BusinessInformationResponseVM> {
  @override
  final Iterable<Type> types = const [BusinessInformationResponseVM, _$BusinessInformationResponseVM];

  @override
  final String wireName = r'BusinessInformationResponseVM';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BusinessInformationResponseVM object, {
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
    if (object.district != null) {
      yield r'District';
      yield serializers.serialize(
        object.district,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.city != null) {
      yield r'City';
      yield serializers.serialize(
        object.city,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.country != null) {
      yield r'Country';
      yield serializers.serialize(
        object.country,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BusinessInformationResponseVM object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BusinessInformationResponseVMBuilder result,
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
        case r'District':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.district = valueDes;
          break;
        case r'City':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.city = valueDes;
          break;
        case r'Country':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.country = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BusinessInformationResponseVM deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BusinessInformationResponseVMBuilder();
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

