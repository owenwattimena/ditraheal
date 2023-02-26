part of 'models.dart';

class PostTreatment {
  final String? levelTrauma;
  final int? rule;

  PostTreatment({this.levelTrauma, this.rule});

  factory PostTreatment.fromJson(Map<String, dynamic> json) =>
      PostTreatment(levelTrauma: json['level_trauma'], rule: json['rule']);
}
