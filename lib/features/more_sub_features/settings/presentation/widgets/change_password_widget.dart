import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/more_sub_features/settings/presentation/bloc/settings_bloc.dart';

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListTile(
          minLeadingWidth: 5,
          horizontalTitleGap: 10,
          onTap: () {},
          title: Text(
            "change_password".tr(),
            style: AppTextStyles.liteLabel(),
          ),
          trailing: Text(
            "******".tr(),
            style: AppTextStyles.sectionTitle(),
          ),
        );
      },
    );
  }
}
