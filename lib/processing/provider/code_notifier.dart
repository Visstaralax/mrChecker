import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/config.dart';
import '../../model/mr_result.dart';
import '../../model/process_value_return.dart';
import '../code_analyzer.dart';
import '../get_source_code_http.dart';

class MrResultNotifier extends StateNotifier<Map<String, ProcessValueReturn>> {
  MrResultNotifier() : super({});
  CodeAnalyzer codeAnalyzer = CodeAnalyzer();
  MrResult mrResult = MrResult();

  void analyzer (String code) async {
    /*
    final String? body = await GetSourceCodeHttp().fetchPageSource(url);
    print ("body $body");
    if (body == null){
      //MAKE ERROR
      return;
    }

     */
    codeAnalyzer.code = code;

    state = {
      FieldNames.title: (state[FieldNames.title] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getTitle()),
      FieldNames.mi: (state[FieldNames.mi] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getMI()),
      FieldNames.enterprise: (state[FieldNames.enterprise] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getEnterprise()),
      FieldNames.modul: (state[FieldNames.modul] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getModul()),
      FieldNames.os: (state[FieldNames.os] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getOS()),
      FieldNames.idHistory: (state[FieldNames.idHistory] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getHistoryID()),
      FieldNames.version: (state[FieldNames.version] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getVersion()),
      FieldNames.sourceBranch: (state[FieldNames.sourceBranch] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getSourceBranch()),
      FieldNames.targetBranch: (state[FieldNames.targetBranch] ?? ProcessValueReturn()).copyWith(valueReturn: codeAnalyzer.getTargetBranch()),
    };

    mrResult.title = (state[FieldNames.title] ?? ProcessValueReturn()).returnValue;
    mrResult.mi = (state[FieldNames.mi] ?? ProcessValueReturn()).returnValue;
    mrResult.enterprise = (state[FieldNames.enterprise] ?? ProcessValueReturn()).returnValue;
    mrResult.modul = (state[FieldNames.modul] ?? ProcessValueReturn()).returnValue;
    mrResult.os = (state[FieldNames.os] ?? ProcessValueReturn()).returnValue;
    mrResult.idHistory = (state[FieldNames.idHistory] ?? ProcessValueReturn()).returnValue;
    mrResult.version = (state[FieldNames.version] ?? ProcessValueReturn()).returnValue;
    mrResult.sourceBranch = (state[FieldNames.sourceBranch] ?? ProcessValueReturn()).returnValue;
    mrResult.targetBranch = (state[FieldNames.targetBranch] ?? ProcessValueReturn()).returnValue;
  }

  void reset() {
    state = const {};
  }

  static final valueReturnProvider = StateNotifierProvider<MrResultNotifier, Map<String, ProcessValueReturn>>(
        (ref) => MrResultNotifier(),
  );
}
