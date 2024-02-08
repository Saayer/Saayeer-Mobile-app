import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/screens/view_page_screen.dart';
import 'package:saayer/features/view_page/sub_features/more/presentation/bloc/more_bloc.dart';

class DarkModeWidget extends StatelessWidget {
  const DarkModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MoreBloc moreBloc = BlocProvider.of<MoreBloc>(context);
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return CupertinoListTile(
            title: Text(
              "dark_mode".tr(),
              style: AppTextStyles.hintButtonLabel(),
            ),
            trailing: CupertinoSwitch(
              value: SaayerTheme().isDarkThemeMode,
              thumbColor: SaayerTheme().getColorsPalette.backgroundColor,
              activeColor: SaayerTheme().getColorsPalette.primaryColor,
              onChanged: (value) {
                SaayerTheme().setThemeMode();
                moreBloc.add(RefreshEvent());
                getIt<NavigationService>().navigateAndReplacement(
                    const ViewPageScreen(
                      navBarIconType: NavBarIconTypes.MORE,
                    ),
                    isAnimated: true);
              },
            ));
      },
    );
  }
}
