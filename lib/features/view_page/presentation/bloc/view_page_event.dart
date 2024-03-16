part of 'view_page_bloc.dart';

@immutable
abstract class ViewPageEvent extends Equatable {
  const ViewPageEvent();
}

class InitViewPage extends ViewPageEvent {
  final NavBarIconTypes navBarIconType;
  const InitViewPage({required this.navBarIconType});

  @override
  List<Object?> get props => [navBarIconType];
}

class GoToPage extends ViewPageEvent {
  final NavBarIconTypes navBarIconType;

  const GoToPage({required this.navBarIconType});

  @override
  List<Object?> get props => [navBarIconType];
}

class Refresh extends ViewPageEvent {
  @override
  List<Object> get props => [];
}
