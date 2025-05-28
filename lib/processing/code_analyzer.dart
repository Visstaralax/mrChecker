import 'package:flutter/material.dart';

import '../config/config.dart';
import '../model/field_checker.dart';
import '../model/mr_result.dart';

class CodeAnalyzer{

  String code = "";
  String title = "";

  String getTitle(){
    final RegExp regExp = RegExp(r'<title>(.*?)\s*\(!\d+\)\s*· Merge requests.*?</title>', caseSensitive: false);
    final titleMatch = regExp.firstMatch(code);
    final text = titleMatch?.group(1).toString();
    if (text != null){
      title = text;
      return text;
    } else {
      return "error";
    }
  }

  String getMI(){
    final RegExp regExp = RegExp(r'MI\d{2,}', caseSensitive: false);
    final titleMatch = regExp.firstMatch(title);
    final text = titleMatch?.group(0).toString();
    if (text != null){
      return text;
    } else {
      return "error";
    }
  }

  String getEnterprise(){
    final pattern = r'\b(' + Config.enterprisesMatchesList.join('|') + r')\b';
    final regex = RegExp(pattern);

    final textMatch = regex.firstMatch(title);
    final text = textMatch?.group(0);
    if (text != null){
      return text;
    } else {
      return "error";
    }
  }

  String getModul(){
    final pattern = r'\b(' + Config.modulesMatchesList.join('|') + r')\b';
    final regex = RegExp(pattern);

    final textMatch = regex.firstMatch(title);
    final text = textMatch?.group(0);
    if (text != null){
      return text;
    } else {
      return "error";
    }
  }

  String getOS(){
    final pattern = r'\b(' + Config.osMatchesList.join('|') + r')\b';
    final regex = RegExp(pattern);

    final textMatch = regex.firstMatch(title);
    final text = textMatch?.group(0);
    if (text != null){
      return text;
    } else {
      return "error";
    }
  }

  String getHistoryID(){

    String pattern = "";

    if (Config.getHistoryType() == ConfigParams.US){
      pattern = r'\bUS\d+\b';
    } else if (Config.getHistoryType() == ConfigParams.DE){
      pattern = r'\bDE\d+\b';
    }

    final regex = RegExp(pattern);

    final textMatch = regex.firstMatch(title);
    final text = textMatch?.group(0);
    if (text != null){
      return text;
    } else {
      return "error";
    }
  }


}