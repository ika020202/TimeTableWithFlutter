import 'package:flutter/material.dart';
import 'package:timetable_flutter/components/setting_value.dart';

import 'package:timetable_flutter/widgets/classDetails_textfield.dart';
import 'package:timetable_flutter/widgets/colorSelect_container.dart';
import 'package:timetable_flutter/model/hive_models.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetable_flutter/providers.dart';

class RegisteringScreen extends ConsumerWidget {
  const RegisteringScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // DBや現在表示しているセル情報を取得
    final db = ref.watch(cellProvider);
    final currentCell = ref.read(currentCellIndexProvider.notifier);

    final currentValuesNotifier = ref.watch(currentCellValueProvider.notifier);
    final currentValues = ref.watch(currentCellValueProvider);

    // 今のセルからDBを取得する。（pushnamedは上手くいかなかった）
    // edit画面からこの画面にうつる可能性がある。＊編集をこの画面で行うから
    // cellDataをとっている理由＊データを取れたら入力フィールドの初期値として渡すから
    // 空白のセルからきた時はcellDataに入っているclassName teacherName classRoomNameがnullなので空白を入れてる
    final cellData = db.get(currentCell.state);

    final classText = cellData?.className ?? "";
    final teacherText = cellData?.teacherName ?? "";
    final roomText = cellData?.classRoomName ?? "";

    final appBarTitle = SettingVal.indexToDayPeriod["${currentCell.state}"];
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();

        // すぐに初期化すると、遷移中に色が変更されて不自然
        await Future.delayed(const Duration(milliseconds: 300));
        // 初期化メソッド
        currentValuesNotifier.init();

        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(currentValues.colorInt),
          centerTitle: true,
          title: Text(
            appBarTitle ?? "Debug | None index value",
            style: const TextStyle(color: ColorList.black),
          ),
          leading: IconButton(
            padding: const EdgeInsets.only(left: 10.0),
            icon: const Icon(
              Icons.clear,
              size: 30.0,
              color: ColorList.black,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              // すぐに初期化すると、遷移中に色が変更されて不自然
              await Future.delayed(const Duration(milliseconds: 300));
              // 初期化
              currentValuesNotifier.init();
            },
          ),
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(right: 10.0),
              icon: const Icon(
                Icons.check,
                size: 30.0,
                color: ColorList.black,
              ),
              // ここに保存処理
              onPressed: () async {
                if (currentValues.className == "") {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text("値が空欄です"),
                        content: const Text("Classに何も入力されていません。"),
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
                } else {
                  var newCell = CellModel(
                    // 時間割を追加する時のために先に作っといた。0はとりあえず入れてる
                    screenNo: 0,
                    indexNo: currentCell.state,
                    className: currentValues.className,
                    teacherName: currentValues.teacherName,
                    classRoomName: currentValues.roomName,
                    containerColor: currentValues.colorInt,
                  );

                  // hiveに保存
                  db.put(currentCell.state, newCell);

                  // popではない
                  Navigator.of(context).pushReplacementNamed("/timetable");
                  await Future.delayed(const Duration(milliseconds: 300));

                  // 初期化
                  currentValuesNotifier.init();
                }
              },
            ),
          ],
        ),
        backgroundColor: ColorList.haikei,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // 科目
                ClassDetailsTextField(
                  name: '科目',
                  someIcon: Icons.book,
                  someText: classText,
                ),
                const SizedBox(
                  height: 10,
                ),
                // 教室
                ClassDetailsTextField(
                  name: "教室",
                  someIcon: Icons.location_on,
                  someText: roomText,
                ),
                const SizedBox(
                  height: 10,
                ),
                // 担当
                ClassDetailsTextField(
                  name: '担当',
                  someIcon: Icons.person,
                  someText: teacherText,
                ),
                const SizedBox(
                  height: 10,
                ),
                const ColorSelectContainer(),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 125,
                  height: 49,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorList.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    // TODO メソッドにまとめる
                    onPressed: () async {
                      if (currentValues.className == "") {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text("値が空欄です"),
                              content: const Text("科目に何も入力されていません。"),
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
                      } else {
                        var newCell = CellModel(
                          // 時間割を追加する時のために先に作っといた。0はとりあえず入れてる
                          screenNo: 0,
                          indexNo: currentCell.state,
                          className: currentValues.className,
                          teacherName: currentValues.teacherName,
                          classRoomName: currentValues.roomName,
                          containerColor: currentValues.colorInt,
                        );

                        // hiveに保存
                        db.put(currentCell.state, newCell);

                        // popではない
                        Navigator.of(context)
                            .pushReplacementNamed("/timetable");
                        await Future.delayed(const Duration(milliseconds: 300));
                        // 初期化
                        currentValuesNotifier.init();
                      }
                    },
                    child: const Text(
                      "保存",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
