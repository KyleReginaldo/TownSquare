// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:townsquare/data/data_source/remote_datasource.dart';
import 'package:townsquare/domain/entity/activity_entity.dart';
import 'package:townsquare/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDatasource remote;
  RepositoryImpl({
    required this.remote,
  });
  @override
  Future<List<ActivityEntity>> fetchAvailableActivities(
      {String? category}) async {
    return await remote.fetchAvailableActivities(category: category);
  }
}
