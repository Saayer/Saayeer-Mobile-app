//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/cost_response_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cost_response_dto_list_api_response_model.g.dart';

/// CostResponseDtoListApiResponseModel
///
/// Properties:
/// * [success] 
/// * [data] 
/// * [errorMessage] 
/// * [reqSecureKey] 
@BuiltValue()
abstract class CostResponseDtoListApiResponseModel implements Built<CostResponseDtoListApiResponseModel, CostResponseDtoListApiResponseModelBuilder> {
  @BuiltValueField(wireName: r'Success')
  bool? get success;

  @BuiltValueField(wireName: r'Data')
  BuiltList<CostResponseDto>? get data;

  @BuiltValueField(wireName: r'ErrorMessage')
  String? get errorMessage;

  @BuiltValueField(wireName: r'ReqSecureKey')
  String? get reqSecureKey;

  CostResponseDtoListApiResponseModel._();

  factory CostResponseDtoListApiResponseModel([void updates(CostResponseDtoListApiResponseModelBuilder b)]) = _$CostResponseDtoListApiResponseModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CostResponseDtoListApiResponseModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CostResponseDtoListApiResponseModel> get serializer => _$CostResponseDtoListApiResponseModelSerializer();
}

class _$CostResponseDtoListApiResponseModelSerializer implements PrimitiveSerializer<CostResponseDtoListApiResponseModel> {
  @override
  final Iterable<Type> types = const [CostResponseDtoListApiResponseModel, _$CostResponseDtoListApiResponseModel];

  @override
  final String wireName = r'CostResponseDtoListApiResponseModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CostResponseDtoListApiResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.success != null) {
      yield r'Success';
      yield serializers.serialize(
        object.success,
        specifiedType: const FullType(bool),
      );
    }
    if (object.data != null) {
      yield r'Data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType.nullable(BuiltList, [FullType(CostResponseDto)]),
      );
    }
    if (object.errorMessage != null) {
      yield r'ErrorMessage';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.reqSecureKey != null) {
      yield r'ReqSecureKey';
      yield serializers.serialize(
        object.reqSecureKey,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CostResponseDtoListApiResponseModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CostResponseDtoListApiResponseModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'Success':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.success = valueDes;
          break;
        case r'Data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CostResponseDto)]),
          ) as BuiltList<CostResponseDto>?;
          if (valueDes == null) continue;
          result.data.replace(valueDes);
          break;
        case r'ErrorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
          break;
        case r'ReqSecureKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reqSecureKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CostResponseDtoListApiResponseModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CostResponseDtoListApiResponseModelBuilder();
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

