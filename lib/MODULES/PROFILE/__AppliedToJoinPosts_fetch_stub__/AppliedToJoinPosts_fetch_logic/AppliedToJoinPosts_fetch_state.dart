part of 'AppliedToJoinPosts_fetch_bloc.dart';

abstract class AppliedToJoinPostsFetchState extends Equatable {
  const AppliedToJoinPostsFetchState();

  @override
  List<Object> get props => [];
}

class AppliedToJoinPostsFetchInitial extends AppliedToJoinPostsFetchState {}

class AppliedToJoinPosts_Fetch_Loading_State extends AppliedToJoinPostsFetchState {
  final prevList;
  AppliedToJoinPosts_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class AppliedToJoinPosts_Fetch_Loaded_State extends AppliedToJoinPostsFetchState {
  final modelObjList;
  AppliedToJoinPosts_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class AppliedToJoinPosts_Fetch_Error_State extends AppliedToJoinPostsFetchState {
  final error;
  final prevList;

  AppliedToJoinPosts_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class AppliedToJoinPosts_Fetch_More_Loaded_ButEmpty_State extends AppliedToJoinPostsFetchState {
  final prevList;
  AppliedToJoinPosts_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}
