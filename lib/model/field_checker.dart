import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mr_checker/config/config.dart';
import 'package:mr_checker/model/button_watcher.dart';
import 'package:mr_checker/model/process_value_return.dart';
import 'package:mr_checker/processing/provider/process_notifier.dart';

import '../processing/provider/code_notifier.dart';
import 'mr_result.dart';

class FieldChecker extends ConsumerStatefulWidget {
  final String name;
  final String keyName;
  final bool isSmall;
  const FieldChecker({super.key, required this.name, required this.keyName, required this.isSmall});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FieldCheckerState();
}

class _FieldCheckerState extends ConsumerState<FieldChecker> {
  String name = "";
  bool isInit = true;
  bool isCorrect = true;
  bool isConfirmedByUser = false;
  final defaultColor = Colors.black;
  final errorColor = Colors.redAccent;
  final confirmedColor = Colors.greenAccent.shade700;

  @override
  void initState() {
    super.initState();
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {

    ref.listen<Map<String, ProcessValueReturn>>(MrResultNotifier.mrResultProvider, (prev, next) {
      final value = next[widget.keyName]?.returnValue ?? "";

      setState(() {
        isCorrect = !(value == "error");
      });
    });

    ref.listen<ButtonWatcher>(ProcessNotifier.processProvider, (prev, next) {
      if (next.reset || next.process){
        isInit = true;
        isCorrect = false;
        isConfirmedByUser = false;
    }});

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: widget.isSmall ? constraints.maxWidth / 4 : double.infinity,
          //width: constraints.maxWidth,
          child: getComponent(),
        );
      },
    );
  }

  Color getColor() {
    if (isInit){
      return defaultColor;
    } else if (isCorrect && isConfirmedByUser) {
      return confirmedColor;
    } else if (!isCorrect && isConfirmedByUser) {
      return errorColor;
    } else if (!isCorrect) {
      return errorColor;
    } else {
      return defaultColor;
    }
  }

  IconData getIcons(){
    if (isCorrect){
      return Icons.check_box;
    } else {
      return Icons.error_outline;
    }
  }

  void approved(){
    setState(() {
      isInit = false;
      isCorrect = true;
      isConfirmedByUser = true;
    });
  }

  void rejected(){
    setState(() {
      isInit = false;
      isCorrect = false;
      isConfirmedByUser = true;
    });
  }

  Widget getComponent(){

    final state = ref.watch(MrResultNotifier.mrResultProvider);
    final value = state[widget.keyName]?.returnValue ?? "";

    print ("title $value");

    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Row(children: [
        Expanded(flex: 1, child: Icon(getIcons(), color: getColor())),
        SizedBox(width: 20),
        Expanded(flex: 4, child: Text(name, style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(flex: 15, child: Text(value, style: TextStyle(color: getColor()))),
        Expanded(flex: 2, child: ElevatedButton(onPressed: (){approved();}, style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.greenAccent)), child: null,)),
        SizedBox(width: 10),
        Expanded(flex: 2, child: ElevatedButton(onPressed: (){rejected();}, style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.redAccent)), child: null,)),
      ]),
    );
  }
}