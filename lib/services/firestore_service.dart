import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/board.dart';

class Firestore {
  static Future<List> getAllEntries(String collection) async {
    return (await FirebaseFirestore.instance.collection(collection).get())
        .docs
        .map((item) => BoardData.fromJson(item.data()))
        .toList();
  }

  static Future addEntryWithAutogeneratedId(
      String collection, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection(collection).add(data);
  }

  static Future updateBoards(
      String documentId, Map<String, dynamic> data) async {
    var result = await FirebaseFirestore.instance
        .collection('boards')
        .where("uuid", isEqualTo: documentId)
        .get();

    if (result.docs.isEmpty) {
      await addEntryWithAutogeneratedId('boards', data);
    } else {
      var id = result.docs.first.id;

      await FirebaseFirestore.instance
          .collection('boards')
          .doc(id)
          .update(data);
    }
  }

}
