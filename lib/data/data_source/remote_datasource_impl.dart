import 'package:townsquare/core/constant/data.dart';
import 'package:townsquare/data/data_source/remote_datasource.dart';
import 'package:townsquare/data/model/activity_model.dart';
import 'package:townsquare/main.dart';

class RemoteDatasourceImpl implements RemoteDatasource {
  @override
  Future<List<ActivityModel>> fetchAvailableActivities(
      {String? category}) async {
    await Future.delayed(const Duration(seconds: 1));
    final map = (category == null || category == 'All')
        ? kMockupData
        : kMockupData.where((element) => element['category'] == category);
    final activities = map.map((e) {
      return ActivityModel.fromMap(
        e,
      );
    }).toList();

    return activities.where((element) {
      final prefID = sharedPreferences?.getInt(
        element.id.toString(),
      );
      print('prefs: $prefID');
      if (prefID != null) {
        element.availableSpots--;
        element.joined = true;
      } else {
        element.joined = false;
      }
      return true;
    }).toList();
  }
}
