import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetable_flutter/components/setting_value.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PeriodsWeek extends StatelessWidget {
  final List<String> periods = SettingVal.periods_val;

  const PeriodsWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      /*
      decoration: BoxDecoration(
        color: ColorList.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: ColorList.shadow,
            offset: Offset(3.0, 4.0),
            blurRadius: 4.0,
          )
        ],
      ),

       */
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          periods.length,
          (i) => _PeriodCell(period: periods[i]),
        ),
      ),
    );
  }
}

class _PeriodCell extends ConsumerWidget {
  final String period;

  const _PeriodCell({required this.period});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      // タップ範囲を拡大する下のコードを付けるかchildにcolor付きコンテナを指定しないとtextしか反応しない。
      behavior: HitTestBehavior.opaque,
      /*
      onTap: () async {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text("$period限目"),
              content: Text("まだつくってるとちゅう$period"),
              actions: <Widget>[
                // ボタン領域
                ElevatedButton(
                  child: Text("はい"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      },
      */
      child: SizedBox(
        height: SettingVal.periodBoxSize_height,
        width: SettingVal.periodBoxSize_width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "",
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              period,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "",
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
