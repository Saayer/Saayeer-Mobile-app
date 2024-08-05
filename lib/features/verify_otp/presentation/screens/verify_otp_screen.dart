import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/verify_otp/presentation/bloc/verify_otp_bloc.dart';
import 'package:saayer/features/verify_otp/presentation/pages/verify_otp_page.dart';

class VerifyOtpScreen extends StatelessWidget {
  final TokenRequestDto tokenRequestDto;

  const VerifyOtpScreen({super.key, required this.tokenRequestDto});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VerifyOtpBloc>(
        create: (context) => getIt<VerifyOtpBloc>()..add(InitVerifyOtpEvent(tokenRequestDto: tokenRequestDto)),
        child: const VerifyOtpPage());
  }
}
