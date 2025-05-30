import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mr_checker/config/config.dart';
import 'package:mr_checker/model/button_watcher.dart';
import 'package:mr_checker/model/process_value_return.dart';
import 'package:mr_checker/processing/provider/process_notifier.dart';

import '../processing/provider/code_notifier.dart';
import '../model/mr_result.dart';

class FieldCheckerWidget extends ConsumerStatefulWidget {
  final String name;
  final String keyName;
  final bool isSmall;
  const FieldCheckerWidget({super.key, required this.name, required this.keyName, required this.isSmall});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FieldCheckerWidgetState();
}

class _FieldCheckerWidgetState extends ConsumerState<FieldCheckerWidget> {
  String name = "";
  bool isInit = true;
  bool isCorrect = true;
  bool isConfirmedByUser = false;

  @override
  void initState() {
    super.initState();
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: 350,
      child: Scaffold(
        body: getComponent()
      ),
    );
  }

  void setColor() {
    if (isInit){
      Config.currentColor = Config.defaultColor;
    } else if (isCorrect && isConfirmedByUser) {
      Config.currentColor = Config.confirmedColor;
    } else if (!isCorrect && isConfirmedByUser) {
      Config.currentColor = Config.errorColor;
    } else if (!isCorrect) {
      print ("error color");
      Config.currentColor = Config.errorColor;
    } else {
      Config.currentColor = Config.defaultColor;
    }
  }

  IconData getIcons(){
    if (isCorrect){
      return Icons.check_box;
    } else {
      return Icons.error_outline;
    }
  }

  void processed(){
    setState(() {
      isInit = false;
      isCorrect = false;
      isConfirmedByUser = false;
      setColor();
    });
  }

  void approved(){
    setState(() {
      isInit = false;
      isCorrect = true;
      isConfirmedByUser = true;
      setColor();
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

    ref.listen<Map<String, ProcessValueReturn>>(MrResultNotifier.valueReturnProvider, (prev, next) {
      final value = next[widget.keyName]?.returnValue ?? "";
      setState(() {
        isInit = false;
        isCorrect = !(value == "error");
        print ("${widget.keyName} isCorrect $isCorrect");
        setColor();
      });
    });

    ref.listen<ButtonWatcher>(ProcessNotifier.processProvider, (prev, next) {
      setState(() {
        isInit = true;
        isCorrect = false;
        isConfirmedByUser = false;
        setColor();
      });
    });

    final state = ref.watch(MrResultNotifier.valueReturnProvider);
    final value = state[widget.keyName]?.returnValue ?? "";

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
        Expanded(flex: 1, child: Icon(getIcons(), color: Config.currentColor)),
        SizedBox(width: 20),
        Expanded(flex: 4, child: Text(name, style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(flex: 15, child: Text(value, style: TextStyle(color: Config.currentColor))),
        Expanded(flex: 2, child: ElevatedButton(onPressed: (){approved();}, style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.greenAccent)), child: null,)),
        SizedBox(width: 10),
        Expanded(flex: 2, child: ElevatedButton(onPressed: (){rejected();}, style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.redAccent)), child: null,)),
      ]),
    );
  }
}