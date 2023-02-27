// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:boardview/boardview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/board_view/board_list.dart';
import 'package:todo_app/views/home_view.dart';

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
  testWidgets('The three columns are visible', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: HomeView()));
    await tester.pumpAndSettle(Duration(seconds: 3));

    expect(find.byType(BoardView), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNWidgets(3));
  });
}
