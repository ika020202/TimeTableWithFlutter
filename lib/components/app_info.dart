import 'dart:io' show Platform;
import 'package:flutter/material.dart';

/* 開発メモ：
--アプリを更新したら必ず変えるファイル--
  pubspec.yaml
  constants.dart
--アプリを更新したら必ず変えるファイル--
*/

const appVersion = 'v1.0';
const appName = 'Timetable';
final kAppIcon =
    Image.asset('res/images/launcher_icon.png', height: 64.0, width: 64.0);
const appDescription =
    'このアプリケーションはFlutterを用いて個人開発されています。' + '\n\nDeveloped by MKairi';
const googlePlayURL = '';
const appStoreURL = '';
const githubURL = 'https://github.com/ika020202';
const zennSite = 'https://zenn.dev/urasan';
const twitterSite = "https://twitter.com/urasan_edu";

// Whether the app is running on mobile phones (Android/iOS)
final kIsOnMobile = Platform.isAndroid || Platform.isIOS;
