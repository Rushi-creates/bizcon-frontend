part of 'MyJoinedPosts_fetch_bloc.dart';

abstract class MyJoinedPostsFetchEvent extends Equatable {
  const MyJoinedPostsFetchEvent();

  @override
  List<Object> get props => [];
}

class MyJoinedPosts_Fetch_onInit_Event extends MyJoinedPostsFetchEvent {
  final member_fk;

  MyJoinedPosts_Fetch_onInit_Event(this.member_fk);

  @override
  List<Object> get props => [member_fk];
}

class MyJoinedPosts_Fetch_onRefresh_Event extends MyJoinedPostsFetchEvent {}
