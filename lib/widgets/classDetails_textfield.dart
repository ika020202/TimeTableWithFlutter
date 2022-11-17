import 'package:flutter/material.dart';
import 'package:timetable_flutter/providers.dart';
import 'package:timetable_flutter/setting/setting_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClassDetailsTextField extends ConsumerStatefulWidget {
  final String name;
  final IconData someIcon;
  final String someText;

  const ClassDetailsTextField({
    super.key,
    required this.name,
    required this.someIcon,
    required this.someText,
  });
  @override
  ClassDetailsTextFieldState createState() => ClassDetailsTextFieldState();
}

class ClassDetailsTextFieldState extends ConsumerState<ClassDetailsTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 3, right: 10),
      height: 60.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorList.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: ColorList.shadow,
            offset: Offset(3.0, 4.0),
            blurRadius: 4.0,
          )
        ],
      ),
      child: showText(),
    );
  }

  TextFormField showText() {
    final currentValuesNotifier = ref.watch(currentCellValueProvider.notifier);

    return TextFormField(
      initialValue: widget.someText,
      onChanged: (value) {
        switch (widget.name) {
          case "科目":
            currentValuesNotifier.changeClass(value);
            break;
          case "教室":
            currentValuesNotifier.changeRoom(value);
            break;
          case "担当":
            currentValuesNotifier.changeTeacher(value);
            break;
        }
      },
      decoration: InputDecoration(
        hintText: widget.name,
        prefixIcon: Icon(
          widget.someIcon,
          size: 35,
        ),
        hintStyle: const TextStyle(
          fontSize: 20,
        ),
        filled: true,
        fillColor: ColorList.white,
        border: InputBorder.none,
      ),
    );
  }
}
