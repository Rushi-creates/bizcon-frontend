part of 'user_switch_screen_bloc.dart';

abstract class UserSwitchScreenEvent extends Equatable {
  const UserSwitchScreenEvent();

  @override
  List<Object> get props => [];
}

class SwitchToLogin_Event extends UserSwitchScreenEvent {}

class SwitchToRegister_Event extends UserSwitchScreenEvent {}
