import 'package:digigyan/cbtsrc/app_route/app_pages.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/app_preferences.dart';
import 'package:digigyan/cbtsrc/services/internet_observer.dart';
import 'package:digigyan/cbtsrc/controllers/page_index_controller.dart';
import 'package:digigyan/cbtsrc/controllers/presence_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await CoreInitializers.initServices();
  Get.put(PresenceController(), permanent: true);
  Get.put(PageIndexController(), permanent: true);
  await GetStorage.init('Anand');
  WidgetsFlutterBinding.ensureInitialized();
  // final controller = Get.put(LocalStorageService(), permanent: true);

  await AppPrefrence().init();
  // HttpOverrides.global = new MyHttpOverrides();

  runApp(StreamBuilder<dynamic>(
      initialData: false,
      stream: ConnectionStatusSingleton.getInstance()
          .connectionChangeController
          .stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data) {
          // FirebaseRepo();
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return GetMaterialApp(
          title: "Anand",
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          initialRoute: snapshot.data != null
              ? Routes.SPLASH
              :  Routes.SPLASH,
          getPages: AppPages.routes,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'inter',
          ),
        );
      }));
}
