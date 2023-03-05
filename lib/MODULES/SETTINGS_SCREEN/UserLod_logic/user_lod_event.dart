part of 'user_lod_bloc.dart';

abstract class UserLodEvent extends Equatable {
  const UserLodEvent();

  @override
  List<Object> get props => [];
}

//! Logout
class UserLogoutButtonPressedEvent extends UserLodEvent {}

//! Logout for superadmin
// class Logout_forSuperAdmin_ButtonPressedEvent extends UserLodEvent {}

//! Delete user account (admin is also considered as user)
class UserDeleteUserAccount_ButtonPressedEvent extends UserLodEvent {}
