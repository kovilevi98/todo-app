// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardData _$BoardDataFromJson(Map<String, dynamic> json) => BoardData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BoardListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$BoardDataToJson(BoardData instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
