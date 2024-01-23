import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  final String failureMessage;

  Failure({this.failureMessage=""});

  @override
  List<Object?> get props => [failureMessage];
}