import 'package:equatable/equatable.dart';
import 'package:saayer/core/entities/logged_in_user_entity.dart';

class SubmitLogInEntity extends Equatable {
  final bool? isSuccess;
  final String? message;
  final LoggedInUserEntity? loggedInUserEntity;

  const SubmitLogInEntity(
      {this.isSuccess, this.message, this.loggedInUserEntity});

  @override
  List<Object?> get props => [isSuccess, message, loggedInUserEntity];

  SubmitLogInEntity copyWith({
    bool? isSuccess,
    String? message,
    LoggedInUserEntity? loggedInUserEntity,
  }) {
    return SubmitLogInEntity(
      isSuccess: isSuccess ?? this.isSuccess,
      message: message ?? this.message,
      loggedInUserEntity: loggedInUserEntity ?? this.loggedInUserEntity,
    );
  }
}
