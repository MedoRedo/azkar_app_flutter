class Zekr {
  final String zekrText;
  int repeat;
  final String bless;

  Zekr({this.zekrText, this.bless, this.repeat});

  factory Zekr.fromJson(Map<String, dynamic> jsonData) {
    return Zekr(
      zekrText: jsonData['zekr'],
      repeat: jsonData['repeat'],
      bless: jsonData['bless'],
    );
  }

  @override
  String toString() {
    return 'zekr: $zekrText\nrepeat: $repeat\nbless: $bless\n';
  }
}
