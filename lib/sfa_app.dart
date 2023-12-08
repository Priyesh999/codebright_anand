import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:digigyan/cbtsrc/app_route/app_pages.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/cbt_check_internet/internet_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:digigyan/cbtsrc/services/internet_observer.dart';
import 'package:get/get.dart';

class SfaApp extends StatefulWidget {
  static final GlobalKey keyGlobal = GlobalKey();

  const SfaApp({Key? key}) : super(key: key);

  @override
  _SfaAppState createState() => _SfaAppState();
}

class _SfaAppState extends State<SfaApp> {

  InternetConnectionStatus? _connectionStatus;
  late StreamSubscription<InternetConnectionStatus> _subscription;

  ReceivePort port = ReceivePort();

  String logStr = '';
   bool isRunning=true;

  @override
  void initState() {
    super.initState();
    _subscription = InternetConnectionCheckerPlus().onStatusChange.listen(
          (status) {
        setState(() {
          _connectionStatus = status;
        });
      },
    );



  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        initialData: false,
        stream: ConnectionStatusSingleton.getInstance()
            .connectionChangeController
            .stream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data) {
            // FirebaseRepo();
            return MaterialApp(
              home: Scaffold(
                // body: Center(
                //   child: CircularProgressIndicator(),
                // ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Your internet connection status is:',
                      ),
                      Text(
                        _connectionStatus?.toString() ?? 'Unknown',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return GetMaterialApp(
            title: "digigyan",
            debugShowCheckedModeBanner: false,
            initialRoute: snapshot.data != null ? Routes.HOME : Routes.SPLASH,
            getPages: AppPages.routes,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'inter',
            ),
          );
        });
  }

  void setOrientationAndStatusBar() {
    setBrightnessAndStatus();
    setOrientation();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  //for brightness and status bar
  void setBrightnessAndStatus() {
    return SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness:
            Platform.isAndroid ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.black45,
        systemNavigationBarDividerColor: Colors.black45,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  void setOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

}
