part of 'AcceptedPostMembers_fetch_screen.dart';

class AcceptedPostMembers_fetch_fetchList_widget extends StatelessWidget {
  final fromProfile;
  const AcceptedPostMembers_fetch_fetchList_widget({required this.fromProfile});

  @override
  Widget build(BuildContext context) {
    return fetchListStates();
  }

  /* -------------------------------------------------------------------------- */
/*                           //! fetch list states                            */
/* -------------------------------------------------------------------------- */

  fetchListStates() {
    return BlocBuilder<AcceptedPostMembersFetchBloc,
        AcceptedPostMembersFetchState>(builder: (context, state) {
      if (state is AcceptedPostMembers_Fetch_Loaded_State) {
        return buildFetchList(state.modelObjList);
      } else if (state
          is AcceptedPostMembers_Fetch_More_Loaded_ButEmpty_State) {
        return buildFetchList(state.prevList);
      } else if (state is AcceptedPostMembers_Fetch_Loading_State) {
        return buildFetchList(state.prevList);
      } else if (state is AcceptedPostMembers_Fetch_Error_State) {
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
              return AcceptedPostMembers_fetch_listTile_widget(
                  singleObj: listArg[i], fromProfile: fromProfile);
            },
          );
  }
}
