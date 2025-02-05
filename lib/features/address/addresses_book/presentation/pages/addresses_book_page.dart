import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/address/add_edit_address/core/utils/enums/enums.dart';
import 'package:saayer/features/address/addresses_book/presentation/bloc/addresses_book_bloc.dart';
import 'package:saayer/features/address/addresses_book/presentation/widgets/address_item_widget.dart';
import 'package:saayer/features/address/addresses_book/presentation/widgets/addresses_filters_widget.dart';
import 'package:saayer/features/address/addresses_book/presentation/widgets/empty_addresses_book.dart';

class AddressesBookPage extends StatefulWidget {
  const AddressesBookPage({super.key});

  @override
  State<AddressesBookPage> createState() => _AddressesBookPageState();
}

class _AddressesBookPageState extends State<AddressesBookPage> {
  @override
  Widget build(BuildContext context) {
    final AddressesBookBloc addressesBookBloc = BlocProvider.of<AddressesBookBloc>(context);
    return BlocConsumer<AddressesBookBloc, AddressesBookState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) {
        final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
          if (state.stateHelper.requestState == RequestState.LOADED) {}
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          resizeToAvoidBottomInset: false,
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  AddressesFiltersWidget(addressesBookBloc: addressesBookBloc),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: addressesBookBloc.scrollController
                        ..addListener(() => addressesBookBloc.add(const OnScrollPagination())),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (state.addresses != null) _buildAddressesListWidget(state.addresses, addressesBookBloc)
                        ],
                      ),
                    ),
                  ),
                  SaayerDefaultTextButton(
                    text: 'add_address'.tr(),
                    isEnabled: true,
                    borderRadius: 16,
                    onPressed: () {
                      getIt<NavigationService>().navigateToNamed(Routes.addEditAddressNamedPage, arguments: {
                        'isAddShipmentRequest': true,
                        'addEditAddressType': AddEditAddressType.addAddress,
                        'customerModel': CustomerGetDto(),
                      }, onBack: (_) {
                        addressesBookBloc.add(const ResetList());
                        addressesBookBloc.add(const GetAddresses());
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
        );
      },
    );
  }

  Widget _buildAddressesListWidget(List<CustomerGetDto>? addresses, AddressesBookBloc addressesBookBloc) {
    if (addresses!.isEmpty) {
      return const EmptyAddressesBook();
    }
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: AddressItemWidget(
              addressInfoEntity: addresses[index],
              onTap: () {
                getIt<NavigationService>().navigateToNamed(Routes.addressDetailsNamedPage, arguments: {
                  'addressInfoEntity': addresses[index],
                  'onDelete': () {
                    SaayerDialogs().twoBtnsDialog(
                        title: "warning",
                        message: 'are_you_sure_delete_address',
                        onTapDismiss: () {
                          getIt<NavigationService>().pop();
                          addressesBookBloc.add(OnAddressDelete(deleteAddress: addresses[index]));
                        });
                  }
                });
              },
              onEdit: () {
                getIt<NavigationService>().navigateToNamed(Routes.addEditAddressNamedPage, arguments: {
                  'isAddShipmentRequest': true,
                  'addEditAddressType': AddEditAddressType.editAddress,
                  'customerModel': addresses[index],
                }, onBack: (_) {
                  addressesBookBloc.add(const ResetList());
                  addressesBookBloc.add(const GetAddresses());
                });
              },
              onDelete: () {
                SaayerDialogs().twoBtnsDialog(
                    title: "warning",
                    message: 'are_you_sure_delete_address',
                    onTapDismiss: () {
                      addressesBookBloc.add(OnAddressDelete(deleteAddress: addresses[index]));
                    });
              },
            ),
          );
        });
  }
}
