import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/services/timestamp_converter.dart';
part 'archive.g.dart';

@JsonSerializable(explicitToJson: true)
class Archive{

  String title;
  @TimestampConverter()
  DateTime finished;
  int timeSpent;

  Archive(this.title,this.finished,this.timeSpent);


  factory Archive.fromJson(Map<String, dynamic> json) => _$ArchiveFromJson(json);
  Map<String, dynamic> toJson() => _$ArchiveToJson(this);

}