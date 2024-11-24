// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'available_activity_cubit.dart';

abstract class AvailableActivityState {}

class AvailableActivityInitial extends AvailableActivityState {}

class AvailableActivityLoading extends AvailableActivityState {}

class AvailableActivityLoaded extends AvailableActivityState {
  final List<ActivityEntity> activities;
  AvailableActivityLoaded({
    required this.activities,
  });
}

class AvailableActivityEmpty extends AvailableActivityState {}
