part of 'add_edit_store_bloc.dart';

abstract class AddEditStoreEvent extends Equatable {
  const AddEditStoreEvent();
}

class InitAddEditStore extends AddEditStoreEvent {
  final bool isEnglish;
  final AddEditStoreType addEditStoreType;

  const InitAddEditStore({
    required this.isEnglish,
    required this.addEditStoreType,
  });

  @override
  List<Object?> get props => [isEnglish, addEditStoreType];
}

class OnTextChange extends AddEditStoreEvent {
  final TextEditingController? textEditingController;
  final String? str;
  final PhoneNumber? phoneNumber;
  final StoreInfoFieldsTypes storeInfoFieldsType;

  const OnTextChange({
    this.textEditingController,
    this.str,
    this.phoneNumber,
    required this.storeInfoFieldsType,
  });

  @override
  List<Object?> get props => [
        textEditingController,
        str,
        phoneNumber,
        storeInfoFieldsType,
      ];
}

class OnItemSelectedFromDropDown<T> extends AddEditStoreEvent {
  final T item;
  final StoreInfoFieldsTypes storeInfoFieldsType;

  const OnItemSelectedFromDropDown({required this.item, required this.storeInfoFieldsType});

  @override
  List<Object?> get props => [storeInfoFieldsType];
}

class SubmitStoreInfoData extends AddEditStoreEvent {
  @override
  List<Object?> get props => [];
}

class ToggleAutoValidate extends AddEditStoreEvent {
  @override
  List<Object?> get props => [];
}

class SubmitStoreInfo extends AddEditStoreEvent {
  @override
  List<Object?> get props => [];
}

class GetCountries extends AddEditStoreEvent {
  const GetCountries();

  @override
  List<Object> get props => [];
}

class GetCities extends AddEditStoreEvent {
  const GetCities();

  @override
  List<Object> get props => [];
}

class GetGovernorates extends AddEditStoreEvent {
  const GetGovernorates();

  @override
  List<Object> get props => [];
}

class GetAreas extends AddEditStoreEvent {
  const GetAreas();

  @override
  List<Object> get props => [];
}

class SetValuesInEditType extends AddEditStoreEvent {
  final StoreGetDto storeDto;

  const SetValuesInEditType({required this.storeDto});

  @override
  List<Object> get props => [storeDto];
}

class OnUpdateStore extends AddEditStoreEvent {
  const OnUpdateStore();

  @override
  List<Object> get props => [];
}
