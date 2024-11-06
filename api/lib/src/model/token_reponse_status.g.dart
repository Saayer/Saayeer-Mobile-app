// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_reponse_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TokenReponseStatus _$success = const TokenReponseStatus._('success');
const TokenReponseStatus _$invalidOTPCode =
    const TokenReponseStatus._('invalidOTPCode');
const TokenReponseStatus _$phoneNumberNotRegistered =
    const TokenReponseStatus._('phoneNumberNotRegistered');

TokenReponseStatus _$valueOf(String name) {
  switch (name) {
    case 'success':
      return _$success;
    case 'invalidOTPCode':
      return _$invalidOTPCode;
    case 'phoneNumberNotRegistered':
      return _$phoneNumberNotRegistered;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TokenReponseStatus> _$values =
    new BuiltSet<TokenReponseStatus>(const <TokenReponseStatus>[
  _$success,
  _$invalidOTPCode,
  _$phoneNumberNotRegistered,
]);

class _$TokenReponseStatusMeta {
  const _$TokenReponseStatusMeta();
  TokenReponseStatus get success => _$success;
  TokenReponseStatus get invalidOTPCode => _$invalidOTPCode;
  TokenReponseStatus get phoneNumberNotRegistered => _$phoneNumberNotRegistered;
  TokenReponseStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<TokenReponseStatus> get values => _$values;
}

abstract class _$TokenReponseStatusMixin {
  // ignore: non_constant_identifier_names
  _$TokenReponseStatusMeta get TokenReponseStatus =>
      const _$TokenReponseStatusMeta();
}

Serializer<TokenReponseStatus> _$tokenReponseStatusSerializer =
    new _$TokenReponseStatusSerializer();

class _$TokenReponseStatusSerializer
    implements PrimitiveSerializer<TokenReponseStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'success': 'Success',
    'invalidOTPCode': 'Invalid_OTP_Code',
    'phoneNumberNotRegistered': 'PhoneNumber_Not_Registered',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Success': 'success',
    'Invalid_OTP_Code': 'invalidOTPCode',
    'PhoneNumber_Not_Registered': 'phoneNumberNotRegistered',
  };

  @override
  final Iterable<Type> types = const <Type>[TokenReponseStatus];
  @override
  final String wireName = 'TokenReponseStatus';

  @override
  Object serialize(Serializers serializers, TokenReponseStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  TokenReponseStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TokenReponseStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
