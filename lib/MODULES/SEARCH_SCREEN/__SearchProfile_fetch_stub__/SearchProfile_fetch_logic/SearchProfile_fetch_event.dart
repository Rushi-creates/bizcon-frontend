part of 'SearchProfile_fetch_bloc.dart';

abstract class SearchProfileFetchEvent extends Equatable {
  const SearchProfileFetchEvent();

  @override
  List<Object> get props => [];
}

class SearchProfile_Fetch_onInit_Event extends SearchProfileFetchEvent {
  final searchText;

  SearchProfile_Fetch_onInit_Event(this.searchText);
  @override
  List<Object> get props => [searchText];
}

class SearchProfile_Fetch_onRefresh_Event extends SearchProfileFetchEvent {}
