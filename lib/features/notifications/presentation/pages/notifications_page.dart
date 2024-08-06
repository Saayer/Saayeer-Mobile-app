import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/empty/empty_status_widget.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_edit_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/notifications/domain/entities/notification_entity.dart';
import 'package:saayer/features/notifications/presentation/bloc/notifications_bloc.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final NotificationsBloc notificationsBloc =
        BlocProvider.of<NotificationsBloc>(context);
    return BlocConsumer<NotificationsBloc, NotificationsState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading =
            (state.stateHelper.requestState == RequestState.LOADING);
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
            title: "notifications".tr(),
            showBackLeading: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  if (state.notificationsList != null)
                    ...(_buildNotificationsListWidget(
                        state.notificationsList!)),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildNotificationsListWidget(
      List<NotificationEntity> notificationsList) {
    if (notificationsList.isEmpty) {
      const double size = 65;
      return [
        SizedBox(
          height: 16.h,
        ),
        Align(
          alignment: Alignment.center,
          child: EmptyStatusWidget(
            title: "empty_notifications_title".tr(),
            desc: "empty_notifications_desc".tr(),
            btnLabel: "",
            iconName: "",
            hasButton: false,
            iconWidget: Icon(
              Icons.notifications,
              color: SaayerTheme().getColorsPalette.blackTextColor,
              size: size.r,
            ),
            onBtnPressed: () {},
            size: size,
          ),
        )
      ];
    }
    return (notificationsList
        .map((e) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Container(
                decoration: BoxDecoration(
                  color: SaayerTheme().getColorsPalette.backgroundColor,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: SaayerTheme()
                          .getColorsPalette
                          .greyColor
                          .withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  leading: Icon(
                    Icons.notifications,
                    color: SaayerTheme().getColorsPalette.blackTextColor,
                    size: 35.r,
                  ),
                  // leading: SvgPicture.asset(
                  //   Constants.getIconPath(
                  //       "ic_notification.svg"),
                  //   height: 30.h,
                  //   width: 30.w,
                  //   fit: BoxFit.cover,
                  // ),
                  title: Text(
                    e.title,
                    style: AppTextStyles.boldLabel(),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        e.description,
                        softWrap: true,
                        style: AppTextStyles.smallParagraph(
                            SaayerTheme().getColorsPalette.greyColor),
                      ),
                    ],
                  ),
                  trailing: Text(
                    e.date,
                    style: AppTextStyles.microLabel(
                        SaayerTheme().getColorsPalette.greyColor),
                  ),
                ),
              ),
            ))
        .toList());
  }
}
