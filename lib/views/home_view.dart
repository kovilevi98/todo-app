import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:localization/localization.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:todo_app/configs/colors.dart';
import 'package:todo_app/models/board_item.dart';
import 'package:todo_app/models/board_list.dart';
import 'package:todo_app/stores/home_store.dart';
import 'package:todo_app/widgets/dialogs/new_card_dialog.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeStore _store = HomeStore();
  BoardViewController boardViewController = BoardViewController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('welcome-text'.i18n()),
            Observer(
              builder: (_) => IconButton(
                  onPressed: () {
                    if (_store.dark) {
                      _store.dark = false;
                      ThemeManager.of(context)
                          .setBrightnessPreference(BrightnessPreference.light);
                    } else {
                      _store.dark = true;
                      ThemeManager.of(context)
                          .setBrightnessPreference(BrightnessPreference.dark);
                    }
                  },
                  icon: Icon((_store.dark) ? Icons.sunny : Icons.dark_mode)),
            )
          ],
        ),
      ),
      body: Observer(
        builder: (_) {
          List<BoardList> _lists = [];
          for (int i = 0; i < _store.listData.length; i++) {
            _lists.add(_createBoardList(_store.listData[i]) as BoardList);
          }

          return BoardView(
            lists: _lists,
            boardViewController: boardViewController,
          );
        },
      ),
    );
  }

  Widget buildBoardItem(BoardItemData itemObject) {
    return BoardItem(
        onStartDragItem:
            (int? listIndex, int? itemIndex, BoardItemState? state) {},
        onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
            int? oldItemIndex, BoardItemState? state) {
          //Used to update our local item data
          var item = _store.listData[oldListIndex!].items![oldItemIndex!];
          _store.listData[oldListIndex].items!.removeAt(oldItemIndex!);
          _store.listData[listIndex!].items!.insert(itemIndex!, item);
        },
        onTapItem:
            (int? listIndex, int? itemIndex, BoardItemState? state) async {},
        item: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(itemObject.title!),
            ),
          ),
        ));
  }

  Widget _createBoardList(BoardListData list) {
    List<BoardItem> items = [];
    for (int i = 0; i < list.items!.length; i++) {
      items.insert(i, buildBoardItem(list.items![i]) as BoardItem);
    }

    return BoardList(
      onStartDragList: (int? listIndex) {},
      onTapList: (int? listIndex) async {},
      onDropList: (int? listIndex, int? oldListIndex) {
        //Update our local list data
        var list = _store.listData[oldListIndex!];
        _store.listData.removeAt(oldListIndex!);
        _store.listData.insert(listIndex!, list);
      },
      draggable: false,
      headerBackgroundColor: Colors.transparent,
      backgroundColor: (_store.dark) ? AppColors.darkBlack : AppColors.darkBlue,
      header: [
        Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  list.title!,
                  style: TextStyle(
                      fontSize: 20,
                      color:
                          (_store.dark) ? AppColors.blue : AppColors.darkBlack),
                ))),
      ],
      footer: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: (_store.dark)
                    ? MaterialStatePropertyAll(AppColors.blue)
                    : MaterialStatePropertyAll(AppColors.blue),
              ),
              onPressed: () async {
                var result = await showNewCardDialog(
                    context: context,
                    backgroundColor:
                        (_store.dark) ? AppColors.darkBlack : AppColors.grey);
                if(result != null){
                  var item = BoardItemData(title: result);
                  _store.listData[list.index].items!.add(item);
                  setState(() {});
                }
              },
              child: Text('add'.i18n()),
            ),
          ],
        ),
      ),
      items: items,
    );
  }
}
