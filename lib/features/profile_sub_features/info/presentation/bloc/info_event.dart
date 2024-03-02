part of 'info_bloc.dart';

abstract class InfoEvent extends Equatable {
  const InfoEvent();
}

class InitInfo extends InfoEvent {
  final InfoEntity infoEntity;

  const InitInfo({required this.infoEntity});

  @override
  List<Object> get props => [infoEntity];
}
