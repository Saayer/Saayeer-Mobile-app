import 'package:equatable/equatable.dart';
import 'package:saayer/core/utils/enums.dart';

class SocialLoginEntity extends Equatable {
  final String? displayName, email, photoURL;
  final UserConnectWay? connectWay;
  final bool? isNewUser;

  SocialLoginEntity(
      {this.displayName,
      this.email,
      this.photoURL,
      this.isNewUser,
      this.connectWay = UserConnectWay.MANUAL});

  @override
  List<Object?> get props =>
      [displayName, photoURL, email, isNewUser, connectWay];
}
