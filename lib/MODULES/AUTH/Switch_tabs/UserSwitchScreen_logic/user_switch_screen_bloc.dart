import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_switch_screen_event.dart';
part 'user_switch_screen_state.dart';

class UserSwitchScreenBloc
    extends Bloc<UserSwitchScreenEvent, UserSwitchScreenState> {
  UserSwitchScreenBloc() : super(UserSwitchScreenInitial()) {
    //
    on<SwitchToLogin_Event>((event, emit) => emit(SwitchedToLogin_State()));

    //
    on<SwitchToRegister_Event>(
        (event, emit) => emit(SwitchedToRegister_State()));
  }
}
