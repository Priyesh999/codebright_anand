import 'dart:async';
import 'dart:io';
import 'cbtsrc/services/firebase/firebase_messaging_service.dart';
import 'cbtsrc/services/firebase/firestore_service.dart';

abstract class CoreInitializers {
  ///
  /// Initialize all services here whichever is required before or with app run
  ///
  static Future<void> initServices() async {
    await FireStoreService.initFireStore();

    // initializing firebase messaging for notifications
    initFirebaseMessaging();

  }

}
