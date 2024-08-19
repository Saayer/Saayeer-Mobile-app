import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/src/model/customer_get_dto.dart';
import 'package:openapi/src/model/store_get_dto.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/request_new_shipment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_checkout_payment/presentation/widgets/payment_success_widget.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_checkout_payment/presentation/bloc/shipment_checkout_payment_bloc.dart';

class ShipmentCheckoutPaymentPage extends StatelessWidget {
  const ShipmentCheckoutPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestNewShipmentBloc requestShipmentBloc = BlocProvider.of<RequestNewShipmentBloc>(context);
    final ShipmentCheckoutPaymentBloc bloc = BlocProvider.of<ShipmentCheckoutPaymentBloc>(context);

    return BlocConsumer<ShipmentCheckoutPaymentBloc, ShipmentCheckoutPaymentState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (bloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);

        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {
            ///
            getIt<NavigationService>().navigateAndReplacement(const PaymentSuccessWidget());
          }
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          resizeToAvoidBottomInset: false,
          bottomSheet: _buildSubmitButtonWidget(bloc, requestShipmentBloc),
          body: _buildCheckoutPaymentBody(bloc, requestShipmentBloc),
        );
      },
    );
  }

  _buildSubmitButtonWidget(ShipmentCheckoutPaymentBloc bloc, RequestNewShipmentBloc requestShipmentBloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SaayerDefaultTextButton(
        text: "submit",
        isEnabled: true,
        borderRadius: 16,
        onPressed: () {
          bloc.add(AddNewShipment(requestShipmentBloc.state.shipmentDtoBody));
        },
      ),
    );
  }

  _buildCheckoutPaymentBody(ShipmentCheckoutPaymentBloc bloc, RequestNewShipmentBloc requestShipmentBloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Center(
            child: Text(
              'checkout'.tr(),
              style: AppTextStyles.mainFocusedLabel(),
            ),
          ),
          const SizedBox(height: 10),
          _buildSummaryDetails(bloc, requestShipmentBloc)
        ],
      ),
    );
  }

  _buildSummaryDetails(ShipmentCheckoutPaymentBloc bloc, RequestNewShipmentBloc requestShipmentBloc) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.grey), shape: BoxShape.rectangle),
        child: ListView(
          shrinkWrap: true,
          children: [
            _getSenderDetails(bloc, requestShipmentBloc),
            const Divider(
              color: Colors.grey,
            ),
            _getReceiverDetails(bloc, requestShipmentBloc),
            const Divider(
              color: Colors.grey,
            ),
            _buildShipmentSpecInfo(bloc, requestShipmentBloc),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  Widget _getSenderDetails(ShipmentCheckoutPaymentBloc bloc, RequestNewShipmentBloc requestShipmentBloc) {
    switch (requestShipmentBloc.senderType ?? SenderReceiverType.store) {
      case SenderReceiverType.store:
        {
          return _buildSenderStoreDetails(bloc.state.senderStoreDto);
        }
      case SenderReceiverType.customer:
        {
          return _buildSenderCustomerDetails(bloc.state.senderCustomerDto);
        }
    }
  }

  Widget _buildSenderStoreDetails(StoreGetDto? senderStoreDto) {
    return senderStoreDto == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${'sender'.tr()}: '),
              Text('${'name'.tr()}: ${senderStoreDto.name}'),
              Text('${'country'.tr()}: ${senderStoreDto.countryNameEn}'),
              Text('${'governorate'.tr()}: ${senderStoreDto.governorateNameEn}'),
              Text('${'city'.tr()}: ${senderStoreDto.cityNameEn}'),
              Text('${'area'.tr()}: ${senderStoreDto.areaId}'),
              Text('${'address'.tr()}: ${senderStoreDto.addressDetails}'),
              Text('${'financial_record_number'.tr()}: ${senderStoreDto.financialRecordNumber}'),
              Text('${'freelance_certificate_number'.tr()}: ${senderStoreDto.freelanceCertificateNumber}'),
            ],
          );
  }

  Widget _buildSenderCustomerDetails(CustomerGetDto? senderCustomerDto) {
    return senderCustomerDto == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${'sender'.tr()}: '),
              Text('${'name'.tr()}: ${senderCustomerDto.fullName}'),
              Text('${'phone_num'.tr()}: ${senderCustomerDto.phoneNo}'),
              Text('${'email'.tr()}: ${senderCustomerDto.email}'),
              Text('${'country'.tr()}: ${senderCustomerDto.countryNameEn}'),
              Text('${'governorate'.tr()}: ${senderCustomerDto.governorateNameEn}'),
              Text('${'city'.tr()}: ${senderCustomerDto.cityNameEn}'),
              Text('${'area'.tr()}: ${senderCustomerDto.areaId}'),
              Text('${'address'.tr()}: ${senderCustomerDto.addressDetails}'),
            ],
          );
  }

  _getReceiverDetails(ShipmentCheckoutPaymentBloc bloc, RequestNewShipmentBloc requestShipmentBloc) {
    switch (requestShipmentBloc.receiverType ?? SenderReceiverType.store) {
      case SenderReceiverType.store:
        {
          return _buildReceiverStoreDetails(bloc.state.receiverStoreDto);
        }
      case SenderReceiverType.customer:
        {
          return _buildReceiverCustomerDetails(bloc.state.receiverCustomerDto);
        }
    }
  }

  _buildReceiverStoreDetails(StoreGetDto? receiverStoreDto) {
    return receiverStoreDto == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${'receiver'.tr()}: '),
              Text('${'name'.tr()}: ${receiverStoreDto.name}'),
              Text('${'country'.tr()}: ${receiverStoreDto.countryNameEn}'),
              Text('${'governorate'.tr()}: ${receiverStoreDto.governorateNameEn}'),
              Text('${'city'.tr()}: ${receiverStoreDto.cityNameEn}'),
              Text('${'area'.tr()}: ${receiverStoreDto.areaId}'),
              Text('${'address'.tr()}: ${receiverStoreDto.addressDetails}'),
              Text('${'financial_record_number'.tr()}: ${receiverStoreDto.financialRecordNumber}'),
              Text('${'freelance_certificate_number'.tr()}: ${receiverStoreDto.freelanceCertificateNumber}'),
            ],
          );
  }

  _buildReceiverCustomerDetails(CustomerGetDto? receiverCustomerDto) {
    return receiverCustomerDto == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${'sender'.tr()}: '),
              Text('${'name'.tr()}: ${receiverCustomerDto.fullName}'),
              Text('${'phone_num'.tr()}: ${receiverCustomerDto.phoneNo}'),
              Text('${'email'.tr()}: ${receiverCustomerDto.email}'),
              Text('${'country'.tr()}: ${receiverCustomerDto.countryNameEn}'),
              Text('${'governorate'.tr()}: ${receiverCustomerDto.governorateNameEn}'),
              Text('${'city'.tr()}: ${receiverCustomerDto.cityNameEn}'),
              Text('${'area'.tr()}: ${receiverCustomerDto.areaId}'),
              Text('${'address'.tr()}: ${receiverCustomerDto.addressDetails}'),
            ],
          );
  }

  _buildShipmentSpecInfo(ShipmentCheckoutPaymentBloc bloc, RequestNewShipmentBloc requestShipmentBloc) {
    return requestShipmentBloc.state.shipmentDtoBody == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${'shipment_details'.tr()}: '),
              Text('${'length_cm'.tr()}: ${requestShipmentBloc.state.shipmentDtoBody?.length}'),
              Text('${'width_cm'.tr()}: ${requestShipmentBloc.state.shipmentDtoBody?.width}'),
              Text('${'weight_kg'.tr()}: ${requestShipmentBloc.state.shipmentDtoBody?.weight}'),
              Text('${'height_cm'.tr()}: ${requestShipmentBloc.state.shipmentDtoBody?.height}'),
              Text('${'content_description'.tr()}: ${requestShipmentBloc.state.shipmentDtoBody?.contentDesc}'),
              if (requestShipmentBloc.state.shipmentDtoBody?.contentValue != null)
                Text('${'content_value'.tr()}: ${requestShipmentBloc.state.shipmentDtoBody?.contentValue}'),
            ],
          );
  }
}
