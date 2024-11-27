import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/more_sub_features/settings/presentation/bloc/settings_bloc.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "language".tr(),
                style: AppTextStyles.hintButtonLabel(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: ["english", "arabic"].map(
                (e) {
                  final bool isEnabled = ((e == "english")
                      ? Localization.isEnglish()
                      : Localization.isArabic());
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: SaayerDefaultTextButton(
                      text: e,
                      isEnabled: isEnabled,
                      borderRadius: 12,
                      onPressed: () {
                        final Locale locale = ((e == "english")
                            ? Localization.usEnglish
                            : Localization.egArabic);
                        Localization.setLocale(locale);
                        settingsBloc.add(RefreshEvent());
                      },
                      btnWidth: width / 3.5,
                      btnHeight: 30,
                      textStyle: AppTextStyles.smallParagraph(
                          SaayerTheme().getColorsPalette.whiteColor),
                    ),
                  );
                },
              ).toList(),
            )
          ],
        );
      },
    );
  }
}
