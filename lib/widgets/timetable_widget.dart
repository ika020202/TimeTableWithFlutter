import 'package:flutter/material.dart';
import "package:timetable_flutter/setting/setting_value.dart";
import "dayof_week.dart";
import "periods_week.dart";
import "cell.dart";

class TimetableWidget extends StatelessWidget {
  const TimetableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            // 曜日の設定
            const DayOfWeek(),
            Row(
              children: [
                // 横の時間割(1~5とか)の設定
                const PeriodsWeek(),
                Expanded(
                  child: Container(
                    child: Table(
                      //border: TableBorder.all(color: colors.border),
                      children: List<TableRow>.generate(
                        SettingVal.periods_val.length,
                        (i) => TableRow(
                          children: List<Widget>.generate(
                            SettingVal.days_val.length,
                            (j) => (CellWidget(
                              // セルのインデックス番号はX_Yの形式で扱う。
                              cellXY: "$i" + "_" + "$j",
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: SettingVal.sideBlank),
              ],
            )
          ],
        ),
      ],
    );
  }
}
