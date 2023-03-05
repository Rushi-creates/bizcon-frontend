part of 'user_login_form_bloc.dart';

abstract class UserLoginFormEvent extends Equatable {
  const UserLoginFormEvent();

  @override
  List<Object> get props => [];
}

class UserLoginEmail_Changed_Event extends UserLoginFormEvent {
  final String emailController;
  UserLoginEmail_Changed_Event(this.emailController);
  @override
  List<Object> get props => [emailController];
}

class UserLoginPass_Changed_Event extends UserLoginFormEvent {
  final passwordController;
  UserLoginPass_Changed_Event(this.passwordController);
  @override
  List<Object> get props => [passwordController];
}
