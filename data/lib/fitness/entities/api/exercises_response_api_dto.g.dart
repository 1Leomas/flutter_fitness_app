// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises_response_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExercisesResponseApiDto _$ExercisesResponseApiDtoFromJson(
        Map<String, dynamic> json) =>
    ExercisesResponseApiDto(
      (json['results'] as List<dynamic>)
          .map((e) => ExerciseApiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExercisesResponseApiDtoToJson(
        ExercisesResponseApiDto instance) =>
    <String, dynamic>{
      'results': instance.exercises,
    };
