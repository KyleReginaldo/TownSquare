// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:townsquare/domain/usecase/fetch_available_activities.dart';

import '../../../domain/entity/activity_entity.dart';

part 'available_activity_state.dart';

class AvailableActivityCubit extends Cubit<AvailableActivityState> {
  AvailableActivityCubit(
    this.fetchAvailableActivities,
  ) : super(AvailableActivityInitial());

  final FetchAvailableActivities fetchAvailableActivities;

  void onFetchAvailableActivities({String? category}) async {
    emit(AvailableActivityLoading());
    final activities = await fetchAvailableActivities(category: category);
    if (activities.isEmpty) {
      emit(AvailableActivityEmpty());
    } else {
      emit(AvailableActivityLoaded(activities: activities));
    }
  }
}
