import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../entities/api/exercise_api_dto.dart';
import '../../entities/api/exercises_response_api_dto.dart';
import '../../entities/api/goal_api_dto.dart';
import '../../entities/api/goals_response_api_dto.dart';

abstract class FitnessApiDataSource {
  Future<List<ExerciseApiDto>> getExercises(int page, int limit);
  Future<List<GoalApiDto>> getGoals();
}

class FitnessApiDataSourceImpl implements FitnessApiDataSource {
  @override
  Future<List<ExerciseApiDto>> getExercises(int page, int limit) async {

    Uri uri = Uri.parse('https://fitness-app-api.k8s.devebs.net/workout/exercise?page=$page&size=$limit');

    var response = await http.get(
      uri,
      /*headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY5MjI2MzA5LCJpYXQiOjE2Njg2MjE1MDksImp0aSI6ImZmYTEzNjI5MTgyOTQ2YjliNWUxMzA3M2IzNTRhNjU0IiwidXNlcl9pZCI6NH0.3umASW6E6bYs-jPbuEYZozvX6vR8JtpnM6MqueBBPUo'
      },*/
    );

    if (response.statusCode == 200) {
      ExercisesResponseApiDto exercisesResponse = ExercisesResponseApiDto.fromJson(jsonDecode(response.body));
      return exercisesResponse.exercises;
    }
    return [];
  }

  @override
  Future<List<GoalApiDto>> getGoals() async {
    Uri uri = Uri.parse('https://fitness-app-api.k8s.devebs.net/workout/goal');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      GoalsResponseApiDto exercisesResponse = GoalsResponseApiDto.fromJson(jsonDecode(response.body));
      return exercisesResponse.goals;
    }
    return [];
  }

}