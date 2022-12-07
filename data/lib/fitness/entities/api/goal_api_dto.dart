import 'package:json_annotation/json_annotation.dart';

part 'goal_api_dto.g.dart';

@JsonSerializable()
class GoalApiDto {
  final int id;
  final String image;
  final String title;
  final String description;
  @JsonKey(name: 'duration')
  final int durationSeconds;
  @JsonKey(name: 'burn_calories')
  final int burnCalories;

  GoalApiDto(
    this.id,
    this.image,
    this.title,
    this.description,
    this.durationSeconds,
    this.burnCalories,
  );

  factory GoalApiDto.fromJson(Map<String, dynamic> json)
  => _$GoalApiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GoalApiDtoToJson(this);
}