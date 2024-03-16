import 'dart:developer';
import 'dart:ffi';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/profile_sub_features/info/presentation/bloc/info_bloc.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final InfoBloc infoBloc = BlocProvider.of<InfoBloc>(context);
    return BlocConsumer<InfoBloc, InfoState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading =
            (infoBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        final Widget dividerWidget = Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Divider(
            thickness: 0.5,
            color: SaayerTheme().getColorsPalette.greyColor,
          ),
        );
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          appBar: BaseAppBar(
            title: state.infoEntity?.infoType.name ?? "",
            showBackLeading: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.infoEntity != null)
                    Hero(
                      tag: "${state.infoEntity!.infoType.name}HeroTag",
                      child: SvgPicture.asset(
                        Constants.getImagePath(
                            "${state.infoEntity?.infoType.name}.svg"),
                        height: 100.h,
                        width: 100.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ...(state.infoEntity?.fields
                          .map((key, value) {
                            return MapEntry(
                                key,
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 8.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: SaayerTheme()
                                          .getColorsPalette
                                          .backgroundColor,
                                      borderRadius: BorderRadius.circular(16.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: SaayerTheme()
                                              .getColorsPalette
                                              .greyColor
                                              .withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 10,
                                          offset: const Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w, vertical: 8.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            key.tr(),
                                            style: AppTextStyles.label(
                                                SaayerTheme()
                                                    .getColorsPalette
                                                    .greyColor),
                                          ),
                                          Text(
                                            value.toString().isNotEmpty
                                                ? value
                                                : "_",
                                            style: AppTextStyles.paragraph(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          })
                          .values
                          .toList() ??
                      [])
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
