part of 'user_reg_button_bloc.dart';

abstract class UserRegButtonEvent extends Equatable {
  const UserRegButtonEvent();

  @override
  List<Object> get props => [];
}

class UserRegButtonClicked_Event extends UserRegButtonEvent {
  final modelObjToAdd;
  final otpFromPreviousPage;
  final otpFromTextField;

  UserRegButtonClicked_Event({
    required this.modelObjToAdd,
    required this.otpFromPreviousPage,
    required this.otpFromTextField,
  });

  @override
  List<Object> get props =>
      [modelObjToAdd, otpFromPreviousPage, otpFromTextField];
}
