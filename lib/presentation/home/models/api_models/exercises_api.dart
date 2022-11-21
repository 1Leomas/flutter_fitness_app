import 'package:json_annotation/json_annotation.dart';

part 'exercises_api.g.dart';

@JsonSerializable()
class ExercisesApi {
  final String title;
  final String image;
  final int duration;
  final int repetitions;
  @JsonKey(name: 'burn_calories')
  final int burnCalories;
  final int plan;

  ExercisesApi(
      this.title,
      this.image,
      this.duration,
      this.repetitions,
      this.burnCalories,
      this.plan);

  factory ExercisesApi.fromJson(Map<String, dynamic> json) => _$ExercisesApiFromJson(json);

  Map<String, dynamic> toJson() => _$ExercisesApiToJson(this);
}