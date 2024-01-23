import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  int? statusCode;
  String? statusMessage;
  bool? success;

  ErrorMessageModel({this.statusCode, this.statusMessage, this.success});

  ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['status_message'] = statusMessage;
    data['success'] = success;
    return data;
  }

  @override
  List<Object?> get props => [statusCode, statusMessage, success];
}