import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/common/loading/loading_container.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/text_fields/phone_text_field.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/features/user_card/core/errors/user_card_error_handler.dart';
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart';
import 'package:saayer/features/user_card/presentation/widgets/circle_painter.dart';
import 'package:saayer/features/user_info_view_page/presentation/screens/user_info_view_page_screen.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'dart:ui' as ui;

import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';

class UserCardPage extends StatelessWidget {
  final double horizontalPadding, verticalPadding;

  const UserCardPage(
      {super.key,
      required this.horizontalPadding,
      required this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
    final UserCardBloc userCardBloc = BlocProvider.of<UserCardBloc>(context);

    return BlocConsumer<UserCardBloc, UserCardState>(
        buildWhen: (previousState, nextState) =>
            (previousState.stateHelper.requestState !=
                nextState.stateHelper.requestState),
        listener: (context, state) async {
          final bool isLoading = (userCardBloc.state.stateHelper.requestState ==
              RequestState.LOADING);
          LoadingDialog.setIsLoading(context, isLoading);
          if (!isLoading) {
            if (state.stateHelper.requestState == RequestState.SUCCESS) {}
            if (state.stateHelper.requestState == RequestState.ERROR) {
              //showToast(msg: state.stateHelper.errorMessage ?? "");
              UserCardErrorHandler(state: state)();
            }
          }
        },
        builder: (context, state) {
          final bool isLoading = (userCardBloc.state.stateHelper.requestState ==
              RequestState.LOADING);
          final bool isUncompletedProfile =
              (!(state.userCardEntity?.hasPersonalInformation ?? false) ||
                  !(state.userCardEntity?.hasBusinessInformation ?? false) ||
                  !(state.userCardEntity?.hasStoresInformation ?? false));
          final List userCardInfoList = [
            (state.userCardEntity?.hasPersonalInformation ?? false),
            (state.userCardEntity?.hasBusinessInformation ?? false),
            (state.userCardEntity?.hasStoresInformation ?? false)
          ];
          int numberOfDoneUserCardInfo = 0;
          for (bool userCardInfo in userCardInfoList) {
            if (userCardInfo) {
              numberOfDoneUserCardInfo++;
            }
          }
          if(isLoading){
            return const LoadingContainer();
          }
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (horizontalPadding).w,
                vertical: (verticalPadding).h),
            child: GestureDetector(
              onTap: () {
                if (isUncompletedProfile) {
                  getIt<NavigationService>().navigateTo(UserInfoViewPageScreen(
                    initialPage: numberOfDoneUserCardInfo,
                  ));
                } else {
                  viewPageBloc.add(
                      const GoToPage(navBarIconType: NavBarIconTypes.PROFILE));
                }
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: SaayerTheme()
                            .getColorsPalette
                            .greyColor
                            .withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                    //color: SaayerTheme().getColorsPalette.backgroundColor,
                    gradient: LinearGradient(
                        colors: [
                          SaayerTheme()
                              .getColorsPalette
                              .backgroundColor
                              .withOpacity(0.5),
                          SaayerTheme()
                              .getColorsPalette
                              .orangeColor
                              .withOpacity(0.3),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: const [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Text(
                            (state.userCardEntity?.hasPersonalInformation ??
                                    false)
                                ? ("${"hi".tr()}, ${state.userCardEntity?.personalInfoEntity?.name ?? ""}")
                                : "welcome_to_saayer".tr(),
                            style: AppTextStyles.boldLiteLabel(
                                SaayerTheme().getColorsPalette.darkOrangeColor),
                          ),
                        ),
                        subtitle: Text(
                          (isUncompletedProfile
                                  ? "user_info_progress"
                                  : "user_info_completed")
                              .tr(),
                          style: AppTextStyles.label(),
                        ),
                        trailing: _buildTrailingWidget(isUncompletedProfile,
                            userCardInfoList, numberOfDoneUserCardInfo)),
                  )),
            ),
          );
        });
  }

  Widget _buildTrailingWidget(bool isUncompletedProfile, List userCardInfoList,
      int numberOfDoneUserCardInfo) {
    if (!isUncompletedProfile) {
      return SvgPicture.asset(
        Constants.getIconPath("ic_hi.svg"),
        width: 50.w,
        height: 50.h,
        fit: BoxFit.cover,
      );
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: ui.Size(50.w, 50.h),
          painter: CirclePainter(
              startFraction: 0,
              endFraction: 1,
              strokeColor:
                  SaayerTheme().getColorsPalette.greyColor.withOpacity(0.5)),
        ),
        CustomPaint(
          size: ui.Size(50.w, 50.h),
          painter: CirclePainter(
              startFraction: 0,
              endFraction: numberOfDoneUserCardInfo / userCardInfoList.length,
              strokeColor: SaayerTheme().getColorsPalette.primaryColor),
        ),
        Text(
          "${((numberOfDoneUserCardInfo * 100) / userCardInfoList.length).roundToDouble().toInt()}%",
          style: AppTextStyles.smallBoldLabel(),
        )
      ],
    );
  }
}
