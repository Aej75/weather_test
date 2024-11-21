import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationModel {
  final String name;
  final String country;
  final double lat;
  final double lon;

  LocationModel(this.name, this.country, this.lat, this.lon);

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
