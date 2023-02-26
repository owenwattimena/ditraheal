part of 'models.dart';

class Hobby {
  final int? id;
  final String? imagePath;
  final String? title;

  Hobby({this.id, this.imagePath, this.title});

  factory Hobby.fromJson(Map<String, dynamic> json) {
    String? imagePath;
    switch (json['deskripsi']) {
      case "Art/Seni":
        imagePath = "assets/images/seni_hobi_icon.png";
        break;
      case "Musik":
        imagePath = "assets/images/seni_hobi_icon.png";
        break;
      case "Membaca/Menonton":
        imagePath = "assets/images/baca_hobi_icon.png";
        break;
      case "Olahraga":
        imagePath = "assets/images/olahraga_hobi_icon.png";
        break;
      default:
        imagePath = "assets/images/olahraga_hobi_icon.png";
        break;

    }
    return Hobby(
      id : json['id'] as int,
      /*json['image_path'] as String*/ imagePath : imagePath,
      title :json['deskripsi'] as String,
    );
  }
}