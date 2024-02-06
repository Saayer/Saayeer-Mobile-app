part of 'store_info_bloc.dart';

abstract class StoreInfoEvent extends Equatable {
  const StoreInfoEvent();
}

class OnTextChange extends StoreInfoEvent {
  final TextEditingController? textEditingController;
  final String? str;
  final StoreInfoFieldsTypes storeInfoFieldsType;

  const OnTextChange({
    this.textEditingController,
    this.str,
    required this.storeInfoFieldsType,
  });

  @override
  List<Object?> get props => [textEditingController, str, storeInfoFieldsType];
}

class SubmitStoreInfoData extends StoreInfoEvent {
  @override
  List<Object?> get props => [];
}

class ToggleAutoValidate extends StoreInfoEvent {
  @override
  List<Object?> get props => [];
}

class SubmitStoreInfo extends StoreInfoEvent {
  @override
  List<Object?> get props => [];
}
