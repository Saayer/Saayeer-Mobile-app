import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/contact_us/presentation/bloc/contact_us_bloc.dart';
import 'package:saayer/features/more_sub_features/contact_us/presentation/pages/contact_us_page.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ContactUsBloc>(),
      child: const ContactUsPage(),
    );
  }
}
