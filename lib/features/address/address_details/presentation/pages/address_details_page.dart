import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/address_details/presentation/bloc/address_details_bloc.dart';

class AddressDetailsPage extends StatelessWidget {
  final VoidCallback onDelete;

  const AddressDetailsPage({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocConsumer<AddressDetailsBloc, AddressDetailsState>(
        buildWhen: (previousState, nextState) =>
            (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
        listener: (context, state) {
          final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
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
              actions: [
                if ((state.addressInfoEntity?.totalShipments ?? 0) == 0)
                  IconButton(
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete_rounded,
                        size: 25,
                        color: SaayerTheme().getColorsPalette.error0,
                      ))
              ],
            ),
            body: state.addressInfoEntity == null
                ? Container()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: _buildAddressDetailsFields(context, state.addressInfoEntity!)),
          );
        },
      ),
    );
  }

  _buildAddressDetailsFields(BuildContext context, CustomerGetDto addressInfoEntity) {
    return ListView(
      children: [
        /// FullName & Phone & Alternative Phone & Email
        ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.largerThan(breakpoint: 900, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 10,
          rowSpacing: 15,
          children: [
            /// FullName & Phone
            _buildFirstColumnRowField(context, addressInfoEntity),

            /// Alternative Phone & Email
            _buildSecondColumnRowField(context, addressInfoEntity),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        /// country & governorate & city & area
        ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.largerThan(breakpoint: 900, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 10,
          rowSpacing: 15,
          children: [
            /// country & governorate
            _buildThirdColumnRowField(context, addressInfoEntity),

            /// city & area
            _buildFourthColumnRowField(context, addressInfoEntity),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        /// address & zipCode
        _buildFifthColumnRowField(context, addressInfoEntity),
      ],
    );
  }

  _buildFirstColumnRowField(BuildContext context, CustomerGetDto addressInfoEntity) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.tight,
        child: ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 10,
          rowSpacing: 15,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _buildAddressDetailsItem(
                  title: AddAddressFieldsTypes.NAME.name, value: addressInfoEntity.fullName ?? ''),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _buildAddressDetailsItem(
                  title: AddAddressFieldsTypes.MOBILE.name, value: addressInfoEntity.phoneNo ?? ''),
            ),
          ],
        ));
  }

  _buildSecondColumnRowField(BuildContext context, CustomerGetDto addressInfoEntity) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.tight,
        child: ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 10,
          rowSpacing: 15,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _buildAddressDetailsItem(
                  title: AddAddressFieldsTypes.ALTERNATIVE_MOBILE.name, value: addressInfoEntity.phoneNo2 ?? ''),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _buildAddressDetailsItem(
                  title: AddAddressFieldsTypes.EMAIL.name, value: addressInfoEntity.email ?? ''),
            ),
          ],
        ));
  }

  _buildThirdColumnRowField(BuildContext context, CustomerGetDto addressInfoEntity) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.tight,
        child: ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 10,
          rowSpacing: 15,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _buildAddressDetailsItem(
                  title: AddAddressFieldsTypes.COUNTRY.name,
                  value: StringsUtil.getLanguageName(
                      arName: addressInfoEntity.countryNameAr ?? '', enName: addressInfoEntity.countryNameEn ?? '')),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _buildAddressDetailsItem(
                  title: AddAddressFieldsTypes.GOVERNORATE.name,
                  value: StringsUtil.getLanguageName(
                      arName: addressInfoEntity.governorateNameAr ?? '',
                      enName: addressInfoEntity.governorateNameEn ?? '')),
            ),
          ],
        ));
  }

  _buildFourthColumnRowField(BuildContext context, CustomerGetDto addressInfoEntity) {
    return ResponsiveRowColumnItem(
        rowFit: FlexFit.tight,
        child: ResponsiveRowColumn(
          layout: ResponsiveValue(context,
                  conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
                  defaultValue: ResponsiveRowColumnType.COLUMN)
              .value,
          columnVerticalDirection: VerticalDirection.down,
          columnSpacing: 10,
          rowSpacing: 15,
          children: [
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _buildAddressDetailsItem(
                  title: AddAddressFieldsTypes.CITY.name,
                  value: StringsUtil.getLanguageName(
                      arName: addressInfoEntity.cityNameAr ?? '', enName: addressInfoEntity.cityNameEn ?? '')),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: _buildAddressDetailsItem(
                  title: AddAddressFieldsTypes.AREA.name,
                  value: StringsUtil.getLanguageName(
                      arName: addressInfoEntity.areaNameAr ?? '', enName: addressInfoEntity.areaNameEn ?? '')),
            ),
          ],
        ));
  }

  _buildFifthColumnRowField(BuildContext context, CustomerGetDto addressInfoEntity) {
    return ResponsiveRowColumn(
      layout: ResponsiveValue(context,
              conditionalValues: [const Condition.largerThan(breakpoint: 600, value: ResponsiveRowColumnType.ROW)],
              defaultValue: ResponsiveRowColumnType.COLUMN)
          .value,
      columnVerticalDirection: VerticalDirection.down,
      columnSpacing: 10,
      rowSpacing: 15,
      children: [
        ResponsiveRowColumnItem(
          rowFit: FlexFit.tight,
          child: _buildAddressDetailsItem(
              title: AddAddressFieldsTypes.ADDRESS.name, value: addressInfoEntity.addressDetails ?? ''),
        ),
        ResponsiveRowColumnItem(
          rowFit: FlexFit.tight,
          child: _buildAddressDetailsItem(
              title: AddAddressFieldsTypes.ZIPCODE.name, value: addressInfoEntity.zipcode ?? ''),
        ),
      ],
    );
  }

  _buildAddressDetailsItem({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: SaayerTheme().getColorsPalette.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title.tr(),
                style: AppTextStyles.label(SaayerTheme().getColorsPalette.greyColor),
              ),
              const SizedBox(height: 10),
              Text(
                value.toString().isNotEmpty ? value : "_",
                style: AppTextStyles.paragraph(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
