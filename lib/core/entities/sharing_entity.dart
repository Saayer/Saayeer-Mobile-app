import 'package:equatable/equatable.dart';

class SharingEntity extends Equatable {
  final String title, description, imageUrl, screenName;

  SharingEntity(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.screenName});

  @override
  List<Object> get props => [title, description, imageUrl, screenName];
}
