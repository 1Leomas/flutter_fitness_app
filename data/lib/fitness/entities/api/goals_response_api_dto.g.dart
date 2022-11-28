// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_response_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalsResponseApiDto _$GoalsResponseApiDtoFromJson(Map<String, dynamic> json) =>
    GoalsResponseApiDto(
      (json['results'] as List<dynamic>)
          .map((e) => GoalApiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoalsResponseApiDtoToJson(
        GoalsResponseApiDto instance) =>
    <String, dynamic>{
      'results': instance.goals,
    };
