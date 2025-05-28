class MrResult {
  //'value' used to return the value
  final String value;
  final String title;
  final String mi;
  final String enterprise;
  final String os;
  final String modul;
  final String sprint;
  final String history;
  final bool isCorrect;
  final bool isConfirmedByUser;

  const MrResult({
    this.value = "",
    this.title = "",
    this.mi = "",
    this.enterprise = "",
    this.os = "",
    this.modul = "",
    this.sprint = "",
    this.history = "",
    this.isCorrect = false,
    this.isConfirmedByUser = false,
  });

  MrResult copyWith({
    String? valueReturn,
    String? title,
    String? mi,
    String? enterprise,
    String? os,
    String? modul,
    String? sprint,
    String? history,
    bool? isCorrect,
    bool? isConfirmedByUser,
  }) {
    return MrResult(
      value: valueReturn ?? this.value,
      title: title ?? this.title,
      mi: mi ?? this.mi,
      enterprise: enterprise ?? this.enterprise,
      os: os ?? this.os,
      modul: modul ?? this.modul,
      sprint: sprint ?? this.sprint,
      history: history?? this.history,
      isCorrect: isCorrect ?? this.isCorrect,
      isConfirmedByUser: isConfirmedByUser ?? this.isConfirmedByUser,
    );
  }
}
