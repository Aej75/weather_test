import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_ajaya/features/homepage/data/models/current_model.dart';
import 'package:weather_app_ajaya/features/homepage/data/models/location_model.dart';

part 'weather_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherResponseModel {
  final LocationModel location;
  final CurrentModel current;

  WeatherResponseModel(this.location, this.current);

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseModelToJson(this);
}
