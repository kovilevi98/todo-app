import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:todo_app/configs/images.dart';
import 'package:todo_app/views/home_view.dart';
import 'package:todo_app/views/kanban_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required
  await Firebase.initializeApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return ThemeManager(
      defaultBrightnessPreference: BrightnessPreference.system,
      data: (Brightness brightness) => ThemeData(
        primarySwatch: Colors.blue,
        brightness: brightness,
      ),
      loadBrightnessOnStart: true,
      themedWidgetBuilder: (BuildContext context, ThemeData theme) {
        return ResponsiveSizer(builder: (context, orientation, screenType) {
          return MaterialApp(
            theme: theme,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('es', 'ES'),
            ],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              LocalJsonLocalization.delegate,
            ],
            home: EasySplashScreen(
              backgroundImage: const AssetImage(BACKGROUND_IMAGE),
              showLoader: false,
              navigator: HomeView(),
              durationInSeconds: 1,
              logo: Image.asset(SPLASH_IMAGE, width: 0),
            ),
          );
        });
      },
    );
  }
}
