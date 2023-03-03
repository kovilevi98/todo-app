import 'package:flutter/material.dart';
import 'package:todo_app/services/firestore_service.dart';
import 'package:todo_app/stores/archive_store.dart';
import 'package:todo_app/widgets/history_item.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  ArchiveStore store = ArchiveStore();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: store.getList(),
      builder: (
        BuildContext context,
        AsyncSnapshot<void> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          return Center(
            child: ListView.builder(
                itemCount: store.list.length,
                itemBuilder: (_, index) {
                  return Expanded(
                      child: HistoryItem(
                    title: store.list[index].title,
                    finishedTime: store.list[index].finished,
                  ));
                }),
          );
        }
      },
    );
  }
}
