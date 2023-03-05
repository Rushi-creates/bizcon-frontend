import 'package:bizcon1/MODULES/HOME/AllPosts_fetch_logic/AllPosts_fetch_bloc.dart';
import 'package:bizcon1/MODULES/HOME/AllPosts_fetch_logic/__AllPosts_fetch_screen__/AllPosts_fetch_fetchList/AllPosts_fetch_listTile_widget.dart';
import 'package:bizcon1/MODULES/POST/PostCard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../COMMON/myComponents.dart';

class AllPosts_fetch_fetchList_widget extends StatelessWidget {
  const AllPosts_fetch_fetchList_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return fetchListStates();
  }

  /* -------------------------------------------------------------------------- */
/*                           //! fetch list states                            */
/* -------------------------------------------------------------------------- */

  fetchListStates() {
    return BlocBuilder<AllPostsFetchBloc, AllPostsFetchState>(
        builder: (context, state) {
      if (state is AllPosts_Fetch_Loaded_State) {
        return buildFetchList(state.modelObjList);
      } else if (state is AllPosts_Fetch_More_Loaded_ButEmpty_State) {
        return buildFetchList(state.prevList);
      } else if (state is AllPosts_Fetch_Loading_State) {
        return buildFetchList(state.prevList);
      } else if (state is AllPosts_Fetch_Error_State) {
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
              return PostCardWidget(postObj: listArg[i], forScreen: 'home');
              // return AllPosts_fetch_listTile_widget(singleObj: listArg[i]);
            },
          );
  }
}
