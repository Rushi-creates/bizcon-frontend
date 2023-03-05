part of 'user_otp_button_bloc.dart';

abstract class UserOtpButtonState extends Equatable {
  const UserOtpButtonState();

  @override
  List<Object> get props => [];
}

class UserOtpButtonInitial extends UserOtpButtonState {}

class UserOtp_LoadingState extends UserOtpButtonState {}

class UserOtp_SuccessState extends UserOtpButtonState {
  final otp;
  UserOtp_SuccessState(this.otp);
  @override
  List<Object> get props => [otp];
}

class UserOtp_accountAlreadyExists_State extends UserOtpButtonState {
  final msg;
  UserOtp_accountAlreadyExists_State(this.msg);
}

class UserOtp_UnknownError_State extends UserOtpButtonState {
  final error;
  UserOtp_UnknownError_State(this.error);
  @override
  List<Object> get props => [error];
}
