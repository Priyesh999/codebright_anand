import 'dart:io';

import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:flutter/foundation.dart';

const userDefaultPin = "-1";
const defaultCompanyCode = kDebugMode ? "demotest" : "testing";
const defaultDisplayCompanyCode = "Codebright";

class AppConfigs {
  String get mobileWebCode => "M";

  String get geocodeAPI => "AIzaSyB33w_AzFjnqADu8tROxBLmLXVzuRrFs4g";

  DateTime get _releaseDate => DateTime(2022, 07, 07);

  String get apiVersion => "20231010";

  DateTime get expectedDate => _releaseDate.add(const Duration(days: 14));

  String get appVersionDisplay =>
      "${_releaseDate.year}${_releaseDate.month > 9 ? _releaseDate.month : "0${_releaseDate.month}"}${_releaseDate.day > 9 ? _releaseDate.day : "0${_releaseDate.day}"}";

  final String _playStoreURL =
      "https://play.google.com/store/apps/details?id=com.cbo.moibile_reporting_new";
  final String _appStoreURL =
      "https://apps.apple.com/ae/app/cbo-sfa/id1562996802";

  String get appUpdateURL => Platform.isIOS ? _appStoreURL : _playStoreURL;

  Future<String> getVisualAidDirectory(
    bool isExtractedDir, {
    bool withLastSeparator = false,
  }) async {
    String _commonPath = (await MethodUtils.findLocalPath()) +
        Platform.pathSeparator +
        "CBO_SFA" +
        Platform.pathSeparator +
        "VISUAL_AID" +
        Platform.pathSeparator;
    if (!isExtractedDir) {
      return withLastSeparator
          ? (_commonPath + "ZIP" + Platform.pathSeparator)
          : (_commonPath + "ZIP");
    } else {
      return withLastSeparator
          ? (_commonPath + "EXTRACTED" + Platform.pathSeparator)
          : (_commonPath + "EXTRACTED");
    }
  }
}
