import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/core/utils/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';
import 'package:saayer/features/view_page/presentation/widgets/nav_bar_icon_widget.dart';

class ViewPagePage extends StatelessWidget {
  const ViewPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewPageBloc viewPageBloc = BlocProvider.of<ViewPageBloc>(context);
    return BlocConsumer<ViewPageBloc, ViewPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: SizedBox(
                height: 70.h,
                width: 70.w,
                child: FittedBox(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                    backgroundColor:
                        SaayerTheme().getColorsPalette.primaryColor,
                    elevation: 5,
                    onPressed: () {},
                    child: Image.asset(
                      Constants.getIconPath("ic_logo.png"),
                      width: 25.w,
                      height: 25.h,
                      color: SaayerTheme().getColorsPalette.backgroundColor,
                    ),
                  ),
                )),
            bottomNavigationBar: BottomAppBar(
              elevation: 5,
              color: SaayerTheme().getColorsPalette.lightGreyColor,
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    viewPageBloc.navBarIconEntityList.map((navBarIconEntity) {
                  final int index = viewPageBloc.navBarIconEntityList
                      .indexOf(navBarIconEntity);
                  final bool isMiddle = (index == 2);
                  return Row(
                    children: [
                      SizedBox(
                        width: isMiddle ? 80.w : 0,
                      ),
                      NavBarIconWidget(
                        navBarIconType: navBarIconEntity.navBarIconType,
                        onPressed: () {},
                        isSelected: navBarIconEntity.isSelected,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            body: Text(""));
      },
    );
  }
}
