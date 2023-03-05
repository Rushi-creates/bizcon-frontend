part of 'MyJoinedPosts_fetch_screen.dart';

class MyJoinedPosts_fetch_fetchList_widget extends StatelessWidget {
  const MyJoinedPosts_fetch_fetchList_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return fetchListStates();
  }

  /* -------------------------------------------------------------------------- */
/*                           //! fetch list states                            */
/* -------------------------------------------------------------------------- */

  fetchListStates() {
    return BlocBuilder<MyJoinedPostsFetchBloc, MyJoinedPostsFetchState>(builder: (context, state) {
      if (state is MyJoinedPosts_Fetch_Loaded_State) {
        return buildFetchList(state.modelObjList);
      } else if (state is MyJoinedPosts_Fetch_More_Loaded_ButEmpty_State) {
        return buildFetchList(state.prevList);
      } else if (state is MyJoinedPosts_Fetch_Loading_State) {
        return buildFetchList(state.prevList);
      } else if (state is MyJoinedPosts_Fetch_Error_State) {
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
              return MyJoinedPosts_fetch_listTile_widget(singleObj: listArg[i]);
            },
          );
  }
}
