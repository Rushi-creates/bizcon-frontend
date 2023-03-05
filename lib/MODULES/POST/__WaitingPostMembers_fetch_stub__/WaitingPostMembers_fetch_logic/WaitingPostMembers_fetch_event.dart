part of 'WaitingPostMembers_fetch_bloc.dart';

abstract class WaitingPostMembersFetchEvent extends Equatable {
  const WaitingPostMembersFetchEvent();

  @override
  List<Object> get props => [];
}

class WaitingPostMembers_Fetch_onInit_Event
    extends WaitingPostMembersFetchEvent {
  final post_fk;

  WaitingPostMembers_Fetch_onInit_Event(this.post_fk);

  @override
  List<Object> get props => [post_fk];
}

class WaitingPostMembers_Fetch_onRefresh_Event
    extends WaitingPostMembersFetchEvent {}
