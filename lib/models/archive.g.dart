// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Archive _$ArchiveFromJson(Map<String, dynamic> json) => Archive(
      json['title'] as String,
      DateTime.parse(json['finished'] as String),
      json['timeSpent'] as int,
    );

Map<String, dynamic> _$ArchiveToJson(Archive instance) => <String, dynamic>{
      'title': instance.title,
      'finished': instance.finished.toIso8601String(),
      'timeSpent': instance.timeSpent,
    };
