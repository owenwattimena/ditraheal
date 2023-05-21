part of 'models.dart';

class User {
  final int? id, follower, hobby;
  final String? phoneNumber, birthDate, address;
  final String? name;

  User({this.id, this.follower, this.hobby, this.phoneNumber, this.birthDate, this.address, this.name});

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
        // followers: followers ?? this.followers,
        hobby: hobby ?? this.hobby,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        birthDate: birthDate ?? this.birthDate,
        address: address ?? this.address,
        name: name ?? this.name,
      );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      // follower: json['fb_follower_id'],
      follower: json['follower'],
      hobby: json['hobi'],
      phoneNumber: json['no_hp'],
      birthDate: json['tanggal_lahir'],
      address: json['alamat'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "name": this.name,
      "no_hp": this.phoneNumber,
      "tanggal_lahir": this.birthDate,
      "alamat": this.address,
      "follower": this.follower,
      "hobi": this.hobby,
    };
  }

  @override
  String toString()
  {
    return "ID : $id - NAME : $name - HP : $phoneNumber - TL : $birthDate - ADD : $address - FOLL : $follower - HOBI : $hobby";
  }
  
}
