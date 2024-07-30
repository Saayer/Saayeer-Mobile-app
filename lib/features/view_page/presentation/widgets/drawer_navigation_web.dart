import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/presentation/widgets/nav_bar_icon_widget.dart';

class NavigationWebDrawer extends StatelessWidget {
  const NavigationWebDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
    return BlocConsumer<ViewPageBloc, ViewPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Drawer(
          shadowColor: SaayerTheme().getColorsPalette.darkGreyColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: SaayerTheme().getColorsPalette.backgroundColor,
                ),
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              Constants.getIconPath("ic_logo_text.png")))),
                ),
              ),
              ...List.generate(viewPageBloc.navBarIconEntityList.length, (index)=> ListTile(
                title: Text(
                  viewPageBloc.navBarIconEntityList[index].navBarIconType.name.tr(),
                  style: AppTextStyles.smallParagraph(
                      viewPageBloc.navBarIconEntityList[index].isSelected
                          ? SaayerTheme()
                          .getColorsPalette
                          .primaryColor
                          : SaayerTheme()
                          .getColorsPalette
                          .blackTextColor),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
                leading: NavBarIconWidget(
                  navBarIconType: viewPageBloc.navBarIconEntityList[index].navBarIconType,
                  onPressed: () {
                    viewPageBloc.add(GoToPage(
                        navBarIconType:
                        viewPageBloc.navBarIconEntityList[index].navBarIconType));
                  },
                  isSelected: viewPageBloc.navBarIconEntityList[index].isSelected,
                ),
                onTap: () {
                  viewPageBloc.add(GoToPage(
                      navBarIconType:
                      viewPageBloc.navBarIconEntityList[index].navBarIconType));
                },
              )),
            ],
          ),
        );
      },
    );
  }
}