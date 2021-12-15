import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'minute_event.dart';
part 'minute_state.dart';

class MinuteBloc extends Bloc<MinuteEvent, MinuteState> {
  MinuteBloc() : super(MinuteInitial()) {
    on<SetMinute>((event, emit) {
      var minute = event.minute.toString();
      if (minute.length < 2) {
        minute = '0' + minute;
      }
      emit(LoadedMinute(minute: minute));
    });
  }
}
