import 'board_item.dart';
import 'package:json_annotation/json_annotation.dart';
part 'board_list.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardListData{

  String? title;
  int? index;
  List<BoardItemData>? items;

  BoardListData({this.title,this.items, this.index}){
    title ??= "";
    items ??= [];
  }

  factory BoardListData.fromJson(Map<String, dynamic> json) => _$BoardListDataFromJson(json);
  Map<String, dynamic> toJson() => _$BoardListDataToJson(this);
}