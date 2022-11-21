import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../resources/files.dart';
import '../models/api_models/fitness_api_response.dart';
import '../models/json_models/fitness_response.dart';
import 'exercise_api_item.dart';
import 'exercise_item.dart';
import 'goal_item.dart';

class HomeController extends GetxController{
  RxList<GoalItem> goalItems = RxList();
  RxList<ExerciseItem> exerciseItems = RxList();

  void readJsonFile() async {
    String jsonString = await rootBundle.loadString(Files.jsonFitnessFilePath);
    var map = jsonDecode(jsonString);
    var response = FitnessResponse.fromJson(map);

    goalItems.value = response.goals
      .map((e) => GoalItem(
        cover: e.cover,
        title: e.title,
        subTitle: e.subTitle,
        caloriesCount: e.caloriesCount,
        durationSeconds: e.durationSeconds))
    .toList();

    exerciseItems.value = response.dailyExercises
      .map((e) => ExerciseItem(
        title: e.title,
        cover: e.cover,
        caloriesCount: e.caloriesCount,
        durationSeconds: e.durationSeconds)).toList();

  }

  RxBool isLoading = false.obs;
  RxList<ExerciseApiItem> exerciseApiItem = RxList();

  void getUsers() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    Uri uri = Uri.parse('https://fitness-app-api.k8s.devebs.net/workout/exercise');
    var response = await http.get(
      uri,
      /*headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY5MjI2MzA5LCJpYXQiOjE2Njg2MjE1MDksImp0aSI6ImZmYTEzNjI5MTgyOTQ2YjliNWUxMzA3M2IzNTRhNjU0IiwidXNlcl9pZCI6NH0.3umASW6E6bYs-jPbuEYZozvX6vR8JtpnM6MqueBBPUo'
      },*/
    );

    if (response.statusCode == 200) {

      FitnessApiResponse fitnessApiResponse = FitnessApiResponse.fromJson(jsonDecode(response.body));
      //print('response ${fitnessApiResponse.exercises.first.title}');

      exerciseApiItem.value = fitnessApiResponse.exercises
        .map((e) => ExerciseApiItem(
          title: e.title,
          image: e.image,
          duration: e.duration,
          repetitions: e.repetitions,
          burnCalories: e.burnCalories,
          plan: e.plan)).toList();

    }
    isLoading.value = false;

    print('response code: ${response.statusCode} response: ${response.body}');
  }
}