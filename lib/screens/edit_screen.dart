import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetable_flutter/components/setting_value.dart';
import 'package:timetable_flutter/widgets/color_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetable_flutter/providers.dart';

class EditScreen extends ConsumerStatefulWidget {
  const EditScreen({super.key});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends ConsumerState<EditScreen> {
  @override
  Widget build(BuildContext context) {
    // DBや現在表示しているセル情報を取得
    // hiveDB
    final db = ref.watch(cellProvider);
    // 今のセル番号がX_Y形式で入っている
    final currentCell = ref.read(currentCellIndexProvider.notifier);
    final currentValuesNotifier = ref.read(currentCellValueProvider.notifier);

    // 今のセルからDBを取得する。（pushnamedは上手くいかなかった）
    final cellData = db.get(currentCell.state);

    final classText = cellData?.className ?? "";
    final teacherText = cellData?.teacherName ?? "";
    final roomText = cellData?.classRoomName ?? "";
    // HiveはColorをそのまま保存できず、int型に変換して保存している。
    final cellColorInt =
        cellData?.containerColor ?? ColorList.defaultProp.value;

    final appBarTitle = SettingVal.indexToDayPeriod["${currentCell.state}"];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBarTitle ?? "Debug | None index value",
          style: const TextStyle(color: ColorList.black),
        ),
        backgroundColor: Color(cellColorInt),
        leading: IconButton(
          padding: const EdgeInsets.only(bottom: 10.0),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 30.0,
            color: ColorList.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: ColorList.haikei,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(24.0),
                  height: 400.0,
                  decoration: BoxDecoration(
                    color: ColorList.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorList.shadow,
                        offset: Offset(3.0, 4.0),
                        blurRadius: 4.0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ColorButton(someColor: Color(cellColorInt)),
                      Text(
                        classText,
                        style: const TextStyle(fontSize: 30),
                        maxLines: 3,
                      ),
                      Text(
                        roomText,
                        style: const TextStyle(fontSize: 24),
                        maxLines: 2,
                      ),
                      Text(
                        teacherText,
                        style: const TextStyle(fontSize: 24),
                        maxLines: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: ColorList.black,
                            iconSize: 45,
                            onPressed: () {
                              currentValuesNotifier.changeClass(classText);
                              currentValuesNotifier.changeRoom(roomText);
                              currentValuesNotifier.changeTeacher(teacherText);
                              currentValuesNotifier.changeColor(cellColorInt);
                              Navigator.pushNamed(context, "/regis");
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            color: ColorList.black,
                            iconSize: 45,
                            onPressed: () {
                              // HiveのDBから削除コマンド
                              db.delete(currentCell.state);
                              Navigator.of(context)
                                  .pushReplacementNamed("/timetable");
                            },
                          ),
                        ],
                      ),
                    ],
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
