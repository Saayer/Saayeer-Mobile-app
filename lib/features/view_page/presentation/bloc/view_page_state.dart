part of 'view_page_bloc.dart';

@immutable
class ViewPageState extends Equatable {
  final RequestState requestState;
  final int selectedPage;
  final bool isSliderOpened;

  ViewPageState(
      {this.requestState = RequestState.LOADING,
      this.selectedPage = 0,
      this.isSliderOpened = false});

  ViewPageState copyWith(
      {RequestState? requestState, int? selectedPage, bool? isSliderOpened}) {
    return ViewPageState(
        requestState: requestState ?? this.requestState,
        selectedPage: selectedPage ?? this.selectedPage,
        isSliderOpened: isSliderOpened ?? this.isSliderOpened);
  }

  @override
  List<Object> get props => [requestState, selectedPage, isSliderOpened];
}
