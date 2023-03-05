import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_login_form_event.dart';
part 'user_login_form_state.dart';

class UserLoginFormBloc extends Bloc<UserLoginFormEvent, UserLoginFormState> {
  UserLoginFormBloc() : super(UserLoginFormInitial()) {
    on<UserLoginEmail_Changed_Event>((event, emit) {
      if (event.emailController == '') {
        emit(UserLoginEmail_NOT_Valid_State('Email cannot be empty'));
      } else if (!event.emailController.contains('@')) {
        emit(UserLoginEmail_NOT_Valid_State('Email should contain @'));
      } else if (!event.emailController.contains('.')) {
        emit(UserLoginEmail_NOT_Valid_State('Email should contain .'));
      } else {
        print('login valid');
        emit(UserLoginPass_valid_State());
      }
    });

    //
    on<UserLoginPass_Changed_Event>((event, emit) {
      if (event.passwordController == '') {
        emit(UserLoginPass_NOT_Valid_State('Password cannot be empty'));
      } else if (event.passwordController.length < 4) {
        print('too short');
        emit(UserLoginPass_NOT_Valid_State('Password is too short'));
      } else {
        print('login pass valid');

        emit(UserLoginPass_valid_State());
      }
    });
  }
}
