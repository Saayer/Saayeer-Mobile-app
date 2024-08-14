import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
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
import 'package:saayer/features/view_page/sub_features/request_shipment/data/core/utils/enums.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/presentation/bloc/request_shipment_bloc.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/sender/presentation/widgets/sender_item_details_widget.dart';
import 'package:saayer/features/view_page/sub_features/request_shipment/sub_features/sender/presentation/widgets/senders_drop_down_text_field.dart';

class SenderPage extends StatefulWidget {
  const SenderPage({super.key});

  @override
  State<SenderPage> createState() => _SenderPageState();
}

class _SenderPageState extends State<SenderPage> {
  SenderReceiverType? senderType = SenderReceiverType.store;

  @override
  Widget build(BuildContext context) {
    final RequestShipmentBloc requestShipmentBloc = BlocProvider.of<RequestShipmentBloc>(context);
    return BlocConsumer<RequestShipmentBloc, RequestShipmentState>(
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

  _buildNextButtonWidget(RequestShipmentBloc requestShipmentBloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SaayerDefaultTextButton(
        text: "next",
        isEnabled: true,
        borderRadius: 16,
        onPressed: () {
          requestShipmentBloc.add(GoToNextPageEvent());
        },
      ),
    );
  }

  _buildSenderBodyWidget(RequestShipmentBloc requestShipmentBloc) {
    return Padding(
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
                  groupValue: senderType,
                  activeColor: SaayerTheme().getColorsPalette.primaryColor,
                  onChanged: (SenderReceiverType? value) {
                    setState(() {
                      senderType = value;
                    });
                  },
                ),
              ),

              ///
              Expanded(
                child: RadioListTile<SenderReceiverType>(
                  title: Text('customer'.tr(), style: AppTextStyles.liteLabel()),
                  value: SenderReceiverType.customer,
                  groupValue: senderType,
                  activeColor: SaayerTheme().getColorsPalette.primaryColor,
                  onChanged: (SenderReceiverType? value) {
                    if (requestShipmentBloc.senderCustomersList.isEmpty) {
                      requestShipmentBloc.add(const GetCustomersAddresses());
                    }
                    setState(() {
                      senderType = value;
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
            child: senderType == SenderReceiverType.store
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
            senderType: senderType,
            customerItem: requestShipmentBloc.selectedSenderCustomerAddress,
            storeItem: requestShipmentBloc.selectedSenderStoreAddress,
          ),
        ],
      ),
    );
  }

  _buildStoresListDropdownWidget(RequestShipmentBloc requestShipmentBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: largerThanTablet(context) ? screenWidth(context) / 2 : null,
          child: SendersDropDownTextField(
            bloc: requestShipmentBloc,
            isFieldRequired: false,
            onCustomerAddressSelected: (customer) {},
            onStoreAddressSelected: (store) {
              requestShipmentBloc.add(OnSenderSelectedFromDropDown(
                senderType: SenderReceiverType.store,
                item: store,
              ));
            },
            senderType: senderType ?? SenderReceiverType.store,
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

  _buildCustomersListDropdownWidget(RequestShipmentBloc requestShipmentBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: largerThanTablet(context) ? screenWidth(context) / 2 : null,
          child: SendersDropDownTextField(
            bloc: requestShipmentBloc,
            isFieldRequired: false,
            onCustomerAddressSelected: (customer) {
              requestShipmentBloc.add(OnSenderSelectedFromDropDown(
                senderType: SenderReceiverType.customer,
                item: customer,
              ));
            },
            onStoreAddressSelected: (store) {},
            senderType: senderType ?? SenderReceiverType.customer,
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
                  requestShipmentBloc.add(const GetCustomersAddresses());
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
