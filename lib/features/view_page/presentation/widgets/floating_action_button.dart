import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/label_txt.dart';
import 'package:saayer/core/utils/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';

class SaayerFloatingActionButton extends StatelessWidget {
  const SaayerFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);

    return BlocConsumer<ViewPageBloc, ViewPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
            height: 70.h,
            width: 70.w,
            child: FittedBox(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                backgroundColor: SaayerTheme().getColorsPalette.primaryColor,
                elevation: 10,
                onPressed: () {
                  viewPageBloc.add(const GoToPage(
                      navBarIconType: NavBarIconTypes.REQUEST_SHIPMENT));
                },
                child: Image.asset(
                  Constants.getIconPath("ic_logo.png"),
                  width: 35.w,
                  height: 35.h,
                  color: SaayerTheme().getColorsPalette.whiteColor,
                ),
              ),
            ));
      },
    );
  }
}
