enum Scope {
  scope0_6(100, 0.6),
  scope1_5(300, 1.5),
  scope6(1100, 6);

  const Scope(this.value, this.zoom);

  final num value;
  final num zoom;

  static Scope fromZoom(num zoom) => Scope.values.firstWhere((element) => element.zoom == zoom);

  static Scope fromValue(num value) => Scope.values.firstWhere((element) => element.value == value);
}
