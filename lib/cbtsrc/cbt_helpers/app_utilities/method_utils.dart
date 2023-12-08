import 'dart:io';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MethodUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  static void showSnackBar(BuildContext ctx, msgToDisplay) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(msgToDisplay),
      ),
    );
  }

  static String getGreetingText() {
    String wText = "";
    DateTime c = DateTime.now();
    int timeOfDay = c.hour;

    if (timeOfDay >= 0 && timeOfDay < 12) {
      wText = "Good Morning";
    } else if (timeOfDay >= 12 && timeOfDay < 16) {
      wText = "Good Afternoon";
    } else if (timeOfDay >= 16 && timeOfDay < 21) {
      wText = "Good Evening";
    } else if (timeOfDay >= 21 && timeOfDay < 24) {
      wText = "Good Night";
    }
    return wText;
  }

  static ButtonStyle raisedButtonStyle(Color color) => ElevatedButton.styleFrom(
        onPrimary: color,
        primary: color,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      );

  static void showAlertDialog(
      BuildContext context, String mTitle, String mContent,
      {Function()? callback}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new DxTextBlack(
            mTitle,
            mSize: 18,
            mBold: true,
            textAlign: TextAlign.center,
          ),
          content: new DxTextBlack(mContent,
              maxLine: 3, textAlign: TextAlign.center),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 75,
                  color: CodebrightColor.cbtPrimarColor,
                  child: new TextButton(
                    child: new DxTextWhite(
                      "Yes",
                      mBold: true,
                    ),
                    onPressed: callback,
                  ),
                ),
                Container(
                  width: 75,
                  color: Colors.grey,
                  child: new TextButton(
                    child: new DxTextWhite(
                      "No",
                      mBold: true,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  static void showCommonDialog(
      BuildContext context, String mTitle, String mContent,
      {Function()? callback}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          //this right here
          child: Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
                border: Border.all(color: CodebrightColor.primary),
                borderRadius: BorderRadius.circular(12.0)),
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: DxTextBlack(
                    mTitle,
                    mBold: true,
                    mSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: DxTextBlack(
                    mContent,
                    mBold: true,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        color: CodebrightColor.primary,
                        child: TextButton(
                          // style: raisedButtonStyle(materialPrimaryColor),
                          onPressed: callback,
                          child: DxTextWhite(
                            "Yes",
                            mBold: true,
                          ),
                        ),
                        height: 35,
                        width: 70,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: DxTextWhite(
                            "No",
                            mBold: true,
                          ),
                        ),
                        height: 35,
                        width: 70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showConfirmDialog(BuildContext context, String mTitle,
      String mContent, Function callback(bool)) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(mTitle),
          content: new Text(mContent),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: new Text("NO"),
              onPressed: () {
                Navigator.of(context).pop();
                callback(false);
              },
            ),
            TextButton(
              child: new Text("YES"),
              onPressed: () {
                Navigator.of(context).pop();
                callback(true);
              },
            ),
          ],
        );
      },
    );
  }

  static void showAlertDialogCupertino(
      BuildContext context, String mTitle, String mContent, Function callback) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) => new CupertinoAlertDialog(
        title: new Text(mTitle),
        content: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            mContent,
          ),
        ),
        actions: [
          CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(ctx);
                callback();
                // Navigator.pop(context);
              },
              isDefaultAction: true,
              child: new Text("OK"))
        ],
      ),
    );
  }

  static void showAlertDialogWithParameter(
      BuildContext context, String mTitle, var mVarData, Function callback) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(mTitle),
          content: new Text("subtitle"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                callback(context, mVarData);
              },
            ),
          ],
        );
      },
    );
  }

  static Future<bool> isInternetPresentOld() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //  print('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      //print('not connected');
      return false;
    }
  }

  static Future<bool> isInternetPresent() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static Future<String> createLocalDir(String folderName,
      {required bool isVisualAidPath}) async {
    //extract it to utility
    Directory savedDir;
    String _path;
    if (isVisualAidPath) {
      _path =
          "${await findLocalPath()}${Platform.pathSeparator}CBT${Platform.pathSeparator}VISUAL_AID${Platform.pathSeparator}$folderName";
    } else {
      _path =
          "${await findLocalPath()}${Platform.pathSeparator}CBO_SFA${Platform.pathSeparator}$folderName";
    }

    savedDir = Directory(_path);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.createSync(recursive: true);
    }
    return savedDir.path;
  }

  static Future<String> createDirAt(String folderName,
      {required Directory baseDIrectory}) async {
    //extract it to utility
    Directory savedDir;
    String path = baseDIrectory.path + Platform.pathSeparator + folderName;

    savedDir = Directory(path);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      await savedDir.create(recursive: true);
    }
    return savedDir.path;
  }

  static Future<String> findLocalPath() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory!.path;
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } else {
      return "";
    }
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.toCapitalized())
      .join(" ");
}
