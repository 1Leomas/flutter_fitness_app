import 'package:json_annotation/json_annotation.dart';

import 'exercises_api.dart';

part 'fitness_api_response.g.dart';

@JsonSerializable()
class FitnessApiResponse {
  @JsonKey(name: 'results')
  final List<ExercisesApi> exercises;

  FitnessApiResponse(this.exercises);

  factory FitnessApiResponse.fromJson(Map<String, dynamic> json) => _$FitnessApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FitnessApiResponseToJson(this);
}