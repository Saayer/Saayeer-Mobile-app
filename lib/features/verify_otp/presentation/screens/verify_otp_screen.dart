import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/verify_otp/domain/entities/verify_otp_entity.dart';
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart';
import 'package:saayer/features/verify_otp/presentation/pages/verify_otp_page.dart';

class VerifyOtpScreen extends StatelessWidget {
  final VerifyOtpEntity verifyOtpEntity;

  const VerifyOtpScreen({super.key, required this.verifyOtpEntity});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocProvider<VerifyOtpBloc>(
        create: (context) => getIt<VerifyOtpBloc>()
          ..add(InitVerifyOtpEvent(verifyOtpEntity: verifyOtpEntity)),
        child: const VerifyOtpPage());
  }
}
