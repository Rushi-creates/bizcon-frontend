part of 'PostMembers_cud_bloc.dart';

abstract class PostMembersCudState extends Equatable {
  const PostMembersCudState();

  @override
  List<Object> get props => [];
}

class PostMembersCudInitial extends PostMembersCudState {}

//! create

class PostMembers_create_Loading_State extends PostMembersCudState {}

class PostMembers_create_Loaded_State extends PostMembersCudState {}

class PostMembers_create_AlreadyWaiting_Loaded_State
    extends PostMembersCudState {}

class PostMembers_create_AlreadyExisiting_Loaded_State
    extends PostMembersCudState {}

class PostMembers_create_Error_State extends PostMembersCudState {
  final error;
  PostMembers_create_Error_State(this.error);
}

//! update

class PostMembers_update_Loading_State extends PostMembersCudState {}

class PostMembers_update_Loaded_State extends PostMembersCudState {}

class PostMembers_update_Error_State extends PostMembersCudState {
  final error;
  PostMembers_update_Error_State(this.error);
}

//! delete
class PostMembers_Delete_Loading_state extends PostMembersCudState {} //loading

class PostMembers_Delete_Loaded_state extends PostMembersCudState {} //loaded

class PostMembers_Delete_Error_State extends PostMembersCudState {
  final error;
  PostMembers_Delete_Error_State(this.error);
}
