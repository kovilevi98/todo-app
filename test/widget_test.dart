// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/main.dart';

Widget makeTestableWidget({ required Widget child }) {
  return MediaQuery(
    data: MediaQueryData(),
    child: MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: child,
    ),
  );
}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: MyHomePage()));
    await tester.pumpAndSettle(Duration(seconds: 3));

    expect(find.text('asd'), findsOneWidget);
    expect(find.text('test'), findsNothing);

    // Tap the button.
    await tester.tap(find.byKey(const Key("Button")));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('asd'), findsNothing);
    expect(find.text('test'), findsOneWidget);
  });
}
