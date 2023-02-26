part of "models.dart";

class UpdateScoreTest{
  final int? totalScoreEfikasi;
  final int? totalLevelTrauma;
  final int? totalScorePostEfiaksi;
  final String? levelTrauma;

  UpdateScoreTest({this.totalLevelTrauma, this.totalScoreEfikasi, this.totalScorePostEfiaksi, this.levelTrauma});

  factory UpdateScoreTest.fromJson(Map<String,dynamic> json) {
    return UpdateScoreTest(totalLevelTrauma: json['pre_test']['total_level_trauma_id'], totalScoreEfikasi: json['pre_test']['total_skor_efikasi'], totalScorePostEfiaksi: json['pre_test']['post_test_efikasi'], levelTrauma: json['generate_lvl_trauma']);
}}