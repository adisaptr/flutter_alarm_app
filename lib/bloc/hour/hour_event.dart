part of 'hour_bloc.dart';

@immutable
abstract class HourEvent {}

class SetHour extends HourEvent {
  final int hour;

  SetHour(this.hour);

  List<Object> get props => [hour];
}
