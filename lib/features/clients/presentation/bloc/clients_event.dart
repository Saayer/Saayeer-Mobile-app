part of 'clients_bloc.dart';

abstract class ClientsEvent extends Equatable {
  const ClientsEvent();
}

class GetClientsListByFilter extends ClientsEvent {
  const GetClientsListByFilter();

  @override
  List<Object> get props => [];
}

class RefreshClients extends ClientsEvent {
  @override
  List<Object> get props => [];
}

class ResetClientsList extends ClientsEvent {
  const ResetClientsList();

  @override
  List<Object?> get props => [];
}

class OnScrollPagination extends ClientsEvent {
  const OnScrollPagination();

  @override
  List<Object?> get props => [];
}

class OnTextChange extends ClientsEvent {
  final TextEditingController? textEditingController;
  final PhoneNumber? phoneNumber;
  final ClientsFilterTypes clientsFilterTypes;

  const OnTextChange({
    this.textEditingController,
    required this.clientsFilterTypes,
    this.phoneNumber,
  }) : assert(clientsFilterTypes == ClientsFilterTypes.MOBILE ? phoneNumber != null : phoneNumber == null);

  @override
  List<Object?> get props => [
        textEditingController,
        clientsFilterTypes,
      ];
}
