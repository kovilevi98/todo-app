// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardListData _$BoardListDataFromJson(Map<String, dynamic> json) =>
    BoardListData(
      title: json['title'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => BoardItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
      index: json['index'] as int?,
    );

Map<String, dynamic> _$BoardListDataToJson(BoardListData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'index': instance.index,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };
