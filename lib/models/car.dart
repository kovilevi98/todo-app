import 'package:json_annotation/json_annotation.dart';
part 'car.g.dart';

@JsonSerializable(explicitToJson: true)
class Car{

  String manufacturer;
  int price;

  Car(this.manufacturer,this.price);


  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
  Map<String, dynamic> toJson() => _$CarToJson(this);
}