import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart';
import 'package:saayer/features/more_sub_features/addresses_book/presentation/widgets/empty_addresses_book.dart';

class AddressesBookPage extends StatelessWidget {
  const AddressesBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final AddressesBookBloc addressesBookBloc = BlocProvider.of<AddressesBookBloc>(context);
    return BlocConsumer<AddressesBookBloc, AddressesBookState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (addressesBookBloc.state.stateHelper.requestState ==
            RequestState.LOADING);
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
            title: "addresses_book".tr(),
            showBackLeading: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: const SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  EmptyAddressesBook()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
