part of 'Post_cud_bloc.dart';

abstract class PostCudEvent extends Equatable {
  const PostCudEvent();

  @override
  List<Object> get props => [];
}

//! create

class Post_create_onButtonPressed_Event extends PostCudEvent {
  final modelObjToAdd;
  Post_create_onButtonPressed_Event(this.modelObjToAdd);
}

//!  update
class Post_Update_onButtonPressed_Event extends PostCudEvent {
  final modelObjToAdd;
  final modelObj_id;
  Post_Update_onButtonPressed_Event(this.modelObjToAdd, this.modelObj_id);
}

//!  delete
class Post_Delete_onButtonPressed_Event extends PostCudEvent {
  final modelObj_id;
  Post_Delete_onButtonPressed_Event(this.modelObj_id);
}
