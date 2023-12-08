import 'package:flutter/foundation.dart';

/*
* Use it to print error/log msg's.
* */

void codebrightLog(String logMsg, {String logAt = "", String fileName= ""}){
  if(kDebugMode) {
    print("""
      ---------- Custom LOG ------------
      File Name: $fileName
      Function/Class: $logAt
      --------------***-----------------
      MESSAGE:  ->  $logMsg
      ----------------------------------
      """);
  }
}