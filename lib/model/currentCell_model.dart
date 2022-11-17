import 'package:flutter/foundation.dart';

@immutable
class CurrentCellValue {
  const CurrentCellValue(
      {required this.className,
      required this.teacherName,
      required this.roomName,
      required this.colorInt});

  final String className;
  final String teacherName;
  final String roomName;
  final int colorInt;

  CurrentCellValue copyWith(
      {String? className,
      String? teacherName,
      String? roomName,
      int? colorInt}) {
    return CurrentCellValue(
        className: className ?? this.className,
        teacherName: teacherName ?? this.teacherName,
        roomName: roomName ?? this.roomName,
        colorInt: colorInt ?? this.colorInt);
  }
}
