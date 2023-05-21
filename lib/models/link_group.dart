part of "models.dart";

class LinkGroup{
  final String title,link;

  LinkGroup(this.title, this.link);

  factory LinkGroup.fromJson(Map<String, dynamic> json) => LinkGroup(json['title'], json['link']);
}