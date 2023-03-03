import 'package:boardview/board_list.dart';
import 'package:localization/localization.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/models/archive.dart';
import 'package:todo_app/models/board.dart';
import 'package:todo_app/models/board_item.dart';
import 'package:todo_app/models/board_list.dart';
import 'package:todo_app/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  // store variables:-----------------------------------------------------------
  var uuid = const Uuid();

  @observable
  ObservableList<BoardListData> listData = ObservableList<BoardListData>.of([]);

  @observable
  ObservableList<BoardList> list = ObservableList<BoardList>.of([]);

  @observable
  bool dark = false;

  @observable
  bool dragAble = true;

  String? boardUuid;

  // actions:-------------------------------------------------------------------

  @action
  Future<void> addTask(String title, int index) async {
    var uuid = Uuid();
    var item = BoardItemData(title: title, uuid: uuid.v4());
    listData[index].items!.add(item);
    await refresh();
  }

  @action
  Future<void> refresh() async {
    if(boardUuid == null){
      var uuid = Uuid();
      boardUuid = uuid.v4();
    }

    var json = BoardData(data: listData.toList(), uuid: boardUuid!);
    await Firestore.updateBoards(boardUuid! ,json.toJson());
  }

  @action
  Future<void> onTimeChanged(String uuid, int time) async {
    for (var element in listData) {
      var index = element.items!.indexWhere((element2) => element2.uuid == uuid);
      if(index > -1){
        element.items![index].currentTimeSpent = time;
      }
    }
  }

  @action
  Future<void> sendArchive(String uuid) async {
      for (var element in listData) {
          var index = element.items!.indexWhere((element2) => element2.uuid == uuid);
          if(index > -1){
            var archive = Archive(element.items![index].title ?? "", DateTime.now(), element.items![index].currentTimeSpent ?? 0);
            Firestore.addEntryWithAutogeneratedId('archives', archive.toJson());
            element.items!.removeAt(index);
          }
      }
      await refresh();
  }

  @action
  Future<void> start(String uuid) async {

  }

  @action
  void changeDragAble(){
      dragAble = !dragAble;
  }

  @action
  void init(BoardData? boardData) {
    if(boardData != null && boardData.data != null){
      listData.addAll(boardData.data!);
      boardUuid = boardData.uuid;
    } else {

      var item0 = BoardListData(
          title: "todo".i18n(),
          index: 0,
          items: List.of([
            BoardItemData(title: "entry1", uuid: uuid.v4()),
          ]));

      var item1 = BoardListData(
          title: "in-progress".i18n(),
          index: 1,
          items: List.of([
            BoardItemData(title: "entry1", uuid: uuid.v4()),
          ]));

      var item2 = BoardListData(
          title: "done".i18n(),
          index: 1,
          items: List.of([
            BoardItemData(title: "entry1", uuid: uuid.v4()),
          ]));

      listData.add(item0);
      listData.add(item1);
      listData.add(item2);
    }
  }
}
