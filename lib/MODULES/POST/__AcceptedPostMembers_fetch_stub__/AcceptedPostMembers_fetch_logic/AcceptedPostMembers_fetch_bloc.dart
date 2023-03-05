import 'package:bizcon1/Repo/PostMembers_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../../service_layer_stub/Exceptions/Exceptions.dart';

part 'AcceptedPostMembers_fetch_event.dart';
part 'AcceptedPostMembers_fetch_state.dart';

class AcceptedPostMembersFetchBloc
    extends Bloc<AcceptedPostMembersFetchEvent, AcceptedPostMembersFetchState> {
  int newCounter = 0;
  List newList = [];

  AcceptedPostMembersFetchBloc() : super(AcceptedPostMembersFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */
    // Queues_Api_Repo queues_Api_Repo = Queues_Api_Repo();
    PostMembers_api_repo postMembers_api_repo = PostMembers_api_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<AcceptedPostMembers_Fetch_onInit_Event>((event, emit) async {
      try {
        emit(AcceptedPostMembers_Fetch_Loading_State(newList));

        //# incr counter
        newCounter++;

        //# calling api
        //TODO : select one ( fetch all or fetch prop)
        final List moreFetchedList = await postMembers_api_repo
            .fetchProp_postFk_isAcceptedTrue(newCounter, event.post_fk);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        //# if nothing more is to fetch
        if (moreFetchedList.isEmpty) {
          emit(AcceptedPostMembers_Fetch_More_Loaded_ButEmpty_State(newList));

          //# adding more fetched to final list
        } else if (moreFetchedList.isNotEmpty) {
          newList.addAll(moreFetchedList);

          //# always send final list here
          emit(AcceptedPostMembers_Fetch_Loaded_State(newList));
        }

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(AcceptedPostMembers_Fetch_Error_State(storeErr, newList));
      }
    });

    on<AcceptedPostMembers_Fetch_onRefresh_Event>((event, emit) async {
      newCounter = 0;
      newList.clear();
    });
  }
}
