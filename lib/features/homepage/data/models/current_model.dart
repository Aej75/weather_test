import 'package:json_annotation/json_annotation.dart';

part 'current_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrentModel {
  @JsonKey(name: 'temp_c')
  final double celsius;
  final Condition condition;

  CurrentModel(this.celsius, this.condition);

  factory CurrentModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Condition {
  final String text;
  final String icon;
  Condition(this.text, this.icon);

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
