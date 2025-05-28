class ButtonWatcher {
  final bool reset;
  final bool process;

  ButtonWatcher({this.reset = false, this.process = false});

  ButtonWatcher copyWith({bool? reset, bool? process}) {
    return ButtonWatcher(
      reset: reset ?? this.reset,
      process: process ?? this.process,
    );
  }
}