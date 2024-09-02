import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/text/rich_text_widget.dart';
import 'package:saayer/core/helpers/utils_helper/strings_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/request_new_shipment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_summary/presentation/bloc/shipment_summary_bloc.dart';

class ShipmentSummaryTextFieldsHelper {
  final ShipmentCheckoutFieldsTypes shipmentCheckoutFieldsTypes;
  final RequestNewShipmentBloc requestShipmentBloc;
  final ShipmentSummaryBloc shipmentCheckoutBloc;

  ShipmentSummaryTextFieldsHelper({
    required this.shipmentCheckoutFieldsTypes,
    required this.requestShipmentBloc,
    required this.shipmentCheckoutBloc,
  });

  getTextsWidget() {
    final TextStyle keyTextStyle = AppTextStyles.paragraph(SaayerTheme().getColorsPalette.greyColor);
    final TextStyle valueTextStyle = AppTextStyles.smallParagraph();
    switch (shipmentCheckoutFieldsTypes) {
      case ShipmentCheckoutFieldsTypes.SENDER:
        {
          return _getSenderDetails(keyTextStyle: keyTextStyle, valueTextStyle: valueTextStyle);
        }
      case ShipmentCheckoutFieldsTypes.RECEIVER:
        {
          return _getReceiverDetails(keyTextStyle: keyTextStyle, valueTextStyle: valueTextStyle);
        }
      case ShipmentCheckoutFieldsTypes.SHIPMENT_DETAILS:
        {
          return _buildShipmentSpecInfo(keyTextStyle: keyTextStyle, valueTextStyle: valueTextStyle);
        }
      case ShipmentCheckoutFieldsTypes.SERVICE_PROVIDER:
        {
          return _buildServiceProviderWidget(keyTextStyle: keyTextStyle, valueTextStyle: valueTextStyle);
        }
    }
  }

  Widget _getSenderDetails({required TextStyle keyTextStyle, required TextStyle valueTextStyle}) {
    switch (requestShipmentBloc.senderType ?? SenderReceiverType.store) {
      case SenderReceiverType.store:
        {
          return _buildStoreDetails(
              storeDto: shipmentCheckoutBloc.state.senderStoreDto,
              isSender: true,
              keyTextStyle: keyTextStyle,
              valueTextStyle: valueTextStyle);
        }
      case SenderReceiverType.customer:
        {
          return _buildCustomerDetails(
              customerDto: shipmentCheckoutBloc.state.senderCustomerDto,
              isSender: true,
              keyTextStyle: keyTextStyle,
              valueTextStyle: valueTextStyle);
        }
    }
  }

  _getReceiverDetails({required TextStyle keyTextStyle, required TextStyle valueTextStyle}) {
    switch (requestShipmentBloc.receiverType ?? SenderReceiverType.store) {
      case SenderReceiverType.store:
        {
          return _buildStoreDetails(
              storeDto: shipmentCheckoutBloc.state.receiverStoreDto,
              isSender: false,
              keyTextStyle: keyTextStyle,
              valueTextStyle: valueTextStyle);
        }
      case SenderReceiverType.customer:
        {
          return _buildCustomerDetails(
              customerDto: shipmentCheckoutBloc.state.receiverCustomerDto,
              isSender: false,
              keyTextStyle: keyTextStyle,
              valueTextStyle: valueTextStyle);
        }
    }
  }

  Widget _buildStoreDetails(
      {StoreGetDto? storeDto,
      required bool isSender,
      required TextStyle keyTextStyle,
      required TextStyle valueTextStyle}) {
    return storeDto == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${isSender ? 'sender'.tr() : 'receiver'.tr()}: ',
                style: AppTextStyles.paragraph(),
              ),
              const SizedBox(height: 5),
              RichTextWidget(
                keyStr: 'name',
                keyTextStyle: keyTextStyle,
                valueStr: storeDto.name ?? '',
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'country',
                keyTextStyle: keyTextStyle,
                valueStr: StringsUtil.getLanguageName(
                    arName: storeDto.countryNameAr ?? '', enName: storeDto.countryNameEn ?? ''),
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'governorate',
                keyTextStyle: keyTextStyle,
                valueStr: StringsUtil.getLanguageName(
                    arName: storeDto.governorateNameAr ?? '', enName: storeDto.governorateNameEn ?? ''),
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'city',
                keyTextStyle: keyTextStyle,
                valueStr:
                    StringsUtil.getLanguageName(arName: storeDto.cityNameAr ?? '', enName: storeDto.cityNameEn ?? ''),
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'area',
                keyTextStyle: keyTextStyle,
                valueStr:
                    StringsUtil.getLanguageName(arName: storeDto.areaNameAr ?? '', enName: storeDto.areaNameEn ?? ''),
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'address',
                keyTextStyle: keyTextStyle,
                valueStr: storeDto.addressDetails ?? '',
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              if (storeDto.financialRecordNumber != null && storeDto.financialRecordNumber!.isNotEmpty)
                RichTextWidget(
                  keyStr: 'financial_record_number',
                  keyTextStyle: keyTextStyle,
                  valueStr: storeDto.financialRecordNumber ?? '',
                  valueTextStyle: valueTextStyle,
                ),
              const SizedBox(height: 4),
              if (storeDto.freelanceCertificateNumber != null && storeDto.freelanceCertificateNumber!.isNotEmpty)
                RichTextWidget(
                  keyStr: 'freelance_certificate_number',
                  keyTextStyle: keyTextStyle,
                  valueStr: storeDto.freelanceCertificateNumber ?? '',
                  valueTextStyle: valueTextStyle,
                ),
              const SizedBox(height: 4),
            ],
          );
  }

  Widget _buildCustomerDetails(
      {CustomerGetDto? customerDto,
      required bool isSender,
      required TextStyle keyTextStyle,
      required TextStyle valueTextStyle}) {
    return customerDto == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${isSender ? 'sender'.tr() : 'receiver'.tr()}: ',
                style: AppTextStyles.paragraph(),
              ),
              const SizedBox(height: 5),
              RichTextWidget(
                keyStr: 'name',
                keyTextStyle: keyTextStyle,
                valueStr: customerDto.fullName ?? '',
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'phone_num',
                keyTextStyle: keyTextStyle,
                valueStr: customerDto.phoneNo ?? '',
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'email',
                keyTextStyle: keyTextStyle,
                valueStr: customerDto.email ?? '',
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'country',
                keyTextStyle: keyTextStyle,
                valueStr: StringsUtil.getLanguageName(
                    arName: customerDto.countryNameAr ?? '', enName: customerDto.countryNameEn ?? ''),
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'governorate',
                keyTextStyle: keyTextStyle,
                valueStr: StringsUtil.getLanguageName(
                    arName: customerDto.governorateNameAr ?? '', enName: customerDto.governorateNameEn ?? ''),
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'city',
                keyTextStyle: keyTextStyle,
                valueStr: StringsUtil.getLanguageName(
                    arName: customerDto.cityNameAr ?? '', enName: customerDto.cityNameEn ?? ''),
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'area',
                keyTextStyle: keyTextStyle,
                valueStr: StringsUtil.getLanguageName(
                    arName: customerDto.areaNameAr ?? '', enName: customerDto.areaNameEn ?? ''),
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'address',
                keyTextStyle: keyTextStyle,
                valueStr: customerDto.addressDetails ?? '',
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
            ],
          );
  }

  _buildShipmentSpecInfo({required TextStyle keyTextStyle, required TextStyle valueTextStyle}) {
    return requestShipmentBloc.state.shipmentDtoBody == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'shipment_details'.tr()}: ',
                style: AppTextStyles.paragraph(),
              ),
              const SizedBox(height: 5),
              RichTextWidget(
                keyStr: 'length_cm',
                keyTextStyle: keyTextStyle,
                valueStr: '${requestShipmentBloc.state.shipmentDtoBody?.length}',
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'width_cm',
                keyTextStyle: keyTextStyle,
                valueStr: '${requestShipmentBloc.state.shipmentDtoBody?.width}',
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'weight_kg',
                keyTextStyle: keyTextStyle,
                valueStr: '${requestShipmentBloc.state.shipmentDtoBody?.weight}',
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'height_cm',
                keyTextStyle: keyTextStyle,
                valueStr: '${requestShipmentBloc.state.shipmentDtoBody?.height}',
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              RichTextWidget(
                keyStr: 'content_description',
                keyTextStyle: keyTextStyle,
                valueStr: requestShipmentBloc.state.shipmentDtoBody?.contentDesc ?? '',
                valueTextStyle: valueTextStyle,
              ),
              const SizedBox(height: 4),
              if (requestShipmentBloc.state.shipmentDtoBody?.contentValue != null)
                RichTextWidget(
                  keyStr: 'content_value',
                  keyTextStyle: keyTextStyle,
                  valueStr: '${requestShipmentBloc.state.shipmentDtoBody?.contentValue}',
                  valueTextStyle: valueTextStyle,
                ),
              const SizedBox(height: 4),
            ],
          );
  }

  _buildServiceProviderWidget({required TextStyle keyTextStyle, required TextStyle valueTextStyle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${'service_provider'.tr()}: ',
          style: AppTextStyles.paragraph(),
        ),
        const SizedBox(height: 5),
        RichTextWidget(
          keyStr: 'name',
          keyTextStyle: keyTextStyle,
          valueStr: '${requestShipmentBloc.state.selectedServiceProvider?.name}',
          valueTextStyle: valueTextStyle,
        ),
        const SizedBox(height: 4),
        RichTextWidget(
          keyStr: 'cost',
          keyTextStyle: keyTextStyle,
          valueStr: '${requestShipmentBloc.state.selectedServiceProvider?.cost} ${'sar'.tr()}',
          valueTextStyle: valueTextStyle,
        ),
        const SizedBox(height: 4),
        RichTextWidget(
          keyStr: 'business_days',
          keyTextStyle: keyTextStyle,
          valueStr: '${requestShipmentBloc.state.selectedServiceProvider?.estimatedShipmentDays}',
          valueTextStyle: valueTextStyle,
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
