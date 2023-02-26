class KelBerulang{
  final int id;
  final String title, key;
  bool checklist;

  KelBerulang(this.id, this.title, this.key, this.checklist);
  
  factory KelBerulang.fromMap(Map<String, dynamic> map) => KelBerulang(map['id'], map['title'], map['treatment_kelompok_berulang'], map['checklist']);
}