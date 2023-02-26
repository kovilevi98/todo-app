// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

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
