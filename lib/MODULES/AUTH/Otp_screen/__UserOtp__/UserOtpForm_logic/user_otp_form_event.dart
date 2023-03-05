part of 'user_otp_form_bloc.dart';

abstract class UserOtpFormEvent extends Equatable {
  const UserOtpFormEvent();

  @override
  List<Object> get props => [];
}

class UserRegEmail_Changed_Event extends UserOtpFormEvent {
  final String emailController;
  UserRegEmail_Changed_Event(this.emailController);
  @override
  List<Object> get props => [emailController];
}

class UserRegNumber_Changed_Event extends UserOtpFormEvent {
  final numberController;
  UserRegNumber_Changed_Event(this.numberController);
  @override
  List<Object> get props => [numberController];
}

class UserRegPass_Changed_Event extends UserOtpFormEvent {
  final passwordController;
  UserRegPass_Changed_Event(this.passwordController);
  @override
  List<Object> get props => [passwordController];
}
