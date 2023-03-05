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

const BoardsCollection = 'boards';
const ArchiveColletion = 'archives';

void main() {
  testWidgets('The three columns are visible', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: HomeView()));
    await tester.pumpAndSettle(Duration(seconds: 3));

    expect(find.byType(BoardView), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNWidgets(3));
  });

  /*testWidgets('Fake firebase collection', (WidgetTester tester) async {
    // Populate the fake database.
   /* final firestore = FakeFirebaseFirestore();
    var uuid = const Uuid();
    var itemData1 = BoardItemData(uuid: uuid.v4(), title: 'Entry1');
    var itemData2 = BoardItemData(uuid: uuid.v4(), title: 'Entry2');
    var itemData3 = BoardItemData(uuid: uuid.v4(), title: 'Entry3');
    var listData1 = BoardListData(title: 'TODO', index: 0, items: [itemData1]);
    var listData2 = BoardListData(title: 'IN PROGRESS', index: 2, items: [itemData2]);
    var listData3 = BoardListData(title: 'DONE', index: 3, items: [itemData3]);
    var data = BoardData(uuid: uuid.v4(), data: [listData1, listData2, listData3]);

    await firestore.collection(BoardsCollection).add(
        data.toJson()
    );
    // Let the snapshots stream fire a snapshot.
    await tester.idle();
    // Re-render.
    await tester.pump();

    var result = (await firestore.collection(BoardsCollection).get()).docs
        .map((item) => BoardData.fromJson(item.data()))
        .toList();

    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: HomeView(init: result.first,)));
    await tester.pumpAndSettle(Duration(seconds: 3));

    expect(find.byType(BoardView), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNWidgets(3));*/
  });*/
}
