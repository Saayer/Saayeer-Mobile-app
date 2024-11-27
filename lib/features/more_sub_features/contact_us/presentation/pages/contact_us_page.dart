import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/more_sub_features/contact_us/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/contact_us/presentation/bloc/contact_us_bloc.dart';
import 'package:saayer/features/more_sub_features/contact_us/presentation/widgets/contact_us_item_widget.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactUsBloc contactUsBloc = BlocProvider.of<ContactUsBloc>(context);
    return BlocConsumer<ContactUsBloc, ContactUsState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (contactUsBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        final Widget dividerWidget = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Divider(
            thickness: 0.5,
            color: SaayerTheme().getColorsPalette.greyColor,
          ),
        );
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          appBar: BaseAppBar(
            title: "contact_us".tr(),
            showBackLeading: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ContactUsTypes.values
                    .map((e) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              child: ContactUsItemWidget(
                                title: e.title,
                                description: e.description,
                                url: e.url,
                                clickable: e.clickable,
                                iconData: e.iconData,
                              ),
                            ),
                            dividerWidget
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
