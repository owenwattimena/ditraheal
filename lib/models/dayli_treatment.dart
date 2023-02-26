part of 'models.dart';

class DayliTreatment{
  final DateTime? tanggal;
  final int? id;
  final int? treat;
  final String? deskripsi;
  final int? refSesi;
  final String? ruleBase;
  final int? periodeId;
  bool? checklist;

  DayliTreatment({this.tanggal, this.id, this.treat, this.deskripsi, this.refSesi, this.ruleBase, this.periodeId, this.checklist});

  factory DayliTreatment.fromMap(Map<String, dynamic> map)
  {
    return DayliTreatment(
      tanggal: DateTime.parse(map['tanggal']),
      id: map['id'],
      treat: map['treat'],
      deskripsi: map['deskripsi'],
      refSesi: map['ref_sesi'],
      ruleBase: map['rule_base'],
      periodeId: map['periode_treatment_id'],
      checklist: map['checklist']
    );
  }

  DayliTreatment copyWith({bool? checklist}) => DayliTreatment(
    id: this.id,
    tanggal: this.tanggal,
    treat: this.treat,
    deskripsi: this.deskripsi,
    refSesi: this.refSesi,
    ruleBase: this.ruleBase,
    periodeId: this.periodeId,
    checklist: checklist ?? this.checklist,
  );
}