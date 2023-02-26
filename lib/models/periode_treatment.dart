class PeriodeTreatment {
  final int? id;
  final String? tanggalAwal,
      tanggalAkhir,
      levelTrauma,
      tanggalAwalTreatment,
      tanggalSedangTreatment,
      tanggalAkhirTreatment;

  PeriodeTreatment(
      {this.id,
      this.tanggalAwal,
      this.tanggalAkhir,
      this.levelTrauma,
      this.tanggalAwalTreatment,
      this.tanggalSedangTreatment,
      this.tanggalAkhirTreatment});

  factory PeriodeTreatment.fromJson(Map<String, dynamic> json) {
    return PeriodeTreatment(
      id: json['id'],
      tanggalAwal: json['tanggal_awal'],
      tanggalAkhir: json['tanggal_akhir'],
      levelTrauma: json['level_trauma'],
      tanggalAwalTreatment: json['tanggal_awal_treatment'],
      tanggalSedangTreatment: json['tanggal_sedang_treatment'],
      tanggalAkhirTreatment: json['tanggal_akhir_treatment'],
    );
  }
}
