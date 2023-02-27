import 'board_item.dart';

class BoardListData{

  String? title;
  int index;
  List<BoardItemData>? items;

  BoardListData({this.title,this.items, required this.index}){
    title ??= "";
    items ??= [];
  }
}