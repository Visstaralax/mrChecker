import '../config/config.dart';

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

    if (Config.historyIndexSelect == ConfigParams.US){
      pattern = r'\bUS\d+\b';
    } else if (Config.historyIndexSelect == ConfigParams.DE){
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

  String getVersion(){
    String pattern = r'\/\d{2,}\.\d{3}\.\d+-\d{10}';

    final regex = RegExp(pattern);

    final textMatch = regex.firstMatch(code);
    final text = textMatch?.group(0);

    if (text != null){
      return text.replaceAll("/", "");
    } else {
      return "error";
    }
  }

  String getSourceBranch(){
    final regex = RegExp(r'data-source-branch="([^"]+)"');

    final textMatch = regex.firstMatch(code);
    final text = textMatch?.group(0);

    if (text != null){
      return text.replaceAll('data-source-branch=', "");
    } else {
      return "error";
    }
  }

  String getTargetBranch(){
    final regex = RegExp(r'data-target-branch="([^"]+)"');

    final textMatch = regex.firstMatch(code);
    final text = textMatch?.group(0);

    if (text != null){
      return text.replaceAll('data-target-branch=', "");
    } else {
      return "error";
    }
  }


}