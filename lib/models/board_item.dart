import 'package:json_annotation/json_annotation.dart';
part 'board_item.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardItemData{
  String uuid;
  String? title;

  BoardItemData({this.title, required this.uuid}){
    title ??= "";
  }

  factory BoardItemData.fromJson(Map<String, dynamic> json) => _$BoardItemDataFromJson(json);
  Map<String, dynamic> toJson() => _$BoardItemDataToJson(this);

}