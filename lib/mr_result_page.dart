import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mr_checker/widgets/field_checker_widget.dart';
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
    baseCodeController.text = '<title>OT MI82 - MCAMITOFBRIDGE - DE117791: [Android][OFBridge] Adaptación para el envío correcto de datos tipo array como variables de etiquetado (!9843) · Merge requests · cbk / mobilitat / apps / cliente / APPCBK / APPCBK_android / Commons_APPCBK · GitLab</title> <a href="https://artifacts.cloud.caixabank.com/artifactory/arq-open-mobile-maven-public/adam/android/bf/APPCBK_OFBRIDGE/82.209.2-2025052301/"';
    //baseCodeController.text = '82.209.2-2025052301/"';
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
              ref.read(ProcessNotifier.processProvider.notifier).process();
              ref.read(MrResultNotifier.valueReturnProvider.notifier).analyzer(baseCodeController.text);
            }, child: Text("PROCESAR"))),
            Expanded(flex: 2, child: ElevatedButton(onPressed: () async {
              ref.read(ProcessNotifier.processProvider.notifier).reset();
              ref.read(MrResultNotifier.valueReturnProvider.notifier).reset();
              baseCodeController.clear();
            }, child: Text("RESET")))
          ]),
        ])
    );
  }

  Widget getPlatformTiles(){
    return SizedBox(width: 300,
      child: Row(
        children: [
          Text("PLATAFORMA", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 20),
          DropdownButton<String>(
            hint: Text('Selecciona una opción'),
            value: Config.osListIndex,
            onChanged: (String? newValue) {
              setState(() {
                Config.osListIndex = newValue;
              });
            },
            items: Config.osList.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget getModulTiles(){
    return SizedBox(width: 300,
      child: Row(
        children: [
          Text("MODULO", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 20),
          DropdownButton<String>(
            hint: Text('Selecciona una opción'),
            value: Config.modulTypeIndex,
            onChanged: (String? newValue) {
              setState(() {
                Config.modulTypeIndex = newValue;
              });
            },
            items: Config.modulType.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget getHistoryTiles(){
    return SizedBox(width: 300,
      child: Row(
        children: [
          Text("DESARROLLO", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 20),
          DropdownButton<String>(
            hint: Text('Selecciona una opción'),
            value: Config.historyIndexSelect,
            onChanged: (String? newValue) {
              setState(() {
                Config.historyIndexSelect = newValue;
              });
            },
            items: Config.historyType.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: TextStyle(
                    color: Config.historyIndexSelect == ConfigParams.value_not
                        ? Config.errorColor
                        : Config.defaultColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget getUserAssigned(){
    return SizedBox(width: 300,
      child: Row(
        children: [
          Text("USUARIO", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 20),
          DropdownButton<String>(
            hint: Text('Selecciona una opción'),
            value: Config.userAssignedTypeIndex,
            onChanged: (String? newValue) {
              setState(() {
                Config.userAssignedTypeIndex = newValue;
              });
            },
            items: Config.userAssignedType.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: TextStyle(
                    color: Config.userAssignedTypeIndex == ConfigParams.value_not
                        ? Config.errorColor
                        : Config.defaultColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget getReviewedLabel(){
    return SizedBox(width: 300,
      child: Row(
        children: [
          Text("LABELS", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 20),
          DropdownButton<String>(
            hint: Text('Selecciona una opción'),
            value: Config.labelsIndex,
            onChanged: (String? newValue) {
              setState(() {
                Config.labelsIndex = newValue;
              });
            },
            items: Config.labelsType.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: TextStyle(
                    color: Config.labelsIndex == ConfigParams.value_not
                        ? Config.errorColor
                        : Config.defaultColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget getMilestoneLabel(){
    return SizedBox(width: 300,
      child: Row(
        children: [
          Text("MILESTONE", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 20),
          DropdownButton<String>(
            hint: Text('Selecciona una opción'),
            value: Config.milestoneIndex,
            onChanged: (String? newValue) {
              setState(() {
                Config.milestoneIndex = newValue;
              });
            },
            items: Config.milestoneType.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: TextStyle(
                    color: Config.milestoneIndex == ConfigParams.value_not
                        ? Config.errorColor
                        : Config.defaultColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget getMainMRData(){
    return SizedBox(
      width: double.infinity,
      child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            getCheckBoxTypeContent(),
            getPlatformTiles(),
            getHistoryTiles(),
            getModulTiles(),
          ]),
    );
  }

  Widget getContent() {
    return SingleChildScrollView(
        child: Column(
            children: [
              Align(alignment: Alignment.centerLeft, child: Text("CONFIGURACIÓN", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              Divider(),
              getMainMRData(),
              Divider(),
              Align(alignment: Alignment.centerLeft, child: Text("PREVALIDACIÓN", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              getPrevalidationData(),
              Divider(),
              SizedBox(height: 20),
              getSouceCodeWidget(),
              SizedBox(height: 20),
              getResultPanel()
            ]
        ));
  }

  Widget getPrevalidationData(){
    return SizedBox(
      width: double.infinity,
      child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
        getUserAssigned(),
        getReviewedLabel(),
        getMilestoneLabel(),
        getConfirmSize(),
        getConfirmMasterBranch()
      ]),
    );
  }

  Widget getConfirmSize(){
    return SizedBox(width: 300,
      child: Row(
        children: [
          Text("TAMAÑO", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 20),
          DropdownButton<String>(
            hint: Text('Selecciona una opción'),
            value: Config.confirmSizeIndex,
            onChanged: (String? newValue) {
              setState(() {
                Config.confirmSizeIndex = newValue;
              });
            },
            items: Config.confirmSizeType.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: TextStyle(
                    color: Config.confirmSizeIndex == ConfigParams.value_not
                        ? Config.errorColor
                        : Config.defaultColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget getConfirmMasterBranch(){
    return SizedBox(width: 300,
      child: Row(
        children: [
          Text("MASTER B", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 20),
          DropdownButton<String>(
            hint: Text('Selecciona una opción'),
            value: Config.masterBranchIndex,
            onChanged: (String? newValue) {
              setState(() {
                Config.masterBranchIndex = newValue;
              });
            },
            items: Config.masterBranchType.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: TextStyle(
                    color: Config.masterBranchIndex == ConfigParams.value_not
                        ? Config.errorColor
                        : Config.defaultColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget getCheckBoxTypeContent(){
    return SizedBox(width: 300,
      child: Row(
        children: [
          Text("MR", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 20),
          DropdownButton<String>(
            hint: Text('Selecciona una opción'),
            value: Config.typeOptionSelect,
            onChanged: (String? newValue) {
              setState(() {
                Config.typeOptionSelect = newValue;
              });
            },
            items: Config.typeOptions.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget getResultPanel(){

    final state = ref.watch(MrResultNotifier.valueReturnProvider);
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
        FieldCheckerWidget(key: Config.keysMap[FieldNames.mi], name: 'MI', keyName: FieldNames.mi, isSmall: true),
        FieldCheckerWidget(key: Config.keysMap[FieldNames.enterprise], name: 'EM', keyName: FieldNames.enterprise, isSmall: true),
        FieldCheckerWidget(key: Config.keysMap[FieldNames.os], name: 'OS', keyName: FieldNames.os, isSmall: true),
        FieldCheckerWidget(key: Config.keysMap[FieldNames.modul], name: 'MD', keyName: FieldNames.modul, isSmall: true),
        FieldCheckerWidget(key: Config.keysMap[FieldNames.idHistory], name: 'ID', keyName: FieldNames.idHistory, isSmall: true),
        FieldCheckerWidget(key: Config.keysMap[FieldNames.version], name: 'V', keyName: FieldNames.version, isSmall: true),
        FieldCheckerWidget(key: Config.keysMap[FieldNames.sourceBranch], name: 'SB', keyName: FieldNames.sourceBranch, isSmall: true),
        FieldCheckerWidget(key: Config.keysMap[FieldNames.targetBranch], name: 'TB', keyName: FieldNames.targetBranch, isSmall: true),
    ])]);
  }


}
