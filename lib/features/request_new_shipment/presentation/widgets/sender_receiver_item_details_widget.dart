import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/generic_svg_widget.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/request_new_shipment/data/core/utils/enums.dart';

class SenderItemDetailsWidget extends StatelessWidget {
  final SenderReceiverType? senderType;
  final CustomerGetDto? customerItem;
  final StoreGetDto? storeItem;
  final RequestShipmentTypes requestShipmentTypes;

  const SenderItemDetailsWidget(
      {super.key, this.senderType, this.customerItem, this.storeItem, required this.requestShipmentTypes});

  @override
  Widget build(BuildContext context) {
    if (senderType == SenderReceiverType.store && storeItem != null) {
      return _buildStoreAddressDetails(storeItem!);
    } else if (senderType == SenderReceiverType.customer && customerItem != null) {
      return _buildCustomerAddressDetails(customerItem!);
    } else {
      return const SizedBox();
    }
  }

  Widget _buildStoreAddressDetails(StoreGetDto storeItem) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      child: ListTile(
        leading: GenericSvgWidget(
          path: Constants.getIconPath(
              requestShipmentTypes == RequestShipmentTypes.sender
                  ? "ic_sender.svg"
                  : "ic_receiver.svg"),
          color: SaayerTheme().getColorsPalette.orangeColor,
          size: 30,
        ),
        title: Text(
          storeItem.name ?? '',
          style: AppTextStyles.boldLabel(),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'freelance_certificate_number'.tr()}: ${storeItem.freelanceCertificateNumber}',
                style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${'financial_record_number'.tr()}: ${storeItem.financialRecordNumber}',
                style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor),
              ),
              const SizedBox(
                height: 5,
              ),
              _buildFullAddressDetails<StoreGetDto>(storeItem),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerAddressDetails(CustomerGetDto customerItem) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      child: ListTile(
        leading: GenericSvgWidget(
          path: Constants.getIconPath("ic_sender.svg"),
          color: SaayerTheme().getColorsPalette.orangeColor,
          size: 30,
        ),
        title: Text(
          customerItem.fullName ?? '',
          style: AppTextStyles.boldLabel(),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'phone_num'.tr()}: ${customerItem.phoneNo}',
                style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${'phone_num2'.tr()}: ${customerItem.phoneNo}',
                style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${'email'.tr()}: ${customerItem.phoneNo}',
                style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor),
              ),
              const SizedBox(
                height: 5,
              ),
              _buildFullAddressDetails<CustomerGetDto>(customerItem),
            ],
          ),
        ),
      ),
    );
  }

  _buildFullAddressDetails<T>(T item) {
    if (item is StoreGetDto) {
      return Text.rich(TextSpan(children: [
        TextSpan(
            text: StringsUtil.getLanguageName(arName: item.countryNameAr ?? '', enName: item.countryNameEn ?? ''),
            style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
        TextSpan(
            text:
                ' - ${StringsUtil.getLanguageName(arName: item.governorateNameAr ?? '', enName: item.governorateNameEn ?? '')}',
            style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
        TextSpan(
            text: ' - ${StringsUtil.getLanguageName(arName: item.cityNameAr ?? '', enName: item.cityNameEn ?? '')}',
            style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
        TextSpan(
            text: ' - ${StringsUtil.getLanguageName(arName: item.areaNameAr ?? '', enName: item.areaNameEn ?? '')}',
            style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
        TextSpan(
            text: ' - ${item.addressDetails}',
            style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
        TextSpan(
            text: ' - ${item.zipcode}', style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
      ]));
    } else if (item is CustomerGetDto) {
      return Text.rich(TextSpan(children: [
        TextSpan(
            text: StringsUtil.getLanguageName(arName: item.countryNameAr ?? '', enName: item.countryNameEn ?? ''),
            style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
        TextSpan(
            text:
                ' - ${StringsUtil.getLanguageName(arName: item.governorateNameAr ?? '', enName: item.governorateNameEn ?? '')}',
            style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
        TextSpan(
            text: ' - ${StringsUtil.getLanguageName(arName: item.cityNameAr ?? '', enName: item.cityNameEn ?? '')}',
            style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
        TextSpan(
            text: ' - ${StringsUtil.getLanguageName(arName: item.areaNameAr ?? '', enName: item.areaNameEn ?? '')}',
            style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
        TextSpan(
            text: ' - ${item.addressDetails}',
            style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
        TextSpan(
            text: ' - ${item.zipcode}', style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.greyColor)),
      ]));
    } else {
      return Container();
    }
  }
}
