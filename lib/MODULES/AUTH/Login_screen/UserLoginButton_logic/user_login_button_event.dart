part of 'user_login_button_bloc.dart';

abstract class UserLoginButtonEvent extends Equatable {
  const UserLoginButtonEvent();

  @override
  List<Object> get props => [];
}

class UserLoginButton_Clicked_Event extends UserLoginButtonEvent {
  final modelObj;

  UserLoginButton_Clicked_Event(this.modelObj);
  @override
  List<Object> get props => [modelObj];
}
