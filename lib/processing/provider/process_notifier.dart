import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/config.dart';
import '../../model/button_watcher.dart';
import '../../model/mr_result.dart';
import '../code_analyzer.dart';

class ProcessNotifier extends StateNotifier<ButtonWatcher> {
  ProcessNotifier() : super(ButtonWatcher());

  void reset(){
    state = state.copyWith(reset: true, process: false);
  }

  void process(){
    state = state.copyWith(reset: false, process: true);
  }

  static final processProvider = StateNotifierProvider<ProcessNotifier, ButtonWatcher>(
        (ref) => ProcessNotifier(),
  );
}
