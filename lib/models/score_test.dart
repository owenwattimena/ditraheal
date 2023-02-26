part of "models.dart";

class ScoreTest{
  final int? totalScoreEfikasi;
  final int? totalLevelTrauma;
  final int? postTestEfikasi;
  final String? levelTrauma;

  ScoreTest({this.totalLevelTrauma, this.totalScoreEfikasi, this.postTestEfikasi, this.levelTrauma});

  factory ScoreTest.fromJson(Map<String,dynamic> json) {
    return ScoreTest(totalLevelTrauma: json['skor']['total_level_trauma_id'], totalScoreEfikasi: json['skor']['total_skor_efikasi'], postTestEfikasi: json['skor']['post_test_efikasi'], levelTrauma: json['generate_lvl_trauma']);
}}