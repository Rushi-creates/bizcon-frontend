part of 'WaitingPostMembers_fetch_bloc.dart';

abstract class WaitingPostMembersFetchState extends Equatable {
  const WaitingPostMembersFetchState();

  @override
  List<Object> get props => [];
}

class WaitingPostMembersFetchInitial extends WaitingPostMembersFetchState {}

class WaitingPostMembers_Fetch_Loading_State extends WaitingPostMembersFetchState {
  final prevList;
  WaitingPostMembers_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class WaitingPostMembers_Fetch_Loaded_State extends WaitingPostMembersFetchState {
  final modelObjList;
  WaitingPostMembers_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class WaitingPostMembers_Fetch_Error_State extends WaitingPostMembersFetchState {
  final error;
  final prevList;

  WaitingPostMembers_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class WaitingPostMembers_Fetch_More_Loaded_ButEmpty_State extends WaitingPostMembersFetchState {
  final prevList;
  WaitingPostMembers_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}
