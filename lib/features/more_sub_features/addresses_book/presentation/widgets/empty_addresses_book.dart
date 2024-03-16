import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/empty/empty_status_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/features/address/add_address/presentation/pages/add_address_page.dart';
import 'package:saayer/features/address/add_address/presentation/screens/add_address_screen.dart';
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart';

class EmptyAddressesBook extends StatelessWidget {
  const EmptyAddressesBook({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final AddressesBookBloc addressesBookBloc =
        BlocProvider.of<AddressesBookBloc>(context);

    return BlocConsumer<AddressesBookBloc, AddressesBookState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        const double size = 65;
        return EmptyStatusWidget(
          title: "empty_addresses_book_title".tr(),
          desc: "empty_addresses_book_desc".tr(),
          btnLabel: "add_address",
          iconName: "addresses_book",
          onBtnPressed: () {
            getIt<NavigationService>().navigateTo(const AddAddressScreen(),
                onBack: (_) {
              addressesBookBloc.add(const GetAddresses());
            });
          },
          size: size,
        );
      },
    );
  }
}
