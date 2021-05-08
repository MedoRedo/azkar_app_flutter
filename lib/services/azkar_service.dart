import 'dart:convert';

import 'package:azkar_app_flutter/models/azkar_model.dart';
import 'package:flutter/services.dart';

class AzkarService {
  Future<Azkar> fetchAzkar(String type) async {
    String jsonString =
        await rootBundle.loadString('assets/azkar_text/$type.json');
    var data = jsonDecode(jsonString);
    return Azkar.fromJson(data);
  }
}
