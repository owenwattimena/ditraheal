part of 'models.dart';

class Question{
  final int id;
  final String question;
  Question(this.id, this.question);

  factory Question.fromJson(Map<String, dynamic> json)
    => Question(json['id'], json['deskripsi']);
}