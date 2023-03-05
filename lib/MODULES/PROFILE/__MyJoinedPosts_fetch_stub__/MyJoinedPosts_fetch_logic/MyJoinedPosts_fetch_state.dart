part of 'MyJoinedPosts_fetch_bloc.dart';

abstract class MyJoinedPostsFetchState extends Equatable {
  const MyJoinedPostsFetchState();

  @override
  List<Object> get props => [];
}

class MyJoinedPostsFetchInitial extends MyJoinedPostsFetchState {}

class MyJoinedPosts_Fetch_Loading_State extends MyJoinedPostsFetchState {
  final prevList;
  MyJoinedPosts_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class MyJoinedPosts_Fetch_Loaded_State extends MyJoinedPostsFetchState {
  final modelObjList;
  MyJoinedPosts_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class MyJoinedPosts_Fetch_Error_State extends MyJoinedPostsFetchState {
  final error;
  final prevList;

  MyJoinedPosts_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class MyJoinedPosts_Fetch_More_Loaded_ButEmpty_State extends MyJoinedPostsFetchState {
  final prevList;
  MyJoinedPosts_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}
