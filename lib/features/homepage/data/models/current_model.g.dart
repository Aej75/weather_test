// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentModel _$CurrentModelFromJson(Map<String, dynamic> json) => CurrentModel(
      (json['temp_c'] as num).toDouble(),
      Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentModelToJson(CurrentModel instance) =>
    <String, dynamic>{
      'temp_c': instance.celsius,
      'condition': instance.condition.toJson(),
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
      json['text'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
    };
