import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class PrayerTimesService {
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  Future<Map<String, dynamic>> fetchPrayerTimesOfToday() async {
    var longitude = _locationData.longitude;
    var latitude = _locationData.latitude;
    var elevation = _locationData.altitude;

    var url = Uri.parse(
        'https://api.pray.zone/v2/times/today.json?longitude=$longitude&latitude=$latitude&elevation=$elevation');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['results']['datetime'][0]['times'];
    }
    return null;
  }

  Future<void> getLocation() async {
    Location location = new Location();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }
}
