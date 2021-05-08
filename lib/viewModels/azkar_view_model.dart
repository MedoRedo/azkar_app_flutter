import 'package:azkar_app_flutter/models/azkar_model.dart';
import 'package:azkar_app_flutter/models/zekr_model.dart';
import 'package:azkar_app_flutter/services/azkar_service.dart';
import 'package:flutter/material.dart';

class AzkarViewModel with ChangeNotifier {
  String _title;
  List<Zekr> _azkarList;

  Future<void> fetchAzkar(String type) async {
    Azkar azkar = await AzkarService().fetchAzkar(type);
    _title = azkar.title;
    _azkarList = azkar.azkarList;
    notifyListeners();
  }

  void decrementRepeat(Zekr zekr) {
    if (--zekr.repeat == 0) _azkarList.remove(zekr);
    notifyListeners();
  }

  String get title => _title;
  List<Zekr> get azkarList => _azkarList;
  int get azkarNumber => _azkarList.length;
}
