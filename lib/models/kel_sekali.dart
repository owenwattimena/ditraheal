class KelSekali {
  final int id;
  final String treatKelompokSekali;
  bool checklist;

  KelSekali(this.id, this.treatKelompokSekali, this.checklist);

  factory KelSekali.fromMap( Map<String, dynamic> map ) => KelSekali(map['id'], map['treat_kelompok_sekali'], map['checklist']);
}