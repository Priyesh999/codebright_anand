import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'firebase_options.dart';

abstract class FireStoreService {
  static AndroidProvider get androidProvider {
    return kReleaseMode ? AndroidProvider.playIntegrity : AndroidProvider.debug;
  }

  static AppleProvider get iosProvider {
    return kReleaseMode ? AppleProvider.appAttest : AppleProvider.debug;
  }

  static Future<FirebaseApp> initFireStore() async {
    try {
      final app = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // initializing firebase app check
      final appCheck = FirebaseAppCheck.instance.activate(
        androidProvider: androidProvider,
        appleProvider: iosProvider,
      );
      appCheck.whenComplete(() {
        FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true);
      });

      // listening for fire-store data changes
      // updateFireStoreConfigToPref(prefHandler.getCompanyCode);
      return app;
    } catch (e) {
      return Firebase.app("[DEFAULT]");
    }
  }

  // static Future<bool> updateFireStoreConfigToPref(
  //   String companyCode, {
  //   bool forceUpdate = false,
  //   bool clearIfAbsent = false,
  // }) async {
  //   if (companyCode.isNotEmpty && (_shouldSync || forceUpdate)) {
  //     final configs = await _getClientConfig(companyCode);
  //     return _updateFirebaseConfigsPref(configs, clearIfAbsent: clearIfAbsent);
  //   }
  //   return false;
  // }

  // static Future<Map<String, dynamic>?> _getClientConfig(String code) async {
  //   try {
  //     code = code.toUpperCase();
  //     // throw Exception("App version mismatch");
  //     if (AppConfigs.displayVersion != prefHandler.getDisplayVersion) {
  //       throw Exception("App version mismatch");
  //     }
  //     return FirebaseFirestore.instance
  //         .collection('client-config')
  //         .doc(code)
  //         .get()
  //         .then((value) => value.data());
  //   } catch (e) {
  //     //handling exception with alternative datasource
  //     var data = await _getFetchFireStoreData("client-config/$code");
  //     if (data == null) {
  //       return null;
  //     }
  //     return <String, dynamic>{
  //       "base-url": data["fields"]?["base-url"]?["stringValue"] ?? "",
  //       "api-client": data["fields"]?["api-client"]?["stringValue"] ?? "DIO",
  //     };
  //   }
  // }
  //
  // static Future<Map<String, dynamic>?> getInAppReviewConfig() async {
  //   final platform = Platform.operatingSystem.toLowerCase();
  //
  //   try {
  //     // throw Exception("App version mismatch");
  //     if (AppConfigs.displayVersion != prefHandler.getDisplayVersion) {
  //       throw Exception("App version mismatch");
  //     }
  //     return FirebaseFirestore.instance
  //         .collection('app-in-review-config')
  //         .doc(platform)
  //         .get()
  //         .then((value) => value.data());
  //   } catch (e) {
  //     //handling exception with alternative datasource
  //     var data = await _getFetchFireStoreData("app-in-review-config/$platform");
  //     return <String, dynamic>{
  //       "in-review": data?["fields"]?["in-review"]?["booleanValue"] == true,
  //       "app-version": data?["fields"]?["app-version"]?["stringValue"] ?? "",
  //     };
  //   }
  // }
  //
  // static Future<Map<String, dynamic>?> _getFetchFireStoreData(
  //   String documentPath,
  // ) async {
  //   // [apiKey] = AIzaSyDqyeEPsbGun_jMjydHYpIQb-w_nfrMFKA
  //   // [android o auth client id] : 1077354295733-nkdb7kbqrgn9pp9faskjsq44pfj3eoqg.apps.googleusercontent.com
  //   // [access token] : access token can be obtained using o auth client id.
  //
  //   // api playground and more info : https://cloud.google.com/firestore/docs/reference/rest/v1/projects.databases.documents/get?apix_params=%7B%22name%22%3A%22projects%2Fflutter-cbo-mobile-reporting%2Fdatabases%2F(default)%2Fdocuments%2Fapp-in-review-config%2F%22%7D
  //
  //   // [ GET API ] => https://firestore.googleapis.com/v1/projects/flutter-cbo-mobile-reporting/databases/(default)/documents/app-in-review-config/?key=AIzaSyDqyeEPsbGun_jMjydHYpIQb-w_nfrMFKA
  //   // [ header1 ] => Authorization: Bearer [YOUR_ACCESS_TOKEN]
  //   // [ header2 ] => Accept: application/json
  //
  //   final data =
  //       await RestClient().get(url: ApiUrls.getFireStoreUrl(documentPath));
  //   if (data.containsKey("error")) {
  //     return null;
  //   }
  //   return data;
  // }
  //
  // static Future<bool> _updateFirebaseConfigsPref(
  //   Map<String, dynamic>? clientConfig, {
  //   bool clearIfAbsent = false,
  // }) async {
  //   bool hasKey = clientConfig?.containsKey("base-url") == true;
  //   if (hasKey) {
  //     await prefHandler.setCompanyBaseUrl(clientConfig!["base-url"]);
  //     await prefHandler.setFireStoreSyncedAt(DateTime.now());
  //   } else {
  //     if (clearIfAbsent) {
  //       await prefHandler.setCompanyBaseUrl("");
  //     }
  //   }
  //
  //   await prefHandler.setRestApiClient(clientConfig?["api-client"] ?? "DIO");
  //
  //   codebrightLog("preference : api-client updated : [${prefHandler.restApiClient}]");
  //   codebrightLog("preference : base Url updated : [${prefHandler.companyBaseUrl}]");
  //
  //   return hasKey;
  // }
  //
  // static bool get _shouldSync {
  //   final now = DateTime.now().subtract(const Duration(hours: 4));
  //
  //   final currVersion = AppConfigs.displayVersion;
  //
  //   final timeDiff = prefHandler.getFireStoreSyncedAt?.isBefore(now) ?? true;
  //
  //   final versionDiff = prefHandler.getDisplayVersion == currVersion;
  //
  //   return timeDiff || versionDiff;
  // }
}
