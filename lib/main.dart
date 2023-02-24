import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:theme_manager/change_theme_widget.dart';
import 'package:theme_manager/theme_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Required
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
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            LocalJsonLocalization.delegate,
          ],
          supportedLocales: [
            Locale('en', 'US'),
            Locale('es', 'ES'),
          ],
          home: MyHomePage(),
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
                icon: Icon((light) ?
                Icons.sunny :
                Icons.dark_mode))
          ],
        ),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("test")
            ],
          ),
        ),
      ),
    );
  }

  void showThemePicker() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return ThemePickerDialog(
          onSelectedTheme: (BrightnessPreference preference) {
            ThemeManager.of(context).setBrightnessPreference(preference);
          },
        );
      },
    );
  }
}
