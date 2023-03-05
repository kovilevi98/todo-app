// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/models/archive.dart';
import 'package:todo_app/models/board.dart';
import 'package:todo_app/models/board_item.dart';
import 'package:todo_app/models/board_list.dart';
import 'package:todo_app/services/test.dart';
import 'package:uuid/uuid.dart';

import '../widget_tests/widget_test.dart';

void main() {
  test('Counter value should be inrement',() {
    // assets
    int number = 0;
    var test = Test();

    // arranges
    number = test.increment(number);

    // expects
    expect(1, number);
  });

  test('Firestore boards collection init test, should contain 3 columns', () async {
    final firestore = FakeFirebaseFirestore();
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

    var result = (await firestore.collection(BoardsCollection).get()).docs
        .map((item) => BoardData.fromJson(item.data()))
        .toList();

    expect(result.first.data!.length, 3);
  });

  test('Generate CSV test', () async {
    /*var uuid = const Uuid();
    var itemData1 = BoardItemData(uuid: uuid.v4(), title: 'Entry1');
    var itemData2 = BoardItemData(uuid: uuid.v4(), title: 'Entry2');
    var itemData3 = BoardItemData(uuid: uuid.v4(), title: 'Entry3');
    var listData1 = BoardListData(title: 'TODO', index: 0, items: [itemData1]);
    var listData2 = BoardListData(title: 'IN PROGRESS', index: 2, items: [itemData2]);
    var listData3 = BoardListData(title: 'DONE', index: 3, items: [itemData3]);
    var data = BoardData(uuid: uuid.v4(), data: [listData1, listData2, listData3]);


    var result = await CsvExportService().generateCsv(data);

    expect(result, "asd");*/
  });

  test('Firestore boards collection update test, should contain 3 columns, and one entry is changed', () async {
    final firestore = FakeFirebaseFirestore();
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

    const newTitle = 'Changed entry';
    data.data![0].items![0].title = newTitle;

    var result = await firestore
        .collection(BoardsCollection)
        .where("uuid", isEqualTo: data.uuid)
        .get();

    if (result.docs.isEmpty) {
      await firestore.collection(BoardsCollection).add(data.toJson());
    } else {
      var id = result.docs.first.id;

      await firestore
          .collection(BoardsCollection)
          .doc(id)
          .update(data.toJson());
    }

    var finalResult = (await firestore.collection(BoardsCollection).get()).docs
        .map((item) => BoardData.fromJson(item.data()))
        .toList();

    expect(finalResult.first.data!.length, 3);
    expect(finalResult.first.data![0].items![0].title, newTitle);
  });

  test('Firestore insert archive test', () async {
    final firestore = FakeFirebaseFirestore();
    var archive = Archive("test", DateTime.now(), 42);

    await firestore.collection(ArchiveColletion).add(
        archive.toJson()
    );

    var result = (await firestore.collection(ArchiveColletion).get()).docs
        .map((item) => Archive.fromJson(item.data()))
        .toList();

    expect(result.length, 1);
  });
}
