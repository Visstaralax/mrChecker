import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Config {

  //colors
  static final defaultColor = Colors.black;
  static final errorColor = Colors.redAccent;
  static final confirmedColor = Colors.greenAccent.shade700;
  static var currentColor = Colors.black;

  //here add MR type
  static const List<String> typeOptions = [
    MrType.normal,
    MrType.commons,
    MrType.propagacion_normal,
    MrType.propagacion_commons,
    MrType.openFront,
    MrType.openFront_propagacion
  ];

  //here add OS type
  static const List<String> osList = [ConfigParams.android, ConfigParams.iOS];
  //here add history type
  static const List<String> historyType = [ConfigParams.US, ConfigParams.DE];
  //here add modul type
  static const List<String> modulType = [ConfigParams.BF, ConfigParams.MCA];
  //here add is user is assigned type
  static const List<String> userAssignedType = [ConfigParams.value_yes, ConfigParams.value_not];
  //here add confirm reviewed label
  static const List<String> labelsType = [ConfigParams.value_yes, ConfigParams.value_not];
  //here add confirm milestone
  static const List<String> milestoneType = [ConfigParams.value_yes, ConfigParams.value_not];
  //here add confirm correct size
  static const List<String> confirmSizeType = [ConfigParams.value_yes, ConfigParams.value_not];
  //here add confirm master branch
  static const List<String> masterBranchType = [ConfigParams.value_yes, ConfigParams.value_not];

  //search matches
  static const enterprisesMatchesList = ['OT', 'VASS', 'TNF', 'NTTDATA', 'NNT DATA'];
  static const modulesMatchesList = ['MCAMITOFBRIDGE','OFBRIDGE','TARJET'];
  static const osMatchesList = ['Android', 'iOS','And'];
  static const historyMatchesList = ["US", "DE"];

  // type selected
  static String? typeOptionSelect = MrType.normal;
  static String? modulTypeIndex = ConfigParams.BF;
  static String? historyIndexSelect = ConfigParams.US;
  static String? osListIndex = ConfigParams.android;

  // prevalidation
  static String? userAssignedTypeIndex = ConfigParams.value_not;
  static String? labelsIndex = ConfigParams.value_not;
  static String? milestoneIndex = ConfigParams.value_not;
  static String? confirmSizeIndex = ConfigParams.value_not;
  static String? masterBranchIndex = ConfigParams.value_not;

  static Map<String, Key> keysMap = {
    FieldNames.title: Key(FieldNames.title),
    FieldNames.mi: Key(FieldNames.mi),
    FieldNames.enterprise: Key(FieldNames.enterprise),
    FieldNames.modul: Key(FieldNames.modul),
    FieldNames.os: Key(FieldNames.os),
    FieldNames.version: Key(FieldNames.version),
    FieldNames.sourceBranch: Key(FieldNames.sourceBranch),
    FieldNames.targetBranch: Key(FieldNames.targetBranch)
  };
}

class MrType{
  static const normal = "normal";
  static const commons = "commons";
  static const propagacion_normal = "propagacion normal";
  static const propagacion_commons = "propagacion commons";
  static const openFront = "openFront";
  static const openFront_propagacion = "openFront propagacion";
}

class ConfigParams{
  static const US = "US";
  static const DE = "DE";
  static const android = "Android";
  static const iOS = "iOS";
  static const BF = "BF";
  static const MCA = "MCA";
  static const value_yes = "Si";
  static const value_not = "No";
}

class FieldNames{
  static const title = "titulo";
  static const mi = "mi";
  static const enterprise = "enterprise";
  static const os = "os";
  static const modul = "modul";
  static const sprint = "sprint";
  static const idHistory = "idHistory";
  static const version = "version";
  static const sourceBranch = "source_branch";
  static const targetBranch = "target_branch";
}