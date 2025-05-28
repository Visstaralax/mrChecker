import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mr_checker/model/field_checker.dart';
import 'package:mr_checker/model/mr_result.dart';
import 'package:mr_checker/processing/code_analyzer.dart';
import 'package:mr_checker/processing/provider/code_notifier.dart';
import 'package:mr_checker/processing/provider/process_notifier.dart';
import 'config/config.dart';

class MrResultPage extends ConsumerStatefulWidget {
  const MrResultPage({super.key});

  @override
  ConsumerState<MrResultPage> createState() => _MrResultPageState();
}

class _MrResultPageState extends ConsumerState<MrResultPage> {
  final TextEditingController baseCodeController = TextEditingController();
  final TextEditingController MI = TextEditingController();

  @override
  void initState() {
    baseCodeController.text = "<title>OT MI82 - MCAMITOFBRIDGE - DE117791: [Android][OFBridge] Adaptación para el envío correcto de datos tipo array como variables de etiquetado (!9843) · Merge requests · cbk / mobilitat / apps / cliente / APPCBK / APPCBK_android / Commons_APPCBK · GitLab</title>";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }

  Widget getSouceCodeWidget(){
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Column(children: [
          Align(alignment: Alignment.centerLeft, child: Text("Introduce el código fuente", style: TextStyle(fontSize: 20))),
          Row(children: [
            Expanded(flex: 8, child: TextField(controller: baseCodeController)),
            SizedBox(width: 10),
            Expanded(flex: 2, child: ElevatedButton(onPressed: () async {
              ref.read(MrResultNotifier.mrResultProvider.notifier).analyzer(baseCodeController.text);
              ref.read(ProcessNotifier.processProvider.notifier).process();
            }, child: Text("PROCESAR"))),
            Expanded(flex: 2, child: ElevatedButton(onPressed: () async {
              ref.read(MrResultNotifier.mrResultProvider.notifier).reset();
              ref.read(ProcessNotifier.processProvider.notifier).reset();
            }, child: Text("RESET")))
          ]),
        ])
    );
  }

  Widget getPlatformTiles(){
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text("PLATAFORMA", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(children: List.generate(Config.osList.length, (index) {
          return SizedBox(
              width: 150,
              child: RadioListTile<int>(
                title: Text(Config.osList[index]),
                value: index,
                groupValue: Config.osListIndex,
                onChanged: (int? value) {
                  setState(() {
                    Config.osListIndex = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ));
        }))
      ]),
    );
  }

  Widget getModulTiles(){
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
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text("MODULO", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(children: List.generate(Config.modulType.length, (index) {
          return SizedBox(
              width: 150,
              child: RadioListTile<int>(
                title: Text(Config.modulType[index]),
                value: index,
                groupValue: Config.modulTypeIndex,
                onChanged: (int? value) {
                  setState(() {
                    Config.modulTypeIndex = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ));
        }))
      ]),
    );
  }

  Widget getHistoryTiles(){
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
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text("TIPO", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(children: List.generate(Config.historyType.length, (index) {
          return SizedBox(
              width: 150,
              child: RadioListTile<int>(
                title: Text(Config.historyType[index]),
                value: index,
                groupValue: Config.historyIndex,
                onChanged: (int? value) {
                  setState(() {
                    Config.historyIndex = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ));
        }))
      ]),
    );
  }

  Widget getUserAssigned(){
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
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text("USUARIO", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(children: List.generate(Config.userAssignedType.length, (index) {
          return SizedBox(
              width: 150,
              child: RadioListTile<int>(
                title: Text(Config.userAssignedType[index]),
                value: index,
                groupValue: Config.userAssignedTypeIndex,
                onChanged: (int? value) {
                  setState(() {
                    Config.userAssignedTypeIndex = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ));
        }))
      ]),
    );
  }

  Widget getMainMRData(){
    return SizedBox(
      width: double.infinity,
      child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            getPlatformTiles(),
            getHistoryTiles(),
            getModulTiles(),
            getUserAssigned()
          ]),
    );
  }

  Widget getContent() {
    return SingleChildScrollView(
        child: Column(
            children: [
              Align(alignment: Alignment.centerLeft, child: Text("CONFIGURACIÓN", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              Divider(),
              getCheckBoxTypeContent(),
              getMainMRData(),
              SizedBox(height: 20),
              getSouceCodeWidget(),
              SizedBox(height: 20),
              getResultPanel()
            ]
        ));
  }

  Widget getCheckBoxTypeContent(){
    return Wrap(children: List.generate(Config.typeOptions.length, (index) {
      return SizedBox(
          width: 200,
          child: RadioListTile<int>(
            title: Text(Config.typeOptions[index]),
            value: index,
            groupValue: Config.mrTypeIndex,
            onChanged: (int? value) {
              setState(() {
                Config.mrTypeIndex = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ));
    }));
  }

  Widget getResultPanel(){

    final state = ref.watch(MrResultNotifier.mrResultProvider);
    final value = state[FieldNames.title]?.returnValue ?? "";

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Align(alignment: Alignment.centerLeft, child: Text("RESULTADO", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      Divider(),
      SizedBox(height: 20),
      Wrap(crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text("TÍTULO: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            SizedBox(width: 20),
            Text(value)]),
      SizedBox(height: 20),
      Wrap(children: [
        FieldChecker(key: Config.keysMap[FieldNames.mi], name: 'MI', keyName: FieldNames.mi, isSmall: true),
        FieldChecker(key: Config.keysMap[FieldNames.enterprise], name: 'EM', keyName: FieldNames.enterprise, isSmall: true),
        FieldChecker(key: Config.keysMap[FieldNames.os], name: 'OS', keyName: FieldNames.os, isSmall: true),
        FieldChecker(key: Config.keysMap[FieldNames.modul], name: 'MD', keyName: FieldNames.modul, isSmall: true),
        FieldChecker(key: Config.keysMap[FieldNames.idHistory], name: 'ID', keyName: FieldNames.idHistory, isSmall: true),
    ])]);
  }


}
