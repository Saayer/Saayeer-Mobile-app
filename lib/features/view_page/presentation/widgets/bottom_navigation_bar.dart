import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/presentation/widgets/nav_bar_icon_widget.dart';

class SaayerBottomNavigationBar extends StatelessWidget {
  const SaayerBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
    return BlocConsumer<ViewPageBloc, ViewPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BottomAppBar(
          height: 80.h,
          elevation: 2,
          //alignment: Alignment.topCenter,
          color: SaayerTheme().getColorsPalette.backgroundColor,
          shadowColor: SaayerTheme().getColorsPalette.darkGreyColor,
          shape: const CircularNotchedRectangle(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    viewPageBloc.navBarIconEntityList.map((navBarIconEntity) {
                  final int index = viewPageBloc.navBarIconEntityList
                      .indexOf(navBarIconEntity);
                  final bool isMiddle = (index == 2);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: isMiddle ? 20.w : 0,
                      ),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          SizedBox(
                            height: 80.h,
                            width: 60.w,
                          ),
                          if (navBarIconEntity.navBarIconType !=
                              NavBarIconTypes.REQUEST_SHIPMENT)
                            Positioned(
                              top: 0.h,
                              child: NavBarIconWidget(
                                navBarIconType: navBarIconEntity.navBarIconType,
                                onPressed: () {
                                  viewPageBloc.add(GoToPage(
                                      navBarIconType:
                                          navBarIconEntity.navBarIconType));
                                },
                                isSelected: navBarIconEntity.isSelected,
                              ),
                            ),
                          if (navBarIconEntity.navBarIconType !=
                              NavBarIconTypes.REQUEST_SHIPMENT)
                            Positioned(
                              top: 35.h,
                              child: SizedBox(
                                width: 60.w,
                                child: Text(
                                  navBarIconEntity.navBarIconType.name.tr(),
                                  style: AppTextStyles.xSmallLabel(
                                      navBarIconEntity.isSelected
                                          ? SaayerTheme()
                                              .getColorsPalette
                                              .primaryColor
                                          : SaayerTheme()
                                              .getColorsPalette
                                              .blackTextColor),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              ),
                            )
                        ],
                      ),
                    ],
                  );
                }).toList(),
              ),
              Positioned(
                top: 35.h,
                child: SizedBox(
                  width: 60.w,
                  child: Text(
                    NavBarIconTypes.REQUEST_SHIPMENT.name.tr(),
                    style: AppTextStyles.xSmallLabel(viewPageBloc
                            .navBarIconEntityList
                            .firstWhere((element) =>
                                element.navBarIconType ==
                                NavBarIconTypes.REQUEST_SHIPMENT)
                            .isSelected
                        ? SaayerTheme().getColorsPalette.primaryColor
                        : SaayerTheme().getColorsPalette.blackTextColor),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
