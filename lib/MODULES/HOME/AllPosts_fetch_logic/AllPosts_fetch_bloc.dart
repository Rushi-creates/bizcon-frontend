import 'package:bizcon1/Repo/Post_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../service_layer_stub/Exceptions/Exceptions.dart';

part 'AllPosts_fetch_event.dart';
part 'AllPosts_fetch_state.dart';

class AllPostsFetchBloc extends Bloc<AllPostsFetchEvent, AllPostsFetchState> {
  int newCounter = 0;
  List newList = [];

  AllPostsFetchBloc() : super(AllPostsFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */

    Post_api_repo post_api_repo = Post_api_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<AllPosts_Fetch_onInit_Event>((event, emit) async {
      try {
        emit(AllPosts_Fetch_Loading_State(newList));

        //# incr counter
        newCounter++;

        //# calling api
        final List moreFetchedList = await post_api_repo.fetchAll(newCounter);

        //# if nothing more is to fetch
        if (moreFetchedList.isEmpty) {
          emit(AllPosts_Fetch_More_Loaded_ButEmpty_State(newList));

          //# adding more fetched to final list
        } else if (moreFetchedList.isNotEmpty) {
          newList.addAll(moreFetchedList);

          //# always send final list here
          emit(AllPosts_Fetch_Loaded_State(newList));
        }

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(AllPosts_Fetch_Error_State(storeErr, newList));
      }
    });

    on<AllPosts_Fetch_onRefresh_Event>((event, emit) async {
      newCounter = 0;
      newList.clear();
    });
  }
}
