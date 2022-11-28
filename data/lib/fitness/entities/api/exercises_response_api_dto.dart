import 'package:json_annotation/json_annotation.dart';

import 'exercise_api_dto.dart';

part 'exercises_response_api_dto.g.dart';

@JsonSerializable()
class ExercisesResponseApiDto {
  @JsonKey(name: 'results')
  final List<ExerciseApiDto> exercises;

  ExercisesResponseApiDto(this.exercises);

  factory ExercisesResponseApiDto.fromJson(Map<String, dynamic> json) => _$ExercisesResponseApiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExercisesResponseApiDtoToJson(this);
}