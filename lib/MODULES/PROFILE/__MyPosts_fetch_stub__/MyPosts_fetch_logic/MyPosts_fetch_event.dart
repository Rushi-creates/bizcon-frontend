part of 'MyPosts_fetch_bloc.dart';

abstract class MyPostsFetchEvent extends Equatable {
  const MyPostsFetchEvent();

  @override
  List<Object> get props => [];
}

class MyPosts_Fetch_onInit_Event extends MyPostsFetchEvent {
  final profilePuid;

  MyPosts_Fetch_onInit_Event(this.profilePuid);

  @override
  List<Object> get props => [profilePuid];
}

class MyPosts_Fetch_onRefresh_Event extends MyPostsFetchEvent {}
