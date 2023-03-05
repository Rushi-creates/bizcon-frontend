import 'package:bizcon1/Repo/Post_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../../service_layer_stub/Exceptions/Exceptions.dart';

part 'MyPosts_fetch_event.dart';
part 'MyPosts_fetch_state.dart';

class MyPostsFetchBloc extends Bloc<MyPostsFetchEvent, MyPostsFetchState> {
  int newCounter = 0;
  List newList = [];

  MyPostsFetchBloc() : super(MyPostsFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */
    // Queues_Api_Repo queues_Api_Repo = Queues_Api_Repo();

    Post_api_repo post_api_repo = Post_api_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<MyPosts_Fetch_onInit_Event>((event, emit) async {
      try {
        emit(MyPosts_Fetch_Loading_State(newList));

        //# incr counter
        newCounter++;

        //# calling api
        //TODO : select one ( fetch all or fetch prop)
        final List moreFetchedList =
            await post_api_repo.fetchPosts_byProp_pUid(newCounter);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        //# if nothing more is to fetch
        if (moreFetchedList.isEmpty) {
          emit(MyPosts_Fetch_More_Loaded_ButEmpty_State(newList));

          //# adding more fetched to final list
        } else if (moreFetchedList.isNotEmpty) {
          newList.addAll(moreFetchedList);

          //# always send final list here
          emit(MyPosts_Fetch_Loaded_State(newList));
        }

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(MyPosts_Fetch_Error_State(storeErr, newList));
      }
    });

    on<MyPosts_Fetch_onRefresh_Event>((event, emit) async {
      newCounter = 0;
      newList.clear();
    });
  }
}
