part of 'user_otp_button_bloc.dart';

abstract class UserOtpButtonEvent extends Equatable {
  const UserOtpButtonEvent();

  @override
  List<Object> get props => [];
}

class UserOtpButtonClicked_Event extends UserOtpButtonEvent {
  final modelObj;

  UserOtpButtonClicked_Event(this.modelObj);
  @override
  List<Object> get props => [modelObj];
}
