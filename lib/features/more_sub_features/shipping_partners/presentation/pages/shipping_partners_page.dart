import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/shimmer/shimmer_widget.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/more_sub_features/shipping_partners/presentation/bloc/shipping_partners_bloc.dart';
import 'package:saayer/features/more_sub_features/shipping_partners/presentation/widgets/empty_shipping_partners_list.dart';
import 'package:saayer/features/more_sub_features/shipping_partners/presentation/widgets/shipping_partners_item_widget.dart';

class ShippingPartnersPage extends StatelessWidget {
  const ShippingPartnersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ShippingPartnersBloc shippingPartnersBloc = BlocProvider.of<ShippingPartnersBloc>(context);
    return BlocConsumer<ShippingPartnersBloc, ShippingPartnersState>(
      buildWhen: (previousState, nextState) =>
          (previousState.stateHelper.requestState != nextState.stateHelper.requestState),
      listener: (context, state) async {
        final bool isLoading = (state.stateHelper.requestState == RequestState.LOADING);
        LoadingDialog.setIsLoading(context, isLoading);
        if (!isLoading) {
          if (state.stateHelper.requestState == RequestState.SUCCESS) {}
          if (state.stateHelper.requestState == RequestState.ERROR) {}
          if (state.stateHelper.requestState == RequestState.LOADED) {}
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
        appBar: const BaseAppBar(title: 'shipping_partners', showBackLeading: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                  child: state.shippingPartnersList == null
                      ? const ShimmerWidget()
                      : _buildShippingPartnersListWidget(shippingPartnersBloc)),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  _buildShippingPartnersListWidget(ShippingPartnersBloc shippingPartnersBloc) {
    if (shippingPartnersBloc.state.shippingPartnersList!.isEmpty) {
      return const EmptyShippingPartnersList();
    }
    return ListView.builder(
        shrinkWrap: true,
        itemCount: shippingPartnersBloc.shippingPartnersList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ShippingPartnersItemWidget(
              shippingPartnersItem: shippingPartnersBloc.shippingPartnersList[index],
            ),
          );
        });
  }
}
