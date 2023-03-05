part of 'user_login_button_bloc.dart';

abstract class UserLoginButtonState extends Equatable {
  const UserLoginButtonState();

  @override
  List<Object> get props => [];
}

class UserLoginButtonInitial extends UserLoginButtonState {}

class UserLoginLoadingState extends UserLoginButtonState {}

class UserLoginSuccessState extends UserLoginButtonState {}

class UserLoginFailure_accountDontExist_State extends UserLoginButtonState {
  final msg;
  UserLoginFailure_accountDontExist_State(this.msg);
}

class UserLogin_UnknownError_State extends UserLoginButtonState {
  final error;
  UserLogin_UnknownError_State(this.error);
  @override
  List<Object> get props => [error];
}
