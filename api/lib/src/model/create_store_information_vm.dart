//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_store_information_vm.g.dart';

/// CreateStoreInformationVM
///
/// Properties:
/// * [name] 
/// * [url] 
/// * [maroofID] 
/// * [commercialRegistrationNo] 
/// * [storeImage] 
@BuiltValue()
abstract class CreateStoreInformationVM implements Built<CreateStoreInformationVM, CreateStoreInformationVMBuilder> {
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

  CreateStoreInformationVM._();

  factory CreateStoreInformationVM([void updates(CreateStoreInformationVMBuilder b)]) = _$CreateStoreInformationVM;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateStoreInformationVMBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateStoreInformationVM> get serializer => _$CreateStoreInformationVMSerializer();
}

class _$CreateStoreInformationVMSerializer implements PrimitiveSerializer<CreateStoreInformationVM> {
  @override
  final Iterable<Type> types = const [CreateStoreInformationVM, _$CreateStoreInformationVM];

  @override
  final String wireName = r'CreateStoreInformationVM';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateStoreInformationVM object, {
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
    CreateStoreInformationVM object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateStoreInformationVMBuilder result,
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
  CreateStoreInformationVM deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateStoreInformationVMBuilder();
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

