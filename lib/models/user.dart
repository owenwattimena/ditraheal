part of 'models.dart';

class User {
  final int? id, follower, hobby;
  final String? phoneNumber, birthDate, address;
  final String name;

  User({this.id, this.follower, this.hobby, this.phoneNumber, this.birthDate, this.address, this.name = ""});

  User copyWith({
    int? id,
    int? follower,
    int? hobby,
    String? phoneNumber,
    String? birthDate,
    String? address,
    String? name,
  }) =>
      User(
        id: id ?? this.id,
        follower: follower ?? this.follower,
        hobby: hobby ?? this.hobby,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        birthDate: birthDate ?? this.birthDate,
        address: address ?? this.address,
        name: name ?? this.name,
      );
}
