import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/more_sub_features/personal_info/presentation/screens/personal_info_screen.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/presentation/screens/stores_list_screen.dart';
import 'package:saayer/features/user_info_view_page/presentation/bloc/user_info_view_page_bloc.dart';
import 'package:saayer/features/user_info_view_page/presentation/widgets/linear_indicator.dart';
import 'package:saayer/features/user_info_view_page/sub_features/business_info/presentation/screens/business_info_screen.dart';

class UserInfoViewPagePage extends StatelessWidget {
  const UserInfoViewPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final UserInfoViewPageBloc userInfoViewPageBloc =
        BlocProvider.of<UserInfoViewPageBloc>(context);
    final List<Widget> pages = [
      const PersonalInfoScreen(),
      const BusinessInfoScreen(),
      const StoresListScreen()
    ];

    return BlocConsumer<UserInfoViewPageBloc, UserInfoViewPageState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading =
            (userInfoViewPageBloc.state.stateHelper.requestState ==
                RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            getIt<NavigationService>()
                .navigateAndFinishNamed(Routes.viewPageNamedPage);
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: true,
          child: Scaffold(
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
            appBar: const BaseAppBar(
              showBackLeading: false,
            ),
            body: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                  color: SaayerTheme().getColorsPalette.backgroundColor,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: List.generate(3, (index) {
                          final bool isPrevious = (state.currentPage > index);
                          final bool isCurrent = (state.currentPage == index);
                          return SizedBox(
                              width: width / 3,
                              child: LinearIndicator(
                                color: isPrevious
                                    ? (SaayerTheme()
                                        .getColorsPalette
                                        .superDarkOrangeColor)
                                    : isCurrent
                                        ? (SaayerTheme()
                                            .getColorsPalette
                                            .primaryColor)
                                        : (SaayerTheme()
                                            .getColorsPalette
                                            .greyColor),
                              ));
                        }),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Flexible(
                          fit: FlexFit.tight, child: pages[state.currentPage])
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
