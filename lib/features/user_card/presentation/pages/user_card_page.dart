import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/loading/loading_container.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/user_card/core/errors/user_card_error_handler.dart';
import 'package:saayer/features/user_card/presentation/bloc/user_card_bloc.dart';
import 'package:saayer/features/user_card/presentation/helper/user_card_helper.dart';
import 'package:saayer/features/user_info_view_page/presentation/screens/user_info_view_page_screen.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';

import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';

class UserCardPage extends StatelessWidget {
  final bool isParentLoading;
  final double horizontalPadding, verticalPadding;

  const UserCardPage(
      {super.key,
      required this.isParentLoading,
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
          final bool isLoading =
              (state.stateHelper.requestState == RequestState.LOADING);
          LoadingDialog.setIsLoading(context, isLoading || isParentLoading);
          if (!isLoading) {
            if (state.stateHelper.requestState == RequestState.SUCCESS) {}
            if (state.stateHelper.requestState == RequestState.ERROR) {
              //showToast(msg: state.stateHelper.errorMessage ?? "");
              UserCardErrorHandler(state: state)();
            }
          }
        },
        builder: (context, state) {
          final Decoration cardDecoration = UserCardHelper.getCardDecoration();
          final bool isLoading =
              (state.stateHelper.requestState == RequestState.LOADING);
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
          if (isLoading) {
            return const LoadingContainer();
          } else if (state.isGuest) {
            return UserCardHelper.buildGuestCardWidget(
                cardDecoration, horizontalPadding, verticalPadding, width);
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
                      const GoToPage(navBarIconType: NavBarIconTypes.ADDRESESS));
                }
              },
              child: Container(
                  decoration: cardDecoration,
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
                        trailing: UserCardHelper.buildTrailingWidget(
                            state,
                            isUncompletedProfile,
                            userCardInfoList,
                            numberOfDoneUserCardInfo)),
                  )),
            ),
          );
        });
  }
}
