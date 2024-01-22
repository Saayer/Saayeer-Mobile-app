part of 'view_page_bloc.dart';

@immutable
abstract class ViewPageEvent extends Equatable {
  const ViewPageEvent();
}
class InitViewPage extends ViewPageEvent {
  const InitViewPage();

  @override
  List<Object?> get props => [];
}

class ToggleSlider extends ViewPageEvent {
  final bool? isOpened;
  const ToggleSlider({this.isOpened});

  @override
  List<Object?> get props => [isOpened];
}

class GoToPage extends ViewPageEvent {
  final PageController? pageController;
  final int? pageIndex;

  const GoToPage({this.pageController, this.pageIndex});

  @override
  List<Object?> get props => [pageController,pageIndex];
}
