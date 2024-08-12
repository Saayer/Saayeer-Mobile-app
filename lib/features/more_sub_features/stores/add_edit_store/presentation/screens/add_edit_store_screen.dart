import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/src/model/store_get_dto.dart';
import 'package:saayer/common/responsive/general_responsive_scaled_box_widget.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/core/utils/enums/enums.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/presentation/bloc/add_edit_store_bloc.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/presentation/pages/add_edit_store_page.dart';

class AddEditStoreScreen extends StatelessWidget {
  final AddEditStoreType addEditStoreType;
  final StoreGetDto storeDto;
  final void Function(StoreGetDto)? onBack;

  const AddEditStoreScreen({super.key, required this.addEditStoreType, required this.storeDto, this.onBack});

  @override
  Widget build(BuildContext context) {
    return GeneralResponsiveScaledBoxWidget(
      child: BlocProvider<AddEditStoreBloc>(
          create: (context) {
            final AddEditStoreBloc bloc = getIt<AddEditStoreBloc>();
            bloc.add(InitAddEditStore(isEnglish: Localization.isEnglish(), addEditStoreType: addEditStoreType));
            bloc.add(const GetCountries());
            if (addEditStoreType == AddEditStoreType.editStore) {
              bloc.add(SetValuesInEditType(storeDto: storeDto));
            }
            return bloc;
          },
          child: AddEditStorePage(
            addEditStoreType: addEditStoreType,
            storeDto: storeDto,
            onBack: onBack,
          )),
    );
  }
}
