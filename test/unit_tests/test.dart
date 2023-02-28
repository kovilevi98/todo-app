// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/models/board.dart';
import 'package:todo_app/services/firestore_service.dart';
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

  /*test('dsa', () async {
    // Populate the fake database.
    final firestore = FakeFirebaseFirestore();
    var uuid = Uuid();
    await firestore.collection(BoardsCollection).add({
      'data': {
        '0': {
          'index': 0,
          'items': {
            'title': 'entry0',
            'uuid': uuid.v4(),
          }
        },
        '1': {
          'index': 1,
          'items': {
            'title': 'entry0',
            'uuid': uuid.v4(),
          }
        },
        '2': {
          'index': 2,
          'items': {
            'title': 'entry0',
            'uuid': uuid.v4(),
          }
        }
      },
      'uuid': uuid.v4(),
    });

    var result = (await firestore.collection('boards').get()).docs
        .map((item) => BoardData.fromJson(item.data()))
    .toList();

    expect(result.first.data!.length, 3);
  });*/
}
