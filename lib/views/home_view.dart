import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:localization/localization.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:todo_app/configs/colors.dart';
import 'package:todo_app/models/board.dart';
import 'package:todo_app/models/board_item.dart';
import 'package:todo_app/models/board_list.dart';
import 'package:todo_app/stores/home_store.dart';
import 'package:todo_app/widgets/footer.dart';
import 'package:todo_app/widgets/header.dart';
import 'package:todo_app/widgets/item_widget.dart';

class HomeView extends StatefulWidget {
  BoardData? init;

  HomeView({super.key, this.init});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeStore _store = HomeStore();
  BoardViewController boardViewController = BoardViewController();

  @override
  void initState() {
    super.initState();
    _store.init(widget.init);
    setState(() {});
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
          List<BoardList> lists = [];
          for (int i = 0; i < _store.listData.length; i++) {
            lists.add(_createBoardList(_store.listData[i]) as BoardList);
          }

          return BoardView(
            lists: lists,
            boardViewController: boardViewController,
          );
        },
      ),
    );
  }

  Widget buildBoardItem(BoardItemData itemObject, int index) {
    return BoardItem(
        draggable: _store.dragAble,
        onStartDragItem:
            (int? listIndex, int? itemIndex, BoardItemState? state) {},
        onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
            int? oldItemIndex, BoardItemState? state) {
          //Used to update our local item data
          var item = _store.listData[oldListIndex!].items![oldItemIndex!];
          _store.listData[oldListIndex].items!.removeAt(oldItemIndex!);
          _store.listData[listIndex!].items!.insert(itemIndex!, item);
          _store.refresh();
        },
        onTapItem:
            (int? listIndex, int? itemIndex, BoardItemState? state) async {},
        item: ItemWidget(
          itemObject: itemObject,
          dark: _store.dark,
          listIndex: index,
          refresh: _store.refresh(),
          sendArchive: (uuid){
            _store.sendArchive(uuid);
            setState(() {});
          },
          start: (uuid) {
            _store.start(uuid);
          }, onTimeChanged: (uuid, time) {
            _store.onTimeChanged(uuid, time);
        },
        ));
  }

  Widget _createBoardList(BoardListData list) {
    List<BoardItem> items = [];
    for (int i = 0; i < list.items!.length; i++) {
      items.insert(i, buildBoardItem(list.items![i], list.index!) as BoardItem);
    }

    return BoardList(
      onStartDragList: (int? listIndex) {},
      onTapList: (int? listIndex) async {},
      onDropList: (int? listIndex, int? oldListIndex) async {
        //Update our local list data
        var list = _store.listData[oldListIndex!];
        _store.listData.removeAt(oldListIndex!);
        _store.listData.insert(listIndex!, list);
      },
      draggable: false,
      headerBackgroundColor: Colors.transparent,
      backgroundColor: (_store.dark) ? AppColors.darkBlack : AppColors.darkBlue,
      header: [
        Header(
          list: list,
          dark: _store.dark,
        ),
      ],
      footer: Footer(
        addTask: (result, index) async {
          await _store.addTask(result, index);
          setState(() {});
        },
        index: list.index!,
        dark: _store.dark,
      ),
      items: items,
    );
  }
}
