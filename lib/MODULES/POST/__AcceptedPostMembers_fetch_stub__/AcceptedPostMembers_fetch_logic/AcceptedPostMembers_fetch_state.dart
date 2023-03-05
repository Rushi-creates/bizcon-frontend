part of 'AcceptedPostMembers_fetch_bloc.dart';

abstract class AcceptedPostMembersFetchState extends Equatable {
  const AcceptedPostMembersFetchState();

  @override
  List<Object> get props => [];
}

class AcceptedPostMembersFetchInitial extends AcceptedPostMembersFetchState {}

class AcceptedPostMembers_Fetch_Loading_State extends AcceptedPostMembersFetchState {
  final prevList;
  AcceptedPostMembers_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class AcceptedPostMembers_Fetch_Loaded_State extends AcceptedPostMembersFetchState {
  final modelObjList;
  AcceptedPostMembers_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class AcceptedPostMembers_Fetch_Error_State extends AcceptedPostMembersFetchState {
  final error;
  final prevList;

  AcceptedPostMembers_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class AcceptedPostMembers_Fetch_More_Loaded_ButEmpty_State extends AcceptedPostMembersFetchState {
  final prevList;
  AcceptedPostMembers_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}
