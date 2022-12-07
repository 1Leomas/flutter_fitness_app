class Exercise {
  final int id;
  final String title;
  final String image;
  final int durationSeconds;
  final int repetitions;
  final int burnCalories;
  final int plan;
  final int? nextExercise;

  Exercise(
      this.id,
      this.title,
      this.image,
      this.durationSeconds,
      this.repetitions,
      this.burnCalories,
      this.plan,
      this.nextExercise
  );
}