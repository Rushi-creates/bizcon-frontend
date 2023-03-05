part of 'my_bottom_bar_bloc.dart';

abstract class MyBottomBarEvent extends Equatable {
  const MyBottomBarEvent();

  @override
  List<Object> get props => [];
}

class MyBottomBar_OneCLicked_Event extends MyBottomBarEvent {}

class MyBottomBar_TwoCLicked_Event extends MyBottomBarEvent {}

class MyBottomBar_ThreeCLicked_Event extends MyBottomBarEvent {}
