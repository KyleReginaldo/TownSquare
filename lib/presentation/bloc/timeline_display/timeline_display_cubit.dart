import 'package:flutter_bloc/flutter_bloc.dart';

class TimelineDisplayCubit extends Cubit<double?> {
  TimelineDisplayCubit() : super(null);

  void setColumnHeight(double columnHeight) {
    emit(columnHeight);
  }
}
