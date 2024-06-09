import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_icon_data.freezed.dart';

@freezed
class TabIconData with _$TabIconData {
  const factory TabIconData({
    @Default('') String imagePath,
    @Default(0) int index,
    @Default('') String selectedImagePath,
    @Default(false) bool isSelected,
  }) = _TabIconData;
}
