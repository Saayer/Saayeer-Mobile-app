part of 'get_started_bloc.dart';

@immutable
class GetStartedState extends Equatable {
  final RequestState requestState;
  final UserStatus userStatus;
  final SocialLoginEntity? socialLoginEntity;
  final String? errorMessage, successMessage;

  GetStartedState(
      {this.requestState = RequestState.LOADED,
      this.userStatus = UserStatus.GUEST,
      this.socialLoginEntity,
      this.errorMessage = "Something went wrong",
      this.successMessage});

  GetStartedState copyWith(
      {RequestState? requestState,
      UserStatus? userStatus,
      SocialLoginEntity? socialLoginEntity,
      String? errorMessage,
      String? successMessage}) {
    return GetStartedState(
        requestState: requestState ?? this.requestState,
        userStatus: userStatus ?? this.userStatus,
        socialLoginEntity: socialLoginEntity ?? this.socialLoginEntity,
        errorMessage: errorMessage ?? this.errorMessage,
        successMessage: successMessage??this.successMessage
    );
  }

  @override
  List<Object> get props => [requestState, userStatus];
}
