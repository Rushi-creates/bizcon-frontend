import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_bottom_bar_event.dart';
part 'my_bottom_bar_state.dart';

class MyBottomBarBloc extends Bloc<MyBottomBarEvent, MyBottomBarState> {
  MyBottomBarBloc() : super(MyBottomBarInitial()) {
    // first icon

    on<MyBottomBar_OneCLicked_Event>(
        (event, emit) => emit(MyBottomBar_openOne_State()));

    // second icon
    on<MyBottomBar_TwoCLicked_Event>(
        (event, emit) => emit(MyBottomBar_openTwo_State()));

    // third icon
    on<MyBottomBar_ThreeCLicked_Event>(
        (event, emit) => emit(MyBottomBar_openThree_State()));
  }
}
