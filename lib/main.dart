import 'package:flutter/material.dart';
import 'package:timetable_flutter/screens/edit_screen.dart';
import 'package:timetable_flutter/screens/settingPage/this_appinfo_screen.dart';
import 'package:timetable_flutter/screens/settingPage/todo_Schedules.dart';
import 'package:timetable_flutter/screens/setting_screen.dart';
import "package:timetable_flutter/screens/timetable_screen.dart";
import 'screens/registering_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import "model/hive_models.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CellModelAdapter());
  Hive.registerAdapter(PeriodModelAdapter());

  var getCellBox = await Hive.openBox<CellModel>("cell");
  var getPeriodsBox = await Hive.openBox<PeriodModel>("periods");

  runApp(
    ProviderScope(
      overrides: [
        // awaitが終わったら、providerの値を上書きする。
        cellProvider.overrideWithValue(getCellBox),
        periodsProvider.overrideWithValue(getPeriodsBox),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSansJP',
      ),
      debugShowCheckedModeBanner: false,
      //initialRoute: '/timetable',
      routes: <String, WidgetBuilder>{
        "/timetable": (BuildContext context) => const TimetableScreen(),
        "/regis": (BuildContext context) => const RegisteringScreen(),
        "/edit": (BuildContext context) => const EditScreen(),
        "/setting": (BuildContext context) => const SettingScreen(),
        "/ThisAppInfo": (BuildContext context) => const ThisAppInfoPage(),
        "/UpdateSchedules": (BuildContext context) => const UpdateSchedules(),
      },
      //theme: AppTheme.lightTheme,
      home: const TimetableScreen(),
    );
  }
}
