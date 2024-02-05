import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart';
import 'package:saayer/features/user_info_view_page/presentation/pages/user_info_view_page_page.dart';

class UserInfoViewPageScreen extends StatelessWidget {
  final int initialPage;

  const UserInfoViewPageScreen({super.key, this.initialPage = 0});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocProvider<UserInfoViewPageBloc>(
        create: (context) => getIt<UserInfoViewPageBloc>()
          ..add(InitUserInfoViewPageEvent(currentPage: initialPage)),
        child: const UserInfoViewPagePage());
  }
}
