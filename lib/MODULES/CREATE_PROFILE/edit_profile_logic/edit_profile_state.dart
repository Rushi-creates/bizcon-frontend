part of 'edit_profile_bloc.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

class EditProfileInitial extends EditProfileState {}

class EditProfile_loading_State extends EditProfileState {}

class EditProfile_success_State extends EditProfileState {}

class EditProfile_error_State extends EditProfileState {
  final error;

  EditProfile_error_State(this.error);

  @override
  List<Object> get props => [error];
}
