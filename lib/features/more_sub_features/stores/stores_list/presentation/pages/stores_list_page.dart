import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/common/app_bar/base_app_bar.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/dialogs/saayer_dialogs.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/navigation/navigation_service.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/presentation/bloc/stores_list_bloc.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/presentation/widgets/empty_stores_list.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/presentation/widgets/store_item_widget.dart';

class StoresListPage extends StatefulWidget {
  const StoresListPage({super.key});

  @override
  State<StoresListPage> createState() => _StoresListPageState();
}

class _StoresListPageState extends State<StoresListPage> {
  @override
  Widget build(BuildContext context) {
    final StoresListBloc storesListBloc = BlocProvider.of<StoresListBloc>(context);
    return BlocConsumer<StoresListBloc, StoresListState>(
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
        appBar: const BaseAppBar(title: 'stores', showBackLeading: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Expanded(child: state.storesList == null ? Container() : _buildStoresListWidget(storesListBloc)),
              const SizedBox(height: 10),
              _buildSubmitButtonWidget(storesListBloc),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  _buildStoresListWidget(StoresListBloc storesListBloc) {
    if (storesListBloc.state.storesList!.isEmpty) {
      return const EmptyStoresList();
    }
    return ListView.builder(
        shrinkWrap: true,
        itemCount: storesListBloc.storesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: StoreItemWidget(
              storeDto: storesListBloc.storesList[index],
              onEdit: () {
                getIt<NavigationService>().navigateToNamed(Routes.addEditStoreNamedPage, arguments: {
                  'addEditStoreType': AddEditStoreType.editStore,
                  'storeDto': storesListBloc.state.storesList?[index] ?? StoreGetDto()
                }, onBack: (_) {
                  storesListBloc.add(const ResetList());
                  storesListBloc.add(const GetStores());
                });
              },
              onDelete: () {
                SaayerDialogs().twoBtnsDialog(
                    title: "warning",
                    message: 'are_you_sure_delete_store',
                    onTapDismiss: () {
                      storesListBloc
                          .add(OnStoreDelete(storeDto: storesListBloc.state.storesList?[index] ?? StoreGetDto()));
                    });
              },
            ),
          );
        });
  }

  _buildSubmitButtonWidget(StoresListBloc storesListBloc) {
    return SaayerDefaultTextButton(
      text: 'add_store'.tr(),
      isEnabled: true,
      borderRadius: 16,
      onPressed: () {
        getIt<NavigationService>().navigateToNamed(Routes.addEditStoreNamedPage,
            arguments: {'addEditStoreType': AddEditStoreType.editStore, 'storeDto': StoreGetDto()}, onBack: (_) {
          storesListBloc.add(const ResetList());
          storesListBloc.add(const GetStores());
        });
      },
    );
  }
}
