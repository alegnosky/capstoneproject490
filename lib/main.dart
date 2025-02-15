import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_capstone/Screens/HomeScreen.dart';
import 'package:vpn_capstone/appPreferences/appPreferences.dart';

late Size screenSize;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppPreferences.initHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Capstone - VPN',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              centerTitle: true, elevation: 3
          ),
      ),
      themeMode: AppPreferences.darkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(

              centerTitle: true, elevation: 3
          ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

extension AppTheme on ThemeData{
  Color get lightTextColor => AppPreferences.darkMode ? Colors.white70 : Colors.black54;
  Color get bottomNavigationColor => AppPreferences.darkMode ? Colors.white70 : Colors.blueGrey;
}
