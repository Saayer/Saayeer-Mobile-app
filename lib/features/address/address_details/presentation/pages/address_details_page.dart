import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/address/add_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_address/domain/entities/address_info_entity.dart';
import 'package:saayer/features/address/address_details/presentation/bloc/address_details_bloc.dart';

class AddressDetailsPage extends StatelessWidget {
  const AddressDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final AddressDetailsBloc addressDetailsBloc =
        BlocProvider.of<AddressDetailsBloc>(context);
    return BlocConsumer<AddressDetailsBloc, AddressDetailsState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState !=
              nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading =
            (state.stateHelper.requestState == RequestState.LOADING);
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
            title: state.addressInfoEntity?.name ?? "",
            showBackLeading: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.addressInfoEntity != null)
                    ...(_getAddressInfoMap(state.addressInfoEntity!)
                            .map((key, value) {
                              return MapEntry(
                                  key,
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.w, vertical: 8.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: SaayerTheme()
                                            .getColorsPalette
                                            .backgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        boxShadow: [
                                          BoxShadow(
                                            color: SaayerTheme()
                                                .getColorsPalette
                                                .greyColor
                                                .withOpacity(0.2),
                                            spreadRadius: 5,
                                            blurRadius: 10,
                                            offset: const Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w, vertical: 8.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              key.tr(),
                                              style: AppTextStyles.label(
                                                  SaayerTheme()
                                                      .getColorsPalette
                                                      .greyColor),
                                            ),
                                            Text(
                                              value.toString().isNotEmpty
                                                  ? value
                                                  : "_",
                                              style: AppTextStyles.paragraph(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            })
                            .values
                            .toList() ??
                        [])
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Map<String, String> _getAddressInfoMap(AddressInfoEntity addressInfoEntity) {
    final Map<String, String> map = {};
    for (AddAddressFieldsTypes addAddressFieldsType
        in AddAddressFieldsTypes.values) {
      switch (addAddressFieldsType) {
        case AddAddressFieldsTypes.NAME:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.name ?? "";
            break;
          }
        case AddAddressFieldsTypes.MOBILE:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.mobile ?? "";
            break;
          }
        case AddAddressFieldsTypes.EMAIL:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.email ?? "";
            break;
          }
        case AddAddressFieldsTypes.CITY:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.city ?? "";
            break;
          }
        case AddAddressFieldsTypes.DISTRICT:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.district ?? "";
            break;
          }
        case AddAddressFieldsTypes.ADDRESS:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.address ?? "";
            break;
          }
      }
    }
    return map;
  }
}
