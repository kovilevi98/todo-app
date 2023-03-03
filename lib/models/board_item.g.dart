// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardItemData _$BoardItemDataFromJson(Map<String, dynamic> json) =>
    BoardItemData(
      title: json['title'] as String?,
      uuid: json['uuid'] as String,
    )
      ..start = const TimestampConverter().fromJson(json['start'] as Timestamp?)
      ..finished =
          const TimestampConverter().fromJson(json['finished'] as Timestamp?)
      ..currentTimeSpent = json['currentTimeSpent'] as int?;

Map<String, dynamic> _$BoardItemDataToJson(BoardItemData instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'start': const TimestampConverter().toJson(instance.start),
      'finished': const TimestampConverter().toJson(instance.finished),
      'currentTimeSpent': instance.currentTimeSpent,
    };
