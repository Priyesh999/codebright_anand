import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

abstract class DefaultFirebaseOptions {
  // static const String firebaseDbURL = 'https://flutter-cbo-mobile-reporting-default-rtdb.firebaseio.com/';

  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const FirebaseOptions(
          appId: '1:608300012364:android:3821edb3798300ae3475e9',
          //'1:1077354295733:ios:3e1e67c15bdf8df500e9fc',
          apiKey: "AIzaSyBKJNUeMxZmoSQ6w8HWqVjFvWQOHPGA9uc",
          messagingSenderId: '608300012364',
          databaseURL: null,
          projectId: "digigyan-f9890",
        );
      case TargetPlatform.iOS:
        return const FirebaseOptions(
          appId: '1:1077354295733:android:e0c88795621b187c00e9fc',
          //'1:1077354295733:android:8b679dede469d23f00e9fc',
          apiKey: "AIzaSyBKJNUeMxZmoSQ6w8HWqVjFvWQOHPGA9uc",
          databaseURL: null,
          projectId: "digigyan-f9890",
          messagingSenderId: '608300012364',
        );
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for '
          '${defaultTargetPlatform.name} - you can reconfigure this by '
          'running the FlutterFire CLI again.',
        );
    }
  }
}
