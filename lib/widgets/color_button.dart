import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timetable_flutter/providers.dart';

class ColorButton extends ConsumerWidget {
  final Color someColor;

  const ColorButton({
    super.key,
    required this.someColor,
    //required this.themeColorChange,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: SizedBox(
        height: 28, // Widgetの幅を指定
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: someColor,
            shape: CircleBorder(
              side: BorderSide(
                color: someColor,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
          ),
          onPressed: () {
            ref
                .read(currentCellValueProvider.notifier)
                .changeColor(someColor.value);
          },
          child: const Text(""),
        ),
      ),
    );
  }
}
