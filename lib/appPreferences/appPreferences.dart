import 'package:hive_flutter/hive_flutter.dart';

class AppPreferences {
  static late Box dataBox;
  static Future<void> initHive() async {
    await Hive.initFlutter();
    dataBox = await Hive.openBox("data");
  }

  static bool get darkMode => dataBox.get("darkMode") ?? false;
  static set darkMode(bool value) => dataBox.put("darkMode", value);
}
