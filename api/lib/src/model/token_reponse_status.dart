//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'token_reponse_status.g.dart';

class TokenReponseStatus extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Success')
  static const TokenReponseStatus success = _$success;
  @BuiltValueEnumConst(wireName: r'Invalid_OTP_Code')
  static const TokenReponseStatus invalidOTPCode = _$invalidOTPCode;
  @BuiltValueEnumConst(wireName: r'PhoneNumber_Not_Registered')
  static const TokenReponseStatus phoneNumberNotRegistered = _$phoneNumberNotRegistered;

  static Serializer<TokenReponseStatus> get serializer => _$tokenReponseStatusSerializer;

  const TokenReponseStatus._(String name): super(name);

  static BuiltSet<TokenReponseStatus> get values => _$values;
  static TokenReponseStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class TokenReponseStatusMixin = Object with _$TokenReponseStatusMixin;

