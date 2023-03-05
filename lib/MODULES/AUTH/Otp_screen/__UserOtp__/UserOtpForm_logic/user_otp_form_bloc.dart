import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_otp_form_event.dart';
part 'user_otp_form_state.dart';

class UserOtpFormBloc extends Bloc<UserOtpFormEvent, UserOtpFormState> {
  UserOtpFormBloc() : super(UserOtpFormInitial()) {
    on<UserRegEmail_Changed_Event>((event, emit) {
      if (event.emailController == '') {
        emit(UserRegEmail_NOT_Valid_State('Email cannot be empty'));
      } else if (!event.emailController.contains('@')) {
        emit(UserRegEmail_NOT_Valid_State('Email should contain @'));
      } else if (!event.emailController.contains('.')) {
        emit(UserRegEmail_NOT_Valid_State('Email should contain .'));
      } else {
        emit(UserRegPass_valid_State());
      }
    });

    //
    on<UserRegNumber_Changed_Event>((event, emit) {
      if (event.numberController == '') {
        emit(UserRegNumber_NOT_Valid_State('Number cannot be empty'));
      } else if (event.numberController.length < 10) {
        emit(UserRegNumber_NOT_Valid_State(
            'Number should be of length 10 digits'));
      } else {
        emit(UserRegNumber_valid_State());
      }
    });

    on<UserRegPass_Changed_Event>((event, emit) {
      if (event.passwordController == '') {
        emit(UserRegPass_NOT_Valid_State('Password cannot be empty'));
      } else if (event.passwordController.length < 4) {
        emit(UserRegPass_NOT_Valid_State('Password is too short'));
      } else {
        emit(UserRegPass_valid_State());
      }
    });
  }
}
