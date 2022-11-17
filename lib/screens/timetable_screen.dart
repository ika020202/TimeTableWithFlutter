import 'package:flutter/material.dart';
import "package:timetable_flutter/widgets/timetable_widget.dart";
import 'package:timetable_flutter/setting/setting_value.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      /*
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "0",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "2",
          ),
        ],
        currentIndex: 0,
        //onTap: _onItemTapped,
      ),

       */
    );
  }
}
