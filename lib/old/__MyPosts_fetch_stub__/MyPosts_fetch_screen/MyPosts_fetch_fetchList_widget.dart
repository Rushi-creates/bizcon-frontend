// part of 'MyPosts_fetch_screen.dart';

// class MyPosts_fetch_fetchList_widget extends StatelessWidget {
//   final scrollController;
//   const MyPosts_fetch_fetchList_widget({required this.scrollController});

//   @override
//   Widget build(BuildContext context) {
//     return fetchListStates();
//   }

//   /* -------------------------------------------------------------------------- */
// /*                           //! fetch list states                            */
// /* -------------------------------------------------------------------------- */

//   fetchListStates() {
//     return BlocBuilder<MyPostsFetchBloc, MyPostsFetchState>(
//         builder: (context, state) {
//       if (state is MyPosts_Fetch_Loaded_State) {
//         return buildFetchList(state.modelObjList);
//       } else if (state is MyPosts_Fetch_More_Loaded_ButEmpty_State) {
//         return buildFetchList(state.prevList);
//       } else if (state is MyPosts_Fetch_Loading_State) {
//         return buildFetchList(state.prevList);
//       } else if (state is MyPosts_Fetch_Error_State) {
//         return buildFetchList(state.prevList);
//       }

//       return buildFetchList([]);
//     });
//   }

// /* -------------------------------------------------------------------------- */
// /*                 //! if loaded then build fetchList                         */
// /* -------------------------------------------------------------------------- */

//   buildFetchList(List listArg) {
//     return listArg.isEmpty
//         ? MyComponents.showFetchListEmptyMsg()
//         : SizedBox(
//             height: 270,
//             child: ListView.builder(
//               controller: scrollController,
//               shrinkWrap: true,
//               // physics: NeverScrollableScrollPhysics(),
//               physics: ClampingScrollPhysics(),
//               scrollDirection: Axis.horizontal,
//               itemCount: listArg.length,
//               itemBuilder: (context, i) {
//                 return PostCard_forProfile_widget(
//                     postObj: listArg[i], forScreen: 'profile');
//                 // return MyPosts_fetch_listTile_widget(singleObj: listArg[i]);
//               },
//             ),
//           );
//   }
// }
