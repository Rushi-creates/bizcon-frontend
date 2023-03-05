part of 'splash_roles_bloc.dart';

abstract class SplashRolesState extends Equatable {
  const SplashRolesState();

  @override
  List<Object> get props => [];
}

class SplashRolesInitial extends SplashRolesState {}

//
class RolesInitial extends SplashRolesState {}

class RoleLoadingState extends SplashRolesState {}

class RoleErrorState extends SplashRolesState {}

//
class User_Role_State extends SplashRolesState {}

class SelectRoleScreen_state extends SplashRolesState {}

//
class ProfileNotCreated_Role_State extends SplashRolesState {}
