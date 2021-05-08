import 'package:azkar_app_flutter/constants.dart';
import 'package:azkar_app_flutter/viewModels/azkar_view_model.dart';
import 'package:azkar_app_flutter/views/azkar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  Future<void> getData(BuildContext context, String type) async {
    await context.read<AzkarViewModel>().fetchAzkar(type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('أذكار المسلم'),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.all(4.0),
            children: [
              DrawerHeader(
                child: Image.asset('assets/images/azkar.png'),
              ),
              ListTile(
                title: Text('أذكار الصباح'),
                onTap: () async {
                  Navigator.pop(context);
                  await getData(context, kAzkarSabah);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AzkarView(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('أذكار المساء'),
                onTap: () async {
                  Navigator.pop(context);
                  await getData(context, kAzkarMassa);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AzkarView(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('أذكار الصلاة'),
                onTap: () async {
                  Navigator.pop(context);
                  await getData(context, kPostPrayerAzkar);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AzkarView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
