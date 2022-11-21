// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExercisesApi _$ExercisesApiFromJson(Map<String, dynamic> json) => ExercisesApi(
      json['title'] as String,
      json['image'] as String,
      json['duration'] as int,
      json['repetitions'] as int,
      json['burn_calories'] as int,
      json['plan'] as int,
    );

Map<String, dynamic> _$ExercisesApiToJson(ExercisesApi instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'duration': instance.duration,
      'repetitions': instance.repetitions,
      'burn_calories': instance.burnCalories,
      'plan': instance.plan,
    };
