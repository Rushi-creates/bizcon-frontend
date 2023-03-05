import 'package:bizcon1/Repo/Profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../../service_layer_stub/Exceptions/Exceptions.dart';

part 'SearchProfile_fetch_event.dart';
part 'SearchProfile_fetch_state.dart';

class SearchProfileFetchBloc
    extends Bloc<SearchProfileFetchEvent, SearchProfileFetchState> {
  int newCounter = 0;
  List newList = [];

  SearchProfileFetchBloc() : super(SearchProfileFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */
    // Queues_Api_Repo queues_Api_Repo = Queues_Api_Repo();
    Profile_api_repo profile_api_repo = Profile_api_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<SearchProfile_Fetch_onInit_Event>((event, emit) async {
      if (event.searchText.length != 0) {
        try {
          emit(SearchProfile_Fetch_Loading_State(newList));

          //# incr counter
          newCounter++;

          //# calling api
          //TODO : select one ( fetch all or fetch prop)
          final List moreFetchedList = await profile_api_repo
              .fetchProp_byUsername(newCounter, event.searchText);
          // final List moreFetchedList =
          //     await queues_Api_Repo.fetchAll(newCounter);

          //# if nothing more is to fetch
          if (moreFetchedList.isEmpty) {
            emit(SearchProfile_Fetch_More_Loaded_ButEmpty_State(newList));

            //# adding more fetched to final list
          } else if (moreFetchedList.isNotEmpty) {
            newList.addAll(moreFetchedList);

            //# always send final list here
            emit(SearchProfile_Fetch_Loaded_State(newList));
          }

          //# catch error
        } catch (e) {
          print(e);
          var storeErr = CustomExceptions.checkExcp(e.runtimeType);
          emit(SearchProfile_Fetch_Error_State(storeErr, newList));
        }
      }
    });

    on<SearchProfile_Fetch_onRefresh_Event>((event, emit) async {
      newCounter = 0;
      newList.clear();
    });
  }
}
