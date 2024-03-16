import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final String id, title, description, date;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  NotificationEntity copyWith({
    String? id,
    String? title,
    String? description,
    String? date,
  }) {
    return NotificationEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  @override
  List<Object> get props => [id];
}