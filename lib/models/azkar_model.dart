import 'package:azkar_app_flutter/models/zekr_model.dart';

class Azkar {
  final String title;
  final List<Zekr> azkarList;

  Azkar({this.title, this.azkarList});

  factory Azkar.fromJson(Map<String, dynamic> jsonData) {
    return Azkar(
      title: jsonData['title'],
      azkarList: _parseAzkarList(jsonData['content']),
    );
  }

  static List<Zekr> _parseAzkarList(List<dynamic> list) {
    return list.map((e) => Zekr.fromJson(e)).toList();
  }

  @override
  String toString() {
    return 'Azkar{title: $title,\n azkarList: $azkarList}';
  }
}
