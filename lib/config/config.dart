import 'package:flutter/cupertino.dart';

class Config {

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
  static const List<String> userAssignedType = [ConfigParams.userAssigned, ConfigParams.userNotAssigned];

  //search matches
  static const enterprisesMatchesList = ['OT', 'VASS', 'TNF'];
  static const modulesMatchesList = ['MCAMITOFBRIDGE'];
  static const osMatchesList = ['Android', 'iOS'];
  static const historyMatchesList = ["US", "DE"];

  // type selected
  static var typeOptionIndex = 0;
  static var mrTypeIndex = 0;
  static var modulTypeIndex = 0;
  static var historyIndex = 0;
  static var osListIndex = 0;
  static var userAssignedTypeIndex = 0;

  static String getHistoryType(){
    return historyType[historyIndex];
  }

  static Map<String, Key> keysMap = {
    FieldNames.title: Key(FieldNames.title),
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
  static const userAssigned = "Si";
  static const userNotAssigned = "No";
}

class FieldNames{
  static const title = "titulo";
  static const mi = "mi";
  static const enterprise = "enterprise";
  static const os = "os";
  static const modul = "modul";
  static const sprint = "sprint";
  static const idHistory = "idHistory";
}