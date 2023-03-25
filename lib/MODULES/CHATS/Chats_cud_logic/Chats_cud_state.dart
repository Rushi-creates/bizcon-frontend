part of 'Chats_cud_bloc.dart';

abstract class ChatsCudState extends Equatable {
  const ChatsCudState();

  @override
  List<Object> get props => [];
}

class ChatsCudInitial extends ChatsCudState {}

//! create

class Chats_create_Loading_State extends ChatsCudState {}

class Chats_create_Loaded_State extends ChatsCudState {}

class Chats_create_Error_State extends ChatsCudState {
  final error;
  Chats_create_Error_State(this.error);
}

//! update

class Chats_update_Loading_State extends ChatsCudState {}

class Chats_update_Loaded_State extends ChatsCudState {}

class Chats_update_Error_State extends ChatsCudState {
  final error;
  Chats_update_Error_State(this.error);
}

//! delete
class Chats_Delete_Loading_state extends ChatsCudState {} //loading

class Chats_Delete_Loaded_state extends ChatsCudState {} //loaded

class Chats_Delete_Error_State extends ChatsCudState {
  final error;
  Chats_Delete_Error_State(this.error);
}
