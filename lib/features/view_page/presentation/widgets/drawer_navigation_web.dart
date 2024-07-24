import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ...List.generate(viewPageBloc.navBarIconEntityList.length, (index)=> ListTile(
                title: Text(
                  viewPageBloc.navBarIconEntityList[index].navBarIconType.name.tr(),
                  style: AppTextStyles.xSmallLabel(
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