import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/presentation/pages/view_page_page.dart';

class ViewPageScreen extends StatelessWidget {
  final NavBarIconTypes navBarIconType;

  const ViewPageScreen({super.key, this.navBarIconType = NavBarIconTypes.HOME});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ViewPageBloc>()..add(GoToPage(navBarIconType: navBarIconType)),
      child: const ViewPagePage(),
    );
  }
}
