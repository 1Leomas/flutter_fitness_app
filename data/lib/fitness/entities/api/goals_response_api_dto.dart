import 'package:json_annotation/json_annotation.dart';

import 'goal_api_dto.dart';

part 'goals_response_api_dto.g.dart';

@JsonSerializable()
class GoalsResponseApiDto {
  @JsonKey(name: 'results')
  final List<GoalApiDto> goals;

  GoalsResponseApiDto(this.goals);

  factory GoalsResponseApiDto.fromJson(Map<String, dynamic> json) =>
      _$GoalsResponseApiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GoalsResponseApiDtoToJson(this);

}