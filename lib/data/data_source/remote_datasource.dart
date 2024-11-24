import 'package:townsquare/data/model/activity_model.dart';

abstract class RemoteDatasource {
  Future<List<ActivityModel>> fetchAvailableActivities({String? category});
}
