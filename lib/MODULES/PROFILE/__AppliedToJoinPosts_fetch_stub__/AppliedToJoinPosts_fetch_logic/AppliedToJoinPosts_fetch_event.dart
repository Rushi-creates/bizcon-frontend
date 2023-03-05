part of 'AppliedToJoinPosts_fetch_bloc.dart';

abstract class AppliedToJoinPostsFetchEvent extends Equatable {
  const AppliedToJoinPostsFetchEvent();

  @override
  List<Object> get props => [];
}

class AppliedToJoinPosts_Fetch_onInit_Event
    extends AppliedToJoinPostsFetchEvent {
  final member_fk;

  AppliedToJoinPosts_Fetch_onInit_Event(this.member_fk);

  @override
  List<Object> get props => [member_fk];
}

class AppliedToJoinPosts_Fetch_onRefresh_Event
    extends AppliedToJoinPostsFetchEvent {}
