class ProcessValueReturn {
  final String returnValue;

  const ProcessValueReturn({this.returnValue = ''});

  ProcessValueReturn copyWith({
    String? valueReturn,
  }) {
    return ProcessValueReturn(
      returnValue: valueReturn ?? this.returnValue,
    );
  }
}
