// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseApiDto _$ExerciseApiDtoFromJson(Map<String, dynamic> json) =>
    ExerciseApiDto(
      json['id'] as int,
      json['title'] as String,
      json['image'] as String,
      (json['duration'] as num).toDouble(),
      json['repetitions'] as int,
      json['burn_calories'] as int,
      json['plan'] as int,
    );

Map<String, dynamic> _$ExerciseApiDtoToJson(ExerciseApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'duration': instance.duration,
      'repetitions': instance.repetitions,
      'burn_calories': instance.burnCalories,
      'plan': instance.plan,
    };
