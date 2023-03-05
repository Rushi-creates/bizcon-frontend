part of 'Post_cud_bloc.dart';

abstract class PostCudState extends Equatable {
  const PostCudState();

  @override
  List<Object> get props => [];
}

class PostCudInitial extends PostCudState {}

//! create

class Post_create_Loading_State extends PostCudState {}

class Post_create_Loaded_State extends PostCudState {}

class Post_create_Error_State extends PostCudState {
  final error;
  Post_create_Error_State(this.error);
}

//! update

class Post_update_Loading_State extends PostCudState {}

class Post_update_Loaded_State extends PostCudState {}

class Post_update_Error_State extends PostCudState {
  final error;
  Post_update_Error_State(this.error);
}

//! delete
class Post_Delete_Loading_state extends PostCudState {} //loading

class Post_Delete_Loaded_state extends PostCudState {} //loaded

class Post_Delete_Error_State extends PostCudState {
  final error;
  Post_Delete_Error_State(this.error);
}
