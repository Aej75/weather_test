// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseModel _$WeatherResponseModelFromJson(
        Map<String, dynamic> json) =>
    WeatherResponseModel(
      LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      CurrentModel.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseModelToJson(
        WeatherResponseModel instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      'current': instance.current.toJson(),
    };
