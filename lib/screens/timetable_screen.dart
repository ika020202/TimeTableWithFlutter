import 'package:flutter/material.dart';
import "package:timetable_flutter/widgets/timetable_widget.dart";
import 'package:timetable_flutter/components/setting_value.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(right: 10.0),
            icon: const Icon(
              Icons.settings,
              size: 30.0,
              color: ColorList.black,
            ),
            // ここに保存処理
            onPressed: () {
              Navigator.of(context).pushNamed("/setting");
            },
          ),
        ],
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'TimeTable',
          style: TextStyle(color: ColorList.black),
        ),
        backgroundColor: ColorList.haikei,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
            icon: const Icon(Icons.dehaze_rounded),
            color: ColorList.black,
            iconSize: 30,
            onPressed: () async {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text("ハンバーガーメニュー"),
                    content: const Text("作成中"),
                    actions: <Widget>[
                      // ボタン領域
                      ElevatedButton(
                        child: const Text("はい"),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
      backgroundColor: ColorList.haikei,
      body: const SafeArea(
        child: TimetableWidget(),
      ),
    );
  }
}
