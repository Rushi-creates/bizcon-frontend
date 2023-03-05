part of 'user_login_form_bloc.dart';

abstract class UserLoginFormState extends Equatable {
  const UserLoginFormState();

  @override
  List<Object> get props => [];
}

class UserLoginFormInitial extends UserLoginFormState {}

class UserLoginEmail_valid_State extends UserLoginFormState {}

class UserLoginPass_valid_State extends UserLoginFormState {}

class UserLoginEmail_NOT_Valid_State extends UserLoginFormState {
  final error;
  UserLoginEmail_NOT_Valid_State(this.error);
  @override
  List<Object> get props => [error];
}

class UserLoginPass_NOT_Valid_State extends UserLoginFormState {
  final error;
  UserLoginPass_NOT_Valid_State(this.error);
  @override
  List<Object> get props => [error];
}
