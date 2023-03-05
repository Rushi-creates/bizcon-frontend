part of 'AllPosts_fetch_bloc.dart';

abstract class AllPostsFetchState extends Equatable {
  const AllPostsFetchState();

  @override
  List<Object> get props => [];
}

class AllPostsFetchInitial extends AllPostsFetchState {}

class AllPosts_Fetch_Loading_State extends AllPostsFetchState {
  final prevList;
  AllPosts_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class AllPosts_Fetch_Loaded_State extends AllPostsFetchState {
  final modelObjList;
  AllPosts_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class AllPosts_Fetch_Error_State extends AllPostsFetchState {
  final error;
  final prevList;

  AllPosts_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class AllPosts_Fetch_More_Loaded_ButEmpty_State extends AllPostsFetchState {
  final prevList;
  AllPosts_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}
