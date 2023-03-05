part of 'AllPosts_fetch_bloc.dart';

abstract class AllPostsFetchEvent extends Equatable {
  const AllPostsFetchEvent();

  @override
  List<Object> get props => [];
}

class AllPosts_Fetch_onInit_Event extends AllPostsFetchEvent {}

class AllPosts_Fetch_onRefresh_Event extends AllPostsFetchEvent {}
