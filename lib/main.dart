import 'dart:io';

import 'package:agrimatco/Repo/UserRepo.dart';
import 'package:agrimatco/Repo/homeRepo.dart';
import 'package:agrimatco/ui/app.dart';
import 'package:agrimatco/ui/components/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  Get.config(defaultTransition: Transition.cupertino);
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('en', 'US'), Locale('ar', 'IQ')],
    path: 'assets/languages',
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white));
    if (FlutterSecureStorage().read(key: 'language') == null) {
      if (Platform.localeName.substring(1, 3) == 'ar') {
        EasyLocalization.of(context).locale = Locale('ar', 'IQ');
        FlutterSecureStorage().write(key: 'language', value: 'ar');
      }
    }
    FlutterSecureStorage().write(key: 'currency', value: 'IQD');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeRepo>(create: (_) => HomeRepo()),
          ChangeNotifierProvider<UserRepo>(create: (_) => UserRepo()),
        ],
        child: MaterialApp(
          title: 'Agrimatco',
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          theme: mainThemeLight(context),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            EasyLocalization.of(context).delegate,
          ],
          supportedLocales: EasyLocalization.of(context).supportedLocales,
          locale: EasyLocalization.of(context).locale,
          home: App(),
        ));
  }
}
