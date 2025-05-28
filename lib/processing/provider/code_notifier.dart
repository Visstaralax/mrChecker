import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/config.dart';
import '../../model/mr_result.dart';
import '../../model/process_value_return.dart';
import '../code_analyzer.dart';

class MrResultNotifier extends StateNotifier<Map<String, ProcessValueReturn>> {
  MrResultNotifier() : super({});
  CodeAnalyzer codeAnalyzer = CodeAnalyzer();

  void analyzer(String code){
    codeAnalyzer.code = code;
    state = {
      FieldNames.title: (state[FieldNames.mi] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getTitle()),
      FieldNames.mi: (state[FieldNames.mi] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getMI()),
      FieldNames.enterprise: (state[FieldNames.enterprise] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getEnterprise()),
      FieldNames.modul: (state[FieldNames.modul] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getModul()),
      FieldNames.os: (state[FieldNames.os] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getOS()),
      FieldNames.idHistory: (state[FieldNames.idHistory] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getHistoryID()),
    };
  }

  void reset() {
    state = const {};
  }

  static final mrResultProvider = StateNotifierProvider<MrResultNotifier, Map<String, ProcessValueReturn>>(
        (ref) => MrResultNotifier(),
  );
}
