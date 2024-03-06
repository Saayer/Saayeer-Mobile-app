import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:saayer/features/notifications/presentation/pages/notifications_page.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final NotificationsBloc bloc = getIt<NotificationsBloc>();
        bloc.add(const InitNotifications());
        return bloc;
      },
      child: const NotificationsPage(),
    );
  }
}
