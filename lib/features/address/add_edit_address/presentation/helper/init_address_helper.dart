import 'package:saayer/features/address/add_edit_address/presentation/bloc/add_edit_address_bloc.dart';

class InitAddressHelper {

  AddEditAddressState state;

  InitAddressHelper({
    required this.state,
  });

  void updateState(AddEditAddressState state) {
    this.state = state;
  }
}
