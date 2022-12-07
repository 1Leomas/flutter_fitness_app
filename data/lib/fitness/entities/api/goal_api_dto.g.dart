// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalApiDto _$GoalApiDtoFromJson(Map<String, dynamic> json) => GoalApiDto(
      json['id'] as int,
      json['image'] as String,
      json['title'] as String,
      json['description'] as String,
      json['duration'] as int,
      json['burn_calories'] as int,
    );

Map<String, dynamic> _$GoalApiDtoToJson(GoalApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'duration': instance.durationSeconds,
      'burn_calories': instance.burnCalories,
    };
