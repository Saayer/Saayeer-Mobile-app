//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'client_names_respnse.g.dart';

/// ClientNamesRespnse
///
/// Properties:
/// * [clientId] 
/// * [label] 
@BuiltValue()
abstract class ClientNamesRespnse implements Built<ClientNamesRespnse, ClientNamesRespnseBuilder> {
  @BuiltValueField(wireName: r'clientId')
  int? get clientId;

  @BuiltValueField(wireName: r'label')
  String? get label;

  ClientNamesRespnse._();

  factory ClientNamesRespnse([void updates(ClientNamesRespnseBuilder b)]) = _$ClientNamesRespnse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClientNamesRespnseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClientNamesRespnse> get serializer => _$ClientNamesRespnseSerializer();
}

class _$ClientNamesRespnseSerializer implements PrimitiveSerializer<ClientNamesRespnse> {
  @override
  final Iterable<Type> types = const [ClientNamesRespnse, _$ClientNamesRespnse];

  @override
  final String wireName = r'ClientNamesRespnse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClientNamesRespnse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.clientId != null) {
      yield r'clientId';
      yield serializers.serialize(
        object.clientId,
        specifiedType: const FullType(int),
      );
    }
    if (object.label != null) {
      yield r'label';
      yield serializers.serialize(
        object.label,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClientNamesRespnse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClientNamesRespnseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'clientId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.clientId = valueDes;
          break;
        case r'label':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.label = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClientNamesRespnse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClientNamesRespnseBuilder();
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

