part of 'user_lod_bloc.dart';

abstract class UserLodState extends Equatable {
  const UserLodState();

  @override
  List<Object> get props => [];
}

class UserLodInitial extends UserLodState {}

//! Logout
class UserLogout_Loading_State extends UserLodState {}

class UserLogout_Success_State extends UserLodState {}

class UserLogout_Failure_State extends UserLodState {}

// //! Logout for SuperAdmin
// class UserLogout_SuperAdmin_Loading_State extends UserLodState {}

// class UserLogout_SuperAdmin_Success_State extends UserLodState {}

// class UserLogout_SuperAdmin_Failure_State extends UserLodState {}

//! Delete user Account

class UserDeleteUserAccount_Loading_State extends UserLodState {}

class UserDeleteUserAccount_Success_State extends UserLodState {}

class UserDeleteUserAccount_Failure_State extends UserLodState {}
