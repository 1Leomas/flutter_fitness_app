import 'dart:async';

import 'package:get/get.dart';

class ExerciseController extends GetxController {

  final hours = 0.obs;
  final minutes = 0.obs;
  final seconds = 0.obs;


  final countDownIsRunning = false.obs;

  changeButtonState() {
    countDownIsRunning.value = !(countDownIsRunning.value);
  }

  var duration = Duration().obs;
  var totalDuration = Duration();
  Timer? timer;

  final sHours = "".obs;
  final sMinutes = "".obs;
  final sSeconds = "".obs;

  void changeTime() {
    if(duration.value.inMilliseconds > 21) {
      final time = duration.value.inMilliseconds - 20;
      duration.value = Duration(milliseconds: time);
      update();
    } else {
      stopTimer(restart: false);
      resetTimer();
    }
  }

  void stopTimer({bool restart = true}) {
    if(restart) {
      resetTimer();
      update();
    }
    timer?.cancel();
    update();
  }

  void startTimer({bool restart = true}) {
    if(restart) {
      resetTimer();
      update();
    }
    timer = Timer.periodic( const Duration(milliseconds: 20), (_) => changeTime());
  }

  void resetTimer() {
    duration.value = Duration(seconds: seconds.value);
    totalDuration = Duration(seconds: duration.value.inSeconds);
    update();
  }

  bool isTimerRunning() {
    return timer == null ? false : timer!.isActive;
  }

  bool isCompleted() {
    return
      duration.value == totalDuration ||
          duration.value.inSeconds == 0;
  }

  void pauseTimer() {
    if (timer != null) {
      timer?.cancel();
      update();
    }
  }

  void unPauseTimer() {
    startTimer(restart: false);
    update();
  }

  void repeatTimer(){
    duration.value = Duration(milliseconds: totalDuration.inMilliseconds);
    update();
  }

}