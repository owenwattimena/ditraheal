part of 'models.dart';
class FbFollower{
  final int? id;
  final String? value;
  final int? level;

  FbFollower({this.id, this.value, this.level});

  factory FbFollower.fromMap(Map<String, dynamic> map)
  {
    return FbFollower(
      id: map['id'],
      value: map['value'],
      level: map['level']
    );
  }
}