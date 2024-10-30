import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/bottom_sheet/log_in_bottom_sheet_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';

class SaayerFloatingActionButton extends StatelessWidget {
  const SaayerFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewPageBloc, ViewPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
            height: 65,
            width: 65,
            child: FittedBox(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                backgroundColor: SaayerTheme().getColorsPalette.primaryColor,
                elevation: 10,
                onPressed: () {
                  if (!(state.isGuest!)) {
                    getIt<NavigationService>().navigateToNamed(Routes.requestNewShipmentNamedPage);
                  } else {
                    getLogInBottomSheetWidget();
                  }
                },
                child: Image.asset(
                  Constants.getIconPath("ic_logo.png"),
                  width: 35,
                  height: 35,
                  color: SaayerTheme().getColorsPalette.whiteColor,
                ),
              ),
            ));
      },
    );
  }
}
