part of 'PostMembers_cud_bloc.dart';

abstract class PostMembersCudEvent extends Equatable {
  const PostMembersCudEvent();

  @override
  List<Object> get props => [];
}

//! create

class PostMembers_create_onButtonPressed_Event extends PostMembersCudEvent {
  final modelObjToAdd;
  PostMembers_create_onButtonPressed_Event(this.modelObjToAdd);
}

//!  update
class PostMembers_Update_onButtonPressed_Event extends PostMembersCudEvent {
  final modelObjToAdd;
  final modelObj_id;
  PostMembers_Update_onButtonPressed_Event(
      this.modelObjToAdd, this.modelObj_id);
}

//!  delete
class PostMembers_Delete_onButtonPressed_Event extends PostMembersCudEvent {
  final modelObj_id;
  PostMembers_Delete_onButtonPressed_Event(this.modelObj_id);
}
