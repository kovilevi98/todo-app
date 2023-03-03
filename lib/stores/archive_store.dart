import 'package:mobx/mobx.dart';
import 'package:todo_app/models/archive.dart';
import 'package:todo_app/services/firestore_service.dart';

part 'archive_store.g.dart';

class ArchiveStore = _ArchiveStore with _$ArchiveStore;

abstract class _ArchiveStore with Store {
  // store variables:-----------------------------------------------------------
  @observable
  ObservableList<Archive> list = ObservableList<Archive>.of([]);

  // actions:-------------------------------------------------------------------

  @action
  Future<void> getList() async {
    list.clear();
    var archives = await Firestore.getAllArchives();
    archives.forEach((element) {
        list.add(element);
    });
  }
}
