import 'package:json_annotation/json_annotation.dart';

part 'exercise_api_dto.g.dart';

@JsonSerializable()
class ExerciseApiDto {
  final int id;
  final String title;
  final String image;
  final double duration;
  final int repetitions;
  @JsonKey(name: 'burn_calories')
  final int burnCalories;
  final int plan;

  ExerciseApiDto(
      this.id,
      this.title,
      this.image,
      this.duration,
      this.repetitions,
      this.burnCalories,
      this.plan);

  factory ExerciseApiDto.fromJson(Map<String, dynamic> json) => _$ExerciseApiDtoFromJson(json);


  Map<String, dynamic> toJson() => _$ExerciseApiDtoToJson(this);
}