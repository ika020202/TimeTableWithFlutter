import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'model/hive_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'model/currentCell_model.dart';

// Cell
final cellProvider = Provider<Box<CellModel>>((ref) {
  throw UnimplementedError();
});

// Periods
final periodsProvider = Provider<Box<PeriodModel>>((ref) {
  throw UnimplementedError();
});

// セルのインデックス番号はX_Yの形式で扱う。
final currentCellIndexProvider = StateProvider((ref) => "");

// 現在開いている授業データの格納先
class CurrentCellValueNotifier extends StateNotifier<CurrentCellValue> {
  CurrentCellValueNotifier()
      : super(const CurrentCellValue(
          className: "",
          colorInt: 4294967295,
          roomName: "",
          teacherName: "",
        ));

  void changeClass(String className) {
    state = state.copyWith(className: className);
  }

  void changeTeacher(String teacherName) {
    state = state.copyWith(teacherName: teacherName);
  }

  void changeRoom(String roomName) {
    state = state.copyWith(roomName: roomName);
  }

  void changeColor(int color) {
    state = state.copyWith(colorInt: color);
  }

  void init() {
    state = const CurrentCellValue(
      className: "",
      // 0xffffffff
      colorInt: 4294967295,
      roomName: "",
      teacherName: "",
    );
  }
}

final currentCellValueProvider =
    StateNotifierProvider<CurrentCellValueNotifier, CurrentCellValue>((ref) {
  return CurrentCellValueNotifier();
});
