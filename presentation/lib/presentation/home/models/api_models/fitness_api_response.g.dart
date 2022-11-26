// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fitness_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FitnessApiResponse _$FitnessApiResponseFromJson(Map<String, dynamic> json) =>
    FitnessApiResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ExercisesApi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FitnessApiResponseToJson(FitnessApiResponse instance) =>
    <String, dynamic>{
      'results': instance.exercises,
    };
