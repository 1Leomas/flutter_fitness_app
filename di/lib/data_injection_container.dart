import 'package:data/fitness/data_sources/api/fitness_api_data_source.dart';
import 'package:data/fitness/repository/fitness_repository_impl.dart';
import 'package:domain/fitness/repository/fitness_repository.dart';
import 'package:get_it/get_it.dart';

Future initData() async {
  var getIt = GetIt.instance;

  //DataSource
  getIt.registerLazySingleton<FitnessApiDataSource>(() => FitnessApiDataSourceImpl());

  //Repositories
  getIt.registerLazySingleton<FitnessRepository>(
    () => FitnessRepositoryImpl(getIt.get<FitnessApiDataSource>()));
}