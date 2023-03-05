part of 'AcceptedPostMembers_fetch_bloc.dart';

abstract class AcceptedPostMembersFetchEvent extends Equatable {
  const AcceptedPostMembersFetchEvent();

  @override
  List<Object> get props => [];
}

class AcceptedPostMembers_Fetch_onInit_Event
    extends AcceptedPostMembersFetchEvent {
  final post_fk;

  AcceptedPostMembers_Fetch_onInit_Event(this.post_fk);
  @override
  List<Object> get props => [post_fk];
}

class AcceptedPostMembers_Fetch_onRefresh_Event
    extends AcceptedPostMembersFetchEvent {}
