part of "models.dart";

class UpdateScorePostTest{
  final int? totalScoreEfikasi;
  final int? totalLevelTrauma;
  final int? totalScorePostEfiaksi;

  UpdateScorePostTest({this.totalLevelTrauma, this.totalScoreEfikasi, this.totalScorePostEfiaksi});

  factory UpdateScorePostTest.fromJson(Map<String,dynamic> json) {
    return UpdateScorePostTest(totalLevelTrauma: json['total_level_trauma_id'], totalScoreEfikasi: json['total_skor_efikasi'], totalScorePostEfiaksi: json['post_test_efikasi']);
}}