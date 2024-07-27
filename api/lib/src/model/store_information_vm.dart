//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'store_information_vm.g.dart';

/// StoreInformationVM
///
/// Properties:
/// * [name] 
/// * [url] 
/// * [maroofID] 
/// * [commercialRegistrationNo] 
/// * [storeImage] 
@BuiltValue()
abstract class StoreInformationVM implements Built<StoreInformationVM, StoreInformationVMBuilder> {
  @BuiltValueField(wireName: r'Name')
  String? get name;

  @BuiltValueField(wireName: r'Url')
  String? get url;

  @BuiltValueField(wireName: r'MaroofID')
  String? get maroofID;

  @BuiltValueField(wireName: r'CommercialRegistrationNo')
  String? get commercialRegistrationNo;

  @BuiltValueField(wireName: r'StoreImage')
  String? get storeImage;

  StoreInformationVM._();

  factory StoreInformationVM([void updates(StoreInformationVMBuilder b)]) = _$StoreInformationVM;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StoreInformationVMBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StoreInformationVM> get serializer => _$StoreInformationVMSerializer();
}

class _$StoreInformationVMSerializer implements PrimitiveSerializer<StoreInformationVM> {
  @override
  final Iterable<Type> types = const [StoreInformationVM, _$StoreInformationVM];

  @override
  final String wireName = r'StoreInformationVM';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StoreInformationVM object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'Name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.url != null) {
      yield r'Url';
      yield serializers.serialize(
        object.url,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.maroofID != null) {
      yield r'MaroofID';
      yield serializers.serialize(
        object.maroofID,
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
    if (object.storeImage != null) {
      yield r'StoreImage';
      yield serializers.serialize(
        object.storeImage,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    StoreInformationVM object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StoreInformationVMBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'Name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'Url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.url = valueDes;
          break;
        case r'MaroofID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.maroofID = valueDes;
          break;
        case r'CommercialRegistrationNo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.commercialRegistrationNo = valueDes;
          break;
        case r'StoreImage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.storeImage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StoreInformationVM deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StoreInformationVMBuilder();
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

