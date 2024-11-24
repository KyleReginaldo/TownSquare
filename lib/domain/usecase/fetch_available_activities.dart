// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:townsquare/domain/repository/repository.dart';

import '../entity/activity_entity.dart';

class FetchAvailableActivities {
  final Repository repo;
  FetchAvailableActivities({
    required this.repo,
  });

  Future<List<ActivityEntity>> call({String? category}) async {
    return await repo.fetchAvailableActivities(category: category);
  }
}
