import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/address/add_address/presentation/screens/add_address_screen.dart';
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart';
import 'package:saayer/features/more_sub_features/addresses_book/presentation/widgets/address_item_widget.dart';
import 'package:saayer/features/more_sub_features/addresses_book/presentation/widgets/empty_addresses_book.dart';

class AddressesBookPage extends StatelessWidget {
  const AddressesBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final AddressesBookBloc addressesBookBloc =
        BlocProvider.of<AddressesBookBloc>(context);
    return BlocConsumer<AddressesBookBloc, AddressesBookState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading =
            (addressesBookBloc.state.stateHelper.requestState ==
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
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (state.addresses != null)
                            _buildAddressesListWidget(state.addresses!)
                        ],
                      ),
                    ),
                  ),
                  SaayerDefaultTextButton(
                    text: 'add_address'.tr(),
                    isEnabled: true,
                    borderRadius: 16.r,
                    onPressed: () {
                      getIt<NavigationService>()
                          .navigateTo(const AddAddressScreen(), onBack: (_) {
                        addressesBookBloc.add(const GetAddresses());
                      });
                    },
                    btnWidth: width / 1.008,
                    btnHeight: 50.h,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
        );
      },
    );
  }

  Widget _buildAddressesListWidget(List<AddressInfoEntity> addresses) {
    if (addresses.isEmpty) {
      return const EmptyAddressesBook();
    }
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: AddressItemWidget(
              addressInfoEntity: addresses[index],
            ),
          );
        });
  }
}
