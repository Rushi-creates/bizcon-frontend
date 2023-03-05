part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

class EditProfile_ButtonPressed_Event extends EditProfileEvent {
  final modelObjToAdd;
  final bool isProfileUpdateEvent;

  EditProfile_ButtonPressed_Event(
      {required this.modelObjToAdd, required this.isProfileUpdateEvent});

  @override
  List<Object> get props => [modelObjToAdd, isProfileUpdateEvent];
}
