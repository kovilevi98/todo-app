import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/services/timestamp_converter.dart';
part 'board_item.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardItemData{
  String uuid;
  String? title;

  @TimestampConverter()
  DateTime? start;
  @TimestampConverter()
  DateTime? finished;

  int? currentTimeSpent;

  BoardItemData({this.title, required this.uuid}){
    title ??= "";
  }

  factory BoardItemData.fromJson(Map<String, dynamic> json) => _$BoardItemDataFromJson(json);
  Map<String, dynamic> toJson() => _$BoardItemDataToJson(this);

}