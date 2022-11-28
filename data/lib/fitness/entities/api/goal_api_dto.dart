import 'package:json_annotation/json_annotation.dart';

part 'goal_api_dto.g.dart';

@JsonSerializable()
class GoalApiDto {
  final int id;
  final String image;
  final String title;
  final String description;
  @JsonKey(name: 'duration_seconds')
  final int durationSeconds;
  @JsonKey(name: 'burn_calories')
  final int burnCalories;

  GoalApiDto({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.durationSeconds,
    required this.burnCalories,
  });

  factory GoalApiDto.fromJson(Map<String, dynamic> json)
  => _$GoalApiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GoalApiDtoToJson(this);
}