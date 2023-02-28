// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardItemData _$BoardItemDataFromJson(Map<String, dynamic> json) =>
    BoardItemData(
      title: json['title'] as String?,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$BoardItemDataToJson(BoardItemData instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
    };
