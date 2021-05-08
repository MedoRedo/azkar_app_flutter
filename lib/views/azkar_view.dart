import 'package:azkar_app_flutter/models/zekr_model.dart';
import 'package:azkar_app_flutter/viewModels/azkar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:provider/provider.dart';

class AzkarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AzkarViewModel>(
      builder: (context, azkar, child) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(azkar.title),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              final Zekr zekr = azkar.azkarList[index];
              return ZekrCard(zekr: zekr);
            },
            itemCount: azkar.azkarNumber,
          ),
        );
      },
    );
  }
}

class ZekrCard extends StatelessWidget {
  const ZekrCard({
    Key key,
    @required this.zekr,
  }) : super(key: key);

  final Zekr zekr;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AzkarViewModel>().decrementRepeat(zekr);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                zekr.zekrText,
                style: TextStyle(
                  fontFamily: ArabicFonts.Amiri,
                  package: 'google_fonts_arabic',
                  fontSize: 25.0,
                ),
              ),
              Row(
                children: [
                  Text(
                    'التكرار',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: ArabicFonts.Mada,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                    width: 50.0,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        zekr.repeat.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Text(
                zekr.bless,
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: ArabicFonts.Changa,
                  package: 'google_fonts_arabic',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
