import 'package:json_annotation/json_annotation.dart';

part 'exercise_api_dto.g.dart';

@JsonSerializable()
class ExerciseApiDto {
  final int id;
  final String title;
  final String image;
  @JsonKey(name: 'duration')
  final int durationSeconds;
  final int repetitions;
  @JsonKey(name: 'burn_calories')
  final int burnCalories;
  final int plan;
  @JsonKey(name: 'next_exercise')
  final int? nextExercise;

  ExerciseApiDto(
      this.id,
      this.title,
      this.image,
      this.durationSeconds,
      this.repetitions,
      this.burnCalories,
      this.plan,
      this.nextExercise
  );

  factory ExerciseApiDto.fromJson(Map<String, dynamic> json) => _$ExerciseApiDtoFromJson(json);


  Map<String, dynamic> toJson() => _$ExerciseApiDtoToJson(this);
}