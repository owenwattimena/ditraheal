part of 'models.dart';

class StatBar {
  final String? tanggalTreatment;
  final int? totalTreatment, totalChecked;

  StatBar({this.tanggalTreatment, this.totalTreatment, this.totalChecked});

  factory StatBar.toObejct({String? tanggal, int? total, int? checked}) {
    return StatBar(
        tanggalTreatment: tanggal,
        totalTreatment: total,
        totalChecked: checked);
  }
}

List<StatBar> list = [
  StatBar(tanggalTreatment: "2023-01-01", totalTreatment: 75, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-02", totalTreatment: 45, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-03", totalTreatment: 45, totalChecked: 22),
  StatBar(tanggalTreatment: "2023-01-01", totalTreatment: 75, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-02", totalTreatment: 45, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-03", totalTreatment: 45, totalChecked: 22),
  StatBar(tanggalTreatment: "2023-01-01", totalTreatment: 75, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-02", totalTreatment: 45, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-03", totalTreatment: 45, totalChecked: 22),
  StatBar(tanggalTreatment: "2023-01-01", totalTreatment: 75, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-02", totalTreatment: 45, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-03", totalTreatment: 45, totalChecked: 22),
  StatBar(tanggalTreatment: "2023-01-01", totalTreatment: 75, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-02", totalTreatment: 45, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-01", totalTreatment: 75, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-02", totalTreatment: 45, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-03", totalTreatment: 45, totalChecked: 22),
  StatBar(tanggalTreatment: "2023-01-01", totalTreatment: 75, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-02", totalTreatment: 45, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-03", totalTreatment: 45, totalChecked: 22),
  StatBar(tanggalTreatment: "2023-01-01", totalTreatment: 75, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-02", totalTreatment: 45, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-03", totalTreatment: 45, totalChecked: 22),
  StatBar(tanggalTreatment: "2023-01-01", totalTreatment: 75, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-02", totalTreatment: 45, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-03", totalTreatment: 45, totalChecked: 22),
  StatBar(tanggalTreatment: "2023-01-01", totalTreatment: 75, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-02", totalTreatment: 45, totalChecked: 12),
  StatBar(tanggalTreatment: "2023-01-03", totalTreatment: 45, totalChecked: 22),
];
