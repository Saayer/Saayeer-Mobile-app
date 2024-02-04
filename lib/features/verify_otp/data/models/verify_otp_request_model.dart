import 'package:saayer/features/verify_otp/domain/entities/verify_otp_entity.dart';

class VerifyOtpRequestModel {
  final VerifyOtpEntity verifyOtpEntity;

  const VerifyOtpRequestModel({
    required this.verifyOtpEntity,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["MobileNumber"] = verifyOtpEntity.phoneNumber;
    map["OTP"] = verifyOtpEntity.otp;
    return map;
  }
}
