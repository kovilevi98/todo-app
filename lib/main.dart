import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:todo_app/configs/images.dart';

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
      /// WidgetsBinding.instance.window.platformBrightness is used because a
      /// Material BuildContext will not be available outside of the Material app
      defaultBrightnessPreference: BrightnessPreference.system,
      data: (Brightness brightness) => ThemeData(
        primarySwatch: Colors.blue,
        brightness: brightness,
      ),
      loadBrightnessOnStart: true,
      themedWidgetBuilder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          title: 'Theme Manager Demo',
          theme: theme,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('es', 'ES'),
          ],
          home:  EasySplashScreen(
            backgroundImage: const AssetImage(BACKGROUND_IMAGE),
            showLoader: false,
            navigator: MyHomePage(),
            durationInSeconds: 5,
            logo: Image.asset(SPLASH_IMAGE, width: 0),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool light = false;
  String text = "asd";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('welcome-text'.i18n()),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (light) {
                      ThemeManager.of(context)
                          .setBrightnessPreference(BrightnessPreference.dark);
                      light = false;
                    } else {
                      ThemeManager.of(context)
                          .setBrightnessPreference(BrightnessPreference.light);
                      light = true;
                    }
                  });
                },
                icon: Icon((light) ? Icons.sunny : Icons.dark_mode))
          ],
        ),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(key: Key("Text"), text),
              ElevatedButton(
                  key: Key("Button"),
                  onPressed: () {
                    setState(() {
                      text = "test";
                    });
                  },
                  child: Text("button"))
            ],
          ),
        ),
      ),
    );
  }
}
