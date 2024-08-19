import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable {
  final String name,
      status,
      totalShipments,
      balance,
      totalBills,
      totalStoreRequests;

  const UserProfileEntity({
    required this.name,
    required this.status,
    required this.totalShipments,
    required this.balance,
    required this.totalBills,
    required this.totalStoreRequests,
  });

  UserProfileEntity copyWith({
    String? name,
    String? status,
    String? totalShipments,
    String? balance,
    String? totalBills,
    String? totalStoreRequests,
  }) {
    return UserProfileEntity(
      name: name ?? this.name,
      status: status ?? this.status,
      totalShipments: totalShipments ?? this.totalShipments,
      balance: balance ?? this.balance,
      totalBills: totalBills ?? this.totalBills,
      totalStoreRequests: totalStoreRequests ?? this.totalStoreRequests,
    );
  }

  @override
  List<Object> get props =>
      [name, status, totalShipments, balance, totalBills, totalStoreRequests];
}
