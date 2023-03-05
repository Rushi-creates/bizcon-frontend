part of 'splash_roles_bloc.dart';

abstract class SplashRolesEvent extends Equatable {
  const SplashRolesEvent();

  @override
  List<Object> get props => [];
}

class CheckRole_OnAppStartUpEvent extends SplashRolesEvent {}
