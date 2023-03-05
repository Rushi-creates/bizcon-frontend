part of 'user_otp_form_bloc.dart';

abstract class UserOtpFormState extends Equatable {
  const UserOtpFormState();

  @override
  List<Object> get props => [];
}

class UserOtpFormInitial extends UserOtpFormState {}

class UserRegEmail_valid_State extends UserOtpFormState {}

class UserRegNumber_valid_State extends UserOtpFormState {}

class UserRegPass_valid_State extends UserOtpFormState {}

class UserRegEmail_NOT_Valid_State extends UserOtpFormState {
  final error;
  UserRegEmail_NOT_Valid_State(this.error);

  @override
  List<Object> get props => [error];
}

class UserRegNumber_NOT_Valid_State extends UserOtpFormState {
  final error;
  UserRegNumber_NOT_Valid_State(this.error);

  @override
  List<Object> get props => [error];
}

class UserRegPass_NOT_Valid_State extends UserOtpFormState {
  final error;
  UserRegPass_NOT_Valid_State(this.error);

  @override
  List<Object> get props => [error];
}
