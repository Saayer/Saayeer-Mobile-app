import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/address_details/presentation/bloc/address_details_bloc.dart';

class AddressDetailsPage extends StatelessWidget {
  const AddressDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocConsumer<AddressDetailsBloc, AddressDetailsState>(
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
          return Scaffold(
            backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
            appBar: BaseAppBar(
              title: state.addressInfoEntity?.fullName ?? "",
              showBackLeading: true,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                                          horizontal: 0, vertical: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: SaayerTheme()
                                              .getColorsPalette
                                              .backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(16),
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
                                              horizontal: 16, vertical: 8),
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
                              .toList())
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Map<String, String> _getAddressInfoMap(CustomerGetDto addressInfoEntity) {
    final Map<String, String> map = {};
    for (AddAddressFieldsTypes addAddressFieldsType
        in AddAddressFieldsTypes.values) {
      switch (addAddressFieldsType) {
        case AddAddressFieldsTypes.NAME:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.fullName ?? '';
            break;
          }
        case AddAddressFieldsTypes.MOBILE:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.phoneNo ?? '';
            break;
          }
        case AddAddressFieldsTypes.ALTERNATIVE_MOBILE:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.phoneNo2 ?? '';
            break;
          }
        case AddAddressFieldsTypes.EMAIL:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.email ?? '';
            break;
          }
        case AddAddressFieldsTypes.COUNTRY:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.countryNameEn ?? '';
            break;
          }
        case AddAddressFieldsTypes.CITY:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.countryNameEn ?? '';
            break;
          }
        case AddAddressFieldsTypes.GOVERNORATE:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.governorateNameEn ?? '';
            break;
          }
        case AddAddressFieldsTypes.AREA:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.areaNameEn ?? '';
            break;
          }
        case AddAddressFieldsTypes.ADDRESS:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.addressDetails ?? '';
            break;
          }
        case AddAddressFieldsTypes.ZIPCODE:
          {
            map[addAddressFieldsType.name] = addressInfoEntity.zipcode ?? '';
            break;
          }
      }
    }
    return map;
  }
}
