part of 'user_switch_screen_bloc.dart';

abstract class UserSwitchScreenState extends Equatable {
  const UserSwitchScreenState();

  @override
  List<Object> get props => [];
}

class UserSwitchScreenInitial extends UserSwitchScreenState {}

class SwitchedToLogin_State extends UserSwitchScreenState {}

class SwitchedToRegister_State extends UserSwitchScreenState {}
