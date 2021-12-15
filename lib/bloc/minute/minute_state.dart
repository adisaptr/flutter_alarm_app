part of 'minute_bloc.dart';

@immutable
abstract class MinuteState {}

class MinuteInitial extends MinuteState {}

class LoadedMinute extends MinuteState {
  final String minute;

  LoadedMinute({required this.minute});
}
