import 'package:azkar_app_flutter/models/prayer_time_model.dart';
import 'package:azkar_app_flutter/services/prayer_times_service.dart';
import 'package:flutter/material.dart';

class PrayerTimesViewModel with ChangeNotifier {
  final PrayerTimesService service = PrayerTimesService();
  List<PrayerTime> _times;
  Future<void> fetchTimingsOfToday() async {
    try {
      await service.getLocation();
      Map<String, dynamic> prayerTimes =
          await service.fetchPrayerTimesOfToday();
      _times = [];
      prayerTimes.forEach((key, value) => _times.add(PrayerTime(key, value)));
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<PrayerTime> get times => _times;

}
