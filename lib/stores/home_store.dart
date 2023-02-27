import 'package:boardview/board_list.dart';
import 'package:localization/localization.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/models/board_item.dart';
import 'package:todo_app/models/board_list.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  // store variables:-----------------------------------------------------------
  @observable
  ObservableList<BoardListData> listData = ObservableList<BoardListData>.of([
    BoardListData(
        index: 0,
        title: "todo".i18n(),
        items: List.of([
          BoardItemData(title: "entry1"),
        ])),
    BoardListData(
        title: "in-progress".i18n(),
        index: 1,
        items: List.of([
          BoardItemData(title: "entry1"),
        ])),
    BoardListData(
        title: "done".i18n(),
        index: 2,
        items: List.of([
          BoardItemData(title: "entry1"),
        ])),
  ]);

  @observable
  ObservableList<BoardList> list = ObservableList<BoardList>.of([]);

  @observable
  bool dark = false;

  // actions:-------------------------------------------------------------------

  @action
  void addTask(String title, int index) {
    var item = BoardItemData(title: title);
    listData[index].items!.add(item);
  }
}
