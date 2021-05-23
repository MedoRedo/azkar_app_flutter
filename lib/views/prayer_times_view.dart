import 'package:azkar_app_flutter/models/prayer_time_model.dart';
import 'package:azkar_app_flutter/viewModels/prayer_times_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrayerTimesView extends StatelessWidget {
  Future<List<PrayerTime>> getData(BuildContext context) async{
    await context.read<PrayerTimesViewModel>().fetchTimingsOfToday();
    return context.read<PrayerTimesViewModel>().times;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getData(context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              {
                return Center(child: CircularProgressIndicator());
              }

            default:
              {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      PrayerTime time = snapshot.data[index];
                      return Card(
                        child: ListTile(
                          title: Text(time.name),
                          trailing: Text(time.time_12),
                        ),
                      );
                    },
                    itemCount: snapshot.data.length,
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }
          }
        },
      ),
    );
  }
}
