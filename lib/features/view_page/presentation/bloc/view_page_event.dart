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


