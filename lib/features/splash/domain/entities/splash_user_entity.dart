import 'package:equatable/equatable.dart';

class SplashUserEntity extends Equatable {
  final bool? isLoggedIn;
  final bool? isSeenIntro;

  SplashUserEntity({this.isLoggedIn = false, this.isSeenIntro = false});

  @override
  List<Object?> get props => [isLoggedIn, isSeenIntro];
}
