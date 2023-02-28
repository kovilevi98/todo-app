import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/models/board_list.dart';
part 'board.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardData{
  String uuid;
  List<BoardListData>? data;

  BoardData({this.data, required this.uuid}){}

  factory BoardData.fromJson(Map<String, dynamic> json) => _$BoardDataFromJson(json);
  Map<String, dynamic> toJson() => _$BoardDataToJson(this);
}