import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:timetable_flutter/components/launch_mail.dart';
import 'package:timetable_flutter/components/setting_value.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorList.black),
        backgroundColor: ColorList.defaultProp,
        title: const Text(
          "設定",
          style: TextStyle(color: ColorList.black),
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('その他'),
            tiles: [
              SettingsTile(
                title: const Text('このアプリについて'),
                leading: const Icon(Icons.info),
                onPressed: (context) {
                  Navigator.of(context).pushNamed("/ThisAppInfo");
                },
              ),
              SettingsTile(
                title: const Text('更新予定リスト'),
                leading: const Icon(Icons.list),
                onPressed: (context) {
                  Navigator.of(context).pushNamed("/UpdateSchedules");
                },
              ),
              SettingsTile(
                title: const Text('問い合わせ'),
                leading: const Icon(Icons.email),
                onPressed: (context) {
                  openMailApp();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
