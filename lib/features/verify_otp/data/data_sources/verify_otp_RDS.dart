import 'package:saayer/features/verify_otp/data/models/verify_otp_response_model.dart';
import 'package:saayer/features/verify_otp/domain/entities/verify_otp_entity.dart';

abstract class VerifyOtpRDS {
  Future<VerifyOtpResponseModel> confirmLogIn(VerifyOtpEntity verifyOtpEntity);
}
