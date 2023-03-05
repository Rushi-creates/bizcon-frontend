part of 'SearchProfile_fetch_screen.dart';

class SearchProfile_fetch_fetchList_widget extends StatelessWidget {
  const SearchProfile_fetch_fetchList_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return fetchListStates();
  }

  /* -------------------------------------------------------------------------- */
/*                           //! fetch list states                            */
/* -------------------------------------------------------------------------- */

  fetchListStates() {
    return BlocBuilder<SearchProfileFetchBloc, SearchProfileFetchState>(builder: (context, state) {
      if (state is SearchProfile_Fetch_Loaded_State) {
        return buildFetchList(state.modelObjList);
      } else if (state is SearchProfile_Fetch_More_Loaded_ButEmpty_State) {
        return buildFetchList(state.prevList);
      } else if (state is SearchProfile_Fetch_Loading_State) {
        return buildFetchList(state.prevList);
      } else if (state is SearchProfile_Fetch_Error_State) {
        return buildFetchList(state.prevList);
      }

      return buildFetchList([]);
    });
  }

/* -------------------------------------------------------------------------- */
/*                 //! if loaded then build fetchList                         */
/* -------------------------------------------------------------------------- */

  buildFetchList(List listArg) {
    return listArg.isEmpty
        ? MyComponents.showFetchListEmptyMsg()
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: listArg.length,
            itemBuilder: (context, i) {
              return SearchProfile_fetch_listTile_widget(singleObj: listArg[i]);
            },
          );
  }
}
