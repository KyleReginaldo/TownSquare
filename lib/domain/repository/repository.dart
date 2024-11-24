import 'package:townsquare/domain/entity/activity_entity.dart';

abstract class Repository {
  Future<List<ActivityEntity>> fetchAvailableActivities({String? category});
}
