part of 'SearchProfile_fetch_bloc.dart';

abstract class SearchProfileFetchState extends Equatable {
  const SearchProfileFetchState();

  @override
  List<Object> get props => [];
}

class SearchProfileFetchInitial extends SearchProfileFetchState {}

class SearchProfile_Fetch_Loading_State extends SearchProfileFetchState {
  final prevList;
  SearchProfile_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class SearchProfile_Fetch_Loaded_State extends SearchProfileFetchState {
  final modelObjList;
  SearchProfile_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class SearchProfile_Fetch_Error_State extends SearchProfileFetchState {
  final error;
  final prevList;

  SearchProfile_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class SearchProfile_Fetch_More_Loaded_ButEmpty_State extends SearchProfileFetchState {
  final prevList;
  SearchProfile_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}
