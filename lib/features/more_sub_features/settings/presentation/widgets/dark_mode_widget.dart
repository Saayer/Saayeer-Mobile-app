import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/more_sub_features/settings/presentation/bloc/settings_bloc.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';

class DarkModeWidget extends StatelessWidget {
  const DarkModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return BlocConsumer<SettingsBloc, SettingsState>(
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
                settingsBloc.add(RefreshEvent());
              },
            ));
      },
    );
  }
}
