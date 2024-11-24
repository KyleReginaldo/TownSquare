import 'package:get_it/get_it.dart';
import 'package:townsquare/data/data_source/remote_datasource.dart';
import 'package:townsquare/data/data_source/remote_datasource_impl.dart';
import 'package:townsquare/data/repository/repository_impl.dart';
import 'package:townsquare/domain/repository/repository.dart';
import 'package:townsquare/domain/usecase/fetch_available_activities.dart';
import 'package:townsquare/presentation/bloc/available_activity/available_activity_cubit.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => AvailableActivityCubit(sl()));

  sl.registerLazySingleton(() => FetchAvailableActivities(repo: sl()));

  sl.registerLazySingleton<Repository>(() => RepositoryImpl(remote: sl()));
  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImpl());
}
