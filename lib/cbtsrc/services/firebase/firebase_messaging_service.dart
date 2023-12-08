import 'dart:io';

import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//initialize our flutter local notifications plugin, this is also a top level initialization
//MUST BE TOP-LEVEL
final notificationPlugin = FlutterLocalNotificationsPlugin();

// initialize the Notification channel for android, this will help in receiving notification
// this is going to be a top-level initialization(i.e. global)
const AndroidNotificationChannel _channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.',
  importance: Importance.high,
);

Future<void> initFirebaseMessaging() async {
  try {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    //setting up platform specific local notification package implementation.
    await _platformSpecificLocalNotification();

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    //requesting permissions for ios and caching apn.
    _requestIOSPermission();
    //getting FCM token And caching it.
    _grabTokenAndCache();
  } on FirebaseException catch (e) {
    if (e.code == 'duplicate-app') {
      //FirebaseRepo.firebaseApp = Firebase.app('db3');
    } else {
      debugPrint("Error Occurred while initializing FIREBASE:: $e");
      rethrow;
    }
  }
}

Future<void> _platformSpecificLocalNotification() async {
  final androidPluginInstance =
      notificationPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  androidPluginInstance?.createNotificationChannel(_channel);

  if (Platform.isIOS) {
    final iosPluginInstance =
        notificationPlugin.resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();
    iosPluginInstance?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}

void _requestIOSPermission() {
  if (Platform.isIOS) {
    FirebaseMessaging.instance.requestPermission(
      sound: true,
      badge: true,
      alert: true,
    );
    FirebaseMessaging.instance.getAPNSToken().then((apnToken) {
      if (apnToken != null) {
        prefHandler.setIosAPNToken(apnToken);
      }
      debugPrint("APN TOKEN FOUND: $apnToken");
    });
  }
}

void _grabTokenAndCache() {
  FirebaseMessaging.instance.getToken().then((value) {
    if (value != null) {
      prefHandler.setFCMToken(value);
      debugPrint("FCM TOKEN $value");
    }
  });
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void _buildNotificationPopUp(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null) {
    notificationPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          color: Colors.blue,
          playSound: true,
          icon: '@mipmap/launcher_icon',
          styleInformation: const DefaultStyleInformation(true, true),
        ),
      ),
    );
  }
}

//****** Setting listeners for firebase and flutter local notification initialization - context is needed. ********************
void setupFCMListeners(
  BuildContext context, {
  ValueChanged<RemoteMessage>? onBuildNotification,
}) {
  var initializationSettings = InitializationSettings(
    android: const AndroidInitializationSettings('@mipmap/launcher_icon'),
    iOS: DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: (
        int id,
        String? title,
        String? body,
        String? payload,
      ) async {
        // handle result
      },
    ),
  );
  notificationPlugin.initialize(initializationSettings);

  FirebaseMessaging.onMessage.listen(_buildNotificationPopUp);

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      onBuildNotification?.call(message);
    }
  });
}

void alarmNotificationPopUp(String senderId, String title, String message) {
  NotificationDetails notification = NotificationDetails(
    android: AndroidNotificationDetails(
      senderId,
      'Alarm Notification',
      channelDescription: 'Notify User',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    ),
  );

  notificationPlugin.show(
    notification.hashCode,
    title,
    message,
    NotificationDetails(
      android: AndroidNotificationDetails(
        _channel.id,
        _channel.name,
        channelDescription: _channel.description,
        color: Colors.blue,
        playSound: false,
        icon: '@mipmap/launcher_icon',
        styleInformation: const DefaultStyleInformation(true, true),
      ),
    ),
  );
}
