import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/view_page/sub_features/profile/presentation/bloc/profile_bloc.dart';
import 'package:saayer/features/view_page/sub_features/profile/presentation/widgets/profile_cards_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const ProfileCardsWidget(),
            ),
            SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }
}
