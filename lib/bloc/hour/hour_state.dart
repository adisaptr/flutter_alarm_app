part of 'hour_bloc.dart';

@immutable
abstract class HourState {}

class HourInitial extends HourState {}

class LoadedHour extends HourState {
  final String hour;

  LoadedHour({required this.hour});
}
