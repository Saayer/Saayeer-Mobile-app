import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/entities/user_utils.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/domain/entities/nav_bar_icon_entity.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/presentation/widgets/nav_bar_icon_widget.dart';

class SideMenuNavigationWeb extends StatelessWidget {
  final NavBarIconEntity selectedNavBarIcon;

  const SideMenuNavigationWeb({super.key, required this.selectedNavBarIcon});

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
    List<NavBarIconEntity> navBarList =
        UserUtils.isAdmin() ? viewPageBloc.adminNavBarList : viewPageBloc.navBarIconEntityList;
    return BlocConsumer<ViewPageBloc, ViewPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return NavigationRail(
            selectedIndex: selectedNavBarIcon.index,
            extended: largerThanTablet(context) ? true : false,
            backgroundColor: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.1),
            onDestinationSelected: (index) {
              if (navBarList[index].navBarIconType == NavBarIconTypes.SHIPMENTS) {
                viewPageBloc.add(const SetShipmentsFiltersValue(
                  initExportShipmentStatusFilter: null,
                  exportShipmentDateFrom: null,
                  exportShipmentDateTo: null,
                ));
              }
              viewPageBloc.add(GoToPage(navBarIconType: navBarList[index].navBarIconType));
            },
            leading: Container(
              width: 100,
              height: 60,
              decoration:
                  BoxDecoration(image: DecorationImage(image: AssetImage(Constants.getIconPath("ic_logo.png")))),
            ),
            indicatorColor: SaayerTheme().getColorsPalette.transparent,
            destinations: [
              ...List.generate(
                  navBarList.length,
                  (index) => NavigationRailDestination(
                      icon: NavBarIconWidget(
                        navBarIconType: navBarList[index].navBarIconType,
                        onPressed: () {
                          if (navBarList[index].navBarIconType == NavBarIconTypes.SHIPMENTS) {
                            viewPageBloc.add(const SetShipmentsFiltersValue(
                              initExportShipmentStatusFilter: null,
                              exportShipmentDateFrom: null,
                              exportShipmentDateTo: null,
                            ));
                          }
                          viewPageBloc.add(GoToPage(navBarIconType: navBarList[index].navBarIconType));
                        },
                        isSelected: navBarList[index].isSelected,
                      ),
                      label: Text(
                        navBarList[index].navBarIconType.name.tr(),
                        style: AppTextStyles.smallParagraph(navBarList[index].isSelected
                            ? SaayerTheme().getColorsPalette.primaryColor
                            : SaayerTheme().getColorsPalette.blackTextColor),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      )))
            ],
          );
        });
  }
}
