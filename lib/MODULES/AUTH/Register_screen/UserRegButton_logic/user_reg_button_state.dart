part of 'user_reg_button_bloc.dart';

abstract class UserRegButtonState extends Equatable {
  const UserRegButtonState();

  @override
  List<Object> get props => [];
}

class UserRegButtonInitial extends UserRegButtonState {}

class UserRegisterLoadingState extends UserRegButtonState {}

class UserRegisterSuccessState extends UserRegButtonState {}

class OtpDidntMatched_State extends UserRegButtonState {}

class UserRegister_UnknownError_State extends UserRegButtonState {
  final error;

  UserRegister_UnknownError_State(this.error);
  @override
  List<Object> get props => [error];
}
