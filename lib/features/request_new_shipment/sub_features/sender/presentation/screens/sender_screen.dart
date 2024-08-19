import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/toast/toast_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/responsive_utils.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/add_edit_address/presentation/screens/add_edit_address_screen.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/presentation/screens/add_edit_store_screen.dart';
import 'package:saayer/features/request_new_shipment/data/core/utils/enums.dart';
import 'package:saayer/features/request_new_shipment/presentation/bloc/request_new_shipment_bloc.dart';
import 'package:saayer/features/request_new_shipment/presentation/widgets/sender_receiver_item_details_widget.dart';
import 'package:saayer/features/request_new_shipment/presentation/widgets/senders_receivers_drop_down_text_field.dart';

class SenderScreen extends StatefulWidget {
  const SenderScreen({super.key});

  @override
  State<SenderScreen> createState() => _SenderScreenState();
}

class _SenderScreenState extends State<SenderScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final RequestNewShipmentBloc requestShipmentBloc = BlocProvider.of<RequestNewShipmentBloc>(context);
    return BlocConsumer<RequestNewShipmentBloc, RequestNewShipmentState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (requestShipmentBloc.state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);

        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          body: _buildSenderBodyWidget(requestShipmentBloc),
          bottomSheet: _buildNextButtonWidget(requestShipmentBloc),
        );
      },
    );
  }

  _buildNextButtonWidget(RequestNewShipmentBloc requestShipmentBloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SaayerDefaultTextButton(
        text: "next",
        isEnabled: true,
        borderRadius: 16,
        onPressed: () {
          final bool isFormValid = (formKey.currentState!.validate());
          isFormValid
              ? requestShipmentBloc.add(const OnSetSenderId())
              : SaayerToast().showErrorToast(msg: "empty_fields_error".tr());
        },
      ),
    );
  }

  _buildSenderBodyWidget(RequestNewShipmentBloc requestShipmentBloc) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                'sender'.tr(),
                style: AppTextStyles.mainFocusedLabel(),
              ),
            ),
            const SizedBox(height: 10),

            ///
            Row(
              children: [
                ///
                Expanded(
                  child: RadioListTile<SenderReceiverType>(
                    title: Text('store'.tr(), style: AppTextStyles.liteLabel()),
                    value: SenderReceiverType.store,
                    groupValue: requestShipmentBloc.senderType,
                    activeColor: SaayerTheme().getColorsPalette.primaryColor,
                    onChanged: (SenderReceiverType? value) {
                      setState(() {
                        requestShipmentBloc.senderType = value;
                      });
                    },
                  ),
                ),

                ///
                Expanded(
                  child: RadioListTile<SenderReceiverType>(
                    title: Text('customer'.tr(), style: AppTextStyles.liteLabel()),
                    value: SenderReceiverType.customer,
                    groupValue: requestShipmentBloc.senderType,
                    activeColor: SaayerTheme().getColorsPalette.primaryColor,
                    onChanged: (SenderReceiverType? value) {
                      if (requestShipmentBloc.senderCustomersList.isEmpty) {
                        requestShipmentBloc
                            .add(const GetCustomersAddresses(requestShipmentTypes: RequestShipmentTypes.sender));
                      }
                      setState(() {
                        requestShipmentBloc.senderType = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            ///
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: requestShipmentBloc.senderType == SenderReceiverType.store
                  ? _buildStoresListDropdownWidget(requestShipmentBloc)
                  : _buildCustomersListDropdownWidget(requestShipmentBloc),
            ),
            const SizedBox(height: 10),
            Divider(
              height: 1,
              color: SaayerTheme().getColorsPalette.lightGreyColor,
            ),
            const SizedBox(height: 15),

            ///
            SenderItemDetailsWidget(
              requestShipmentTypes: RequestShipmentTypes.sender,
              senderType: requestShipmentBloc.senderType,
              customerItem: requestShipmentBloc.selectedSenderCustomerAddress,
              storeItem: requestShipmentBloc.selectedSenderStoreAddress,
            ),
          ],
        ),
      ),
    );
  }

  _buildStoresListDropdownWidget(RequestNewShipmentBloc requestShipmentBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: largerThanTablet(context) ? screenWidth(context) / 2 : null,
          child: SendersReceiversDropDownTextField(
            requestShipmentTypes: RequestShipmentTypes.sender,
            bloc: requestShipmentBloc,
            isFieldRequired: false,
            onCustomerAddressSelected: (customer) {},
            onStoreAddressSelected: (store) {
              requestShipmentBloc.add(OnSenderSelectedFromDropDown(
                senderType: SenderReceiverType.store,
                item: store,
              ));
            },
            senderReceiverType: requestShipmentBloc.senderType ?? SenderReceiverType.store,
            selectedStoreAddress: requestShipmentBloc.selectedSenderStoreAddress,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: SaayerTheme().getColorsPalette.primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  maximumSize: Size(screenWidth(context) / 3, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
              onPressed: () {
                getIt<NavigationService>().navigateTo(
                    AddEditStoreScreen(addEditStoreType: AddEditStoreType.addStore, storeDto: StoreGetDto()),
                    onBack: (result) {
                  requestShipmentBloc.add(const GetStoresAddresses());
                });
              },
              color: SaayerTheme().getColorsPalette.whiteColor,
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("new_store".tr(),
                      style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.whiteColor)),
                  const Icon(Icons.add)
                ],
              )),
        ),
      ],
    );
  }

  _buildCustomersListDropdownWidget(RequestNewShipmentBloc requestShipmentBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: largerThanTablet(context) ? screenWidth(context) / 2 : null,
          child: SendersReceiversDropDownTextField(
            requestShipmentTypes: RequestShipmentTypes.sender,
            bloc: requestShipmentBloc,
            isFieldRequired: false,
            withValidator: true,
            onCustomerAddressSelected: (customer) {
              requestShipmentBloc.add(OnSenderSelectedFromDropDown(
                senderType: SenderReceiverType.customer,
                item: customer,
              ));
            },
            onStoreAddressSelected: (store) {},
            senderReceiverType: requestShipmentBloc.senderType ?? SenderReceiverType.customer,
            selectedCustomerAddress: requestShipmentBloc.selectedSenderCustomerAddress,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: SaayerTheme().getColorsPalette.primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  maximumSize: Size(screenWidth(context) / 3, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
              onPressed: () {
                getIt<NavigationService>().navigateTo(
                    AddEditAddressScreen(
                      addEditAddressType: AddEditAddressType.addAddress,
                      customerModel: CustomerGetDto(),
                      isAddShipmentRequest: true,
                    ), onBack: (result) {
                  requestShipmentBloc
                      .add(const GetCustomersAddresses(requestShipmentTypes: RequestShipmentTypes.sender));
                });
              },
              color: SaayerTheme().getColorsPalette.whiteColor,
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("new_customer".tr(),
                      style: AppTextStyles.smallParagraph(SaayerTheme().getColorsPalette.whiteColor)),
                  const Icon(Icons.add)
                ],
              )),
        ),
      ],
    );
  }
}
