// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      json['name'] as String,
      json['country'] as String,
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
    };
