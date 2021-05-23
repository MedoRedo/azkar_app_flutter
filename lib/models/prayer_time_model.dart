import 'package:intl/intl.dart';

class PrayerTime {
  final String _name;
  final String _time;

  PrayerTime(this._name, this._time);

  String get name => _name;
  String get time_12 => DateFormat.jm().format(DateFormat.Hm().parse(_time));

  @override
  String toString() {
    return 'PrayerTime{_name: $_name, _time: $_time}';
  }
}
