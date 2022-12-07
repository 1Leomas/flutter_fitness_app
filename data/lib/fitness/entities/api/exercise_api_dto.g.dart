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
      json['duration'] as int,
      json['repetitions'] as int,
      json['burn_calories'] as int,
      json['plan'] as int,
      json['next_exercise'] as int?,
    );

Map<String, dynamic> _$ExerciseApiDtoToJson(ExerciseApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'duration': instance.durationSeconds,
      'repetitions': instance.repetitions,
      'burn_calories': instance.burnCalories,
      'plan': instance.plan,
      'next_exercise': instance.nextExercise,
    };
