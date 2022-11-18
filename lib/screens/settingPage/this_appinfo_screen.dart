import 'package:flutter/material.dart';
import 'package:timetable_flutter/components/launch_mail.dart';
import 'package:timetable_flutter/components/app_info.dart';
import 'package:timetable_flutter/components/setting_value.dart';

class ThisAppInfoPage extends StatelessWidget {
  const ThisAppInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorList.black),
        backgroundColor: ColorList.defaultProp,
        title: const Text(
          "このアプリについて",
          style: TextStyle(color: ColorList.black),
        ), // status bar brightness
      ),
      body: ListView(
        children: <Widget>[
          const ListTile(
            leading: FlutterLogo(),
            title: Text(appName),
            subtitle: Text(appVersion),
          ),
          const ListTile(
            title: Text(appDescription),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Feedback by E-mail'),
            onTap: () {
              openMailApp();
            },
          ),
          ListTile(
            leading: const Icon(Icons.face),
            title: const Text('View My Twitter'),
            onTap: () {
              launchURL(twitterSite);
            },
          ),
          ListTile(
            leading: const Icon(Icons.gamepad),
            title: const Text("View My Github"),
            onTap: () {
              launchURL(githubURL);
            },
          ),
          ListTile(
            leading: const Icon(Icons.gamepad),
            title: const Text("View My Zenn"),
            onTap: () {
              launchURL(zennSite);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
