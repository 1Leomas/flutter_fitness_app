// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalApiDto _$GoalApiDtoFromJson(Map<String, dynamic> json) => GoalApiDto(
      id: json['id'] as int,
      image: json['image'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      durationSeconds: json['duration_seconds'] as int,
      burnCalories: json['burn_calories'] as int,
    );

Map<String, dynamic> _$GoalApiDtoToJson(GoalApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'duration_seconds': instance.durationSeconds,
      'burn_calories': instance.burnCalories,
    };
