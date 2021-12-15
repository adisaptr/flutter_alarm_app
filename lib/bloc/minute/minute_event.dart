part of 'minute_bloc.dart';

@immutable
abstract class MinuteEvent {}

class SetMinute extends MinuteEvent {
  final int minute;

  SetMinute(this.minute);

  List<Object> get props => [minute];
}
