import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

class PickerDialog<T> {
  static showPickerDialog({
    required BuildContext context,
    required PickerData pickerData,
  }) =>
      Picker(
        itemExtent: 45,
        diameterRatio: 4.0,
        textAlign: TextAlign.center,
        squeeze: 0.9,
        height: 216,
        headerDecoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Colors.cyan, Colors.teal],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
          ),
        ),
        hideHeader: true,
        adapter: PickerDataAdapter(data: pickerData.data),
        title: Text(pickerData.title, textAlign: TextAlign.center),
        selectedTextStyle: pickerData.selectedTextStyle,
        onConfirm: pickerData.onConfirm,
      ).showDialog(context);
}

class PickerData<T> {
  PickerData({
    required this.data,
    this.title = '',
    this.selectedTextStyle,
    this.onConfirm,
  });

  final List<PickerItem<T>> data;
  final String title;
  final TextStyle? selectedTextStyle;
  final void Function(Picker, List<dynamic>)? onConfirm;
}
