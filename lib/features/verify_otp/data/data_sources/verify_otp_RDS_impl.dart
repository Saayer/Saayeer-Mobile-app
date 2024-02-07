import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/API/api_consumer.dart';
import 'package:saayer/core/API/end_points/end_points/auth_end_points.dart';
import 'package:saayer/features/verify_otp/data/data_sources/verify_otp_RDS.dart';
import 'package:saayer/features/verify_otp/data/models/verify_otp_request_model.dart';
import 'package:saayer/features/verify_otp/data/models/verify_otp_response_model.dart';
import 'package:saayer/features/verify_otp/domain/entities/verify_otp_entity.dart';

@Injectable(as: VerifyOtpRDS)
class VerifyOtpRDSImpl implements VerifyOtpRDS {
  final ApiConsumer apiConsumer;

  VerifyOtpRDSImpl({required this.apiConsumer});

  @override
  Future<VerifyOtpResponseModel> confirmLogIn(
      VerifyOtpEntity verifyOtpEntity) async {
    final VerifyOtpRequestModel verifyOtpRequestModel =
        VerifyOtpRequestModel(verifyOtpEntity: verifyOtpEntity);
    Map<String, dynamic> result = Map<String, dynamic>.from(
      await apiConsumer.post(AuthEndPoints.confirmLogin,
          body: verifyOtpRequestModel.toJson()),
    );
    final VerifyOtpResponseModel verifyOtpResponseModel =
        VerifyOtpResponseModel.fromJson(result);
    return verifyOtpResponseModel;
  }
}
