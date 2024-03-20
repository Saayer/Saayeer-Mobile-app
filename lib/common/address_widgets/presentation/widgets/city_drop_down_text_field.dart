import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/address_widgets/core/errors/address_widgets_error_handler.dart';
import 'package:saayer/common/address_widgets/domain/entities/city_entity.dart';
import 'package:saayer/common/address_widgets/presentation/bloc/address_widgets_bloc.dart';
import 'package:saayer/common/loading/loading_dialog.dart';
import 'package:saayer/common/text_fields/drop_down_text_field.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/utils/enums.dart';

class CityDropDownTextField extends StatelessWidget {
  final void Function(CityEntity) onSelected;
  final CityEntity? selectedCityEntity;

  const CityDropDownTextField(
      {super.key, required this.onSelected, this.selectedCityEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = getIt<AddressWidgetsBloc>();
        bloc.add(const GetCities());
        return bloc;
      },
      child: BlocConsumer<AddressWidgetsBloc, AddressWidgetsState>(
        buildWhen: (previousState, nextState) =>
            (previousState.stateHelper.requestState !=
                nextState.stateHelper.requestState),
        listener: (context, state) async {
          final bool isLoading =
              (state.stateHelper.requestState == RequestState.LOADING);
          LoadingDialog.setIsLoading(context, isLoading);
          if (!isLoading) {
            if (state.stateHelper.requestState == RequestState.SUCCESS) {
              Navigator.pop(context);
            }
            if (state.stateHelper.requestState == RequestState.ERROR) {
              //showToast(msg: state.stateHelper.errorMessage ?? "");
              AddressWidgetsErrorHandler(state: state)();
            }
          }
        },
        builder: (context, state) {
          final AddressWidgetsBloc addressWidgetsBloc =
              BlocProvider.of<AddressWidgetsBloc>(context);
          return DropDownTextField<CityEntity>(
            label: "city".tr(),
            inputController: TextEditingController(
                text: selectedCityEntity != null
                    ? (Localization.isEnglish()
                        ? selectedCityEntity!.nameEn
                        : selectedCityEntity!.nameAr)
                    : ""),
            onSelected: onSelected,
            items: addressWidgetsBloc.cityEntityList.isNotEmpty
                ? List.generate(addressWidgetsBloc.cityEntityList.length,
                    (index) {
                    final CityEntity city =
                        addressWidgetsBloc.cityEntityList[index];
                    return city;
                  })
                : [],
            getItemName: (val) {
              return Localization.isEnglish() ? val.nameEn : val.nameAr;
            },
            getIsSelectedItem: (val) {
              return val == selectedCityEntity;
            },
            showSearch: true,
            onSearch: (val, searchStr) {
              log("$searchStr", name: "cities");
              return (Localization.isEnglish() ? val.nameEn : val.nameAr)
                  .contains(searchStr);
            },
          );
        },
      ),
    );
  }
}
