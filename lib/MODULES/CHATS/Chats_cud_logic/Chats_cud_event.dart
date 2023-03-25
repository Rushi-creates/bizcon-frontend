part of 'Chats_cud_bloc.dart';

abstract class ChatsCudEvent extends Equatable {
  const ChatsCudEvent();

  @override
  List<Object> get props => [];
}

//! create

class Chats_create_onButtonPressed_Event extends ChatsCudEvent {
  final modelObjToAdd;
  final collectionName;
  Chats_create_onButtonPressed_Event(this.modelObjToAdd, this.collectionName);

  @override
  List<Object> get props => [modelObjToAdd, collectionName];
}

//!  update
class Chats_Update_onButtonPressed_Event extends ChatsCudEvent {
  final modelObjToAdd;
  final modelObj_id;
  Chats_Update_onButtonPressed_Event(this.modelObjToAdd, this.modelObj_id);
}

//!  delete
class Chats_Delete_onButtonPressed_Event extends ChatsCudEvent {
  final modelObj_id;
  Chats_Delete_onButtonPressed_Event(this.modelObj_id);
}
