import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

class PickerDialog {
  static Future<List<int>?> showPickerDialog({
    required BuildContext context,
    required PickerData pickerData,
  }) =>
      Picker(
        itemExtent: 45,
        diameterRatio: 4,
        textAlign: TextAlign.center,
        squeeze: 0.9,
        height: 216,
        headerDecoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Colors.cyan, Colors.teal],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        hideHeader: true,
        adapter: PickerDataAdapter(data: pickerData.data),
        title: Text(pickerData.title, textAlign: TextAlign.center),
        selectedTextStyle: pickerData.selectedTextStyle,
        onConfirm: pickerData.onConfirm,
      ).showDialog(context);
}

class PickerData {
  PickerData({
    required this.data,
    this.title = '',
    this.selectedTextStyle,
    this.onConfirm,
  });

  final List<PickerItem<num>> data;
  final String title;
  final TextStyle? selectedTextStyle;
  final void Function(Picker, List<int>)? onConfirm;
}
