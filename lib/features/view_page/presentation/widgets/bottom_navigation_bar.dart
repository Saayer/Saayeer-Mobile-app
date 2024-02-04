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
          elevation: 10,
          color: SaayerTheme().getColorsPalette.lightGreyColor,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: viewPageBloc.navBarIconEntityList.map((navBarIconEntity) {
              final int index =
                  viewPageBloc.navBarIconEntityList.indexOf(navBarIconEntity);
              final bool isMiddle = (index == 2);
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: isMiddle ? 80.w : 0,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      if (navBarIconEntity.navBarIconType !=
                          NavBarIconTypes.REQUEST_SHIPMENT)
                        NavBarIconWidget(
                          navBarIconType: navBarIconEntity.navBarIconType,
                          onPressed: () {
                            viewPageBloc.add(GoToPage(
                                navBarIconType:
                                    navBarIconEntity.navBarIconType));
                          },
                          isSelected: navBarIconEntity.isSelected,
                        ),
                      Positioned(
                        top: 30.h,
                        child: Text(
                          navBarIconEntity.navBarIconType.name.tr(),
                          style: AppTextStyles.smallBoldLabel(),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      )
                    ],
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
