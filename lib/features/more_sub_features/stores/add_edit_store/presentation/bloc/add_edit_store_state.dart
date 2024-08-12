part of 'add_edit_store_bloc.dart';

@immutable
class AddEditStoreState extends Equatable {
  final StateHelper stateHelper;
  final AutovalidateMode autoValidateMode;
  final StoreAddDto? storeAddDto;
  final StoreGetDto? storeGetDto;
  final AddEditStoreType? addEditStoreType;
  final int? countryId;
  final int? governorateId;
  final int? cityId;
  final int? storeId;

  const AddEditStoreState({
    this.stateHelper = const StateHelper(requestState: RequestState.LOADED),
    this.autoValidateMode = AutovalidateMode.disabled,
    this.storeAddDto,
    this.storeGetDto,
    this.addEditStoreType,
    this.countryId,
    this.governorateId,
    this.cityId,
    this.storeId,
  });

  AddEditStoreState copyWith({
    StateHelper? stateHelper,
    AutovalidateMode? autoValidateMode,
    StoreAddDto? storeAddDto,
    StoreGetDto? storeGetDto,
    AddEditStoreType? addEditStoreType,
    int? countryId,
    int? governorateId,
    int? cityId,
    int? storeId,
  }) {
    return AddEditStoreState(
      stateHelper: stateHelper ?? this.stateHelper,
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      storeAddDto: storeAddDto ?? this.storeAddDto,
      storeGetDto: storeGetDto ?? this.storeGetDto,
      addEditStoreType: addEditStoreType ?? this.addEditStoreType,
      countryId: countryId ?? this.countryId,
      governorateId: governorateId ?? this.governorateId,
      cityId: cityId ?? this.cityId,
      storeId: storeId ?? this.storeId,
    );
  }

  @override
  List<Object?> get props => [
        stateHelper,
        autoValidateMode,
        storeAddDto,
        storeGetDto,
        addEditStoreType,
        countryId,
        governorateId,
        cityId,
        storeId
      ];
}
