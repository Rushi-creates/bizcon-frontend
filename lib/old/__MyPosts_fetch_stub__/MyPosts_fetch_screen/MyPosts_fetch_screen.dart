// import 'package:bizcon1/MODULES/POST/PostCard_forProfile_widget.dart';
// import 'package:bizcon1/MODULES/POST/PostCard_widget.dart';
// import 'package:bizcon1/MODULES/PROFILE/ProfileScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../COMMON/myComponents.dart';
// import '../../../POST/__AcceptedPostMembers_fetch_stub__/AcceptedPostMembers_fetch_screen/AcceptedPostMembers_fetch_screen.dart';
// import '../../../POST/__WaitingPostMembers_fetch_stub__/WaitingPostMembers_fetch_screen/WaitingPostMembers_fetch_screen.dart';
// import '../../../SETTINGS_SCREEN/Settings_screen.dart';
// import '../MyPosts_fetch_logic/MyPosts_fetch_bloc.dart';

// part 'MyPosts_fetch_listTile_widget.dart';
// part 'MyPosts_fetch_fetchList_widget.dart';
// part 'MyPosts_fetch_belowList_widget.dart';

// class MyPosts_Fetch_Screen extends StatefulWidget {
//   final scrollController;
//   final scrollListener;
//   const MyPosts_Fetch_Screen({
//     required this.scrollController,
//     required this.scrollListener,
//   });

//   @override
//   _MyPosts_Fetch_ScreenState createState() => _MyPosts_Fetch_ScreenState();
// }

// /* -------------------------------------------------------------------------- */
// /*                               //! State class                              */
// /* -------------------------------------------------------------------------- */

// class _MyPosts_Fetch_ScreenState extends State<MyPosts_Fetch_Screen> {
// /* -------------------------------------------------------------------------- */
// /*                              //! Build method                              */
// /* -------------------------------------------------------------------------- */

//   @override
//   Widget build(BuildContext context) {
//     return myBody();
//   }

// /* -------------------------------------------------------------------------- */
// /*                             //! body structure                             */
// /* -------------------------------------------------------------------------- */

//   // myBody_STATES() {
//   //   return BlocConsumer<JooCudBloc, JooCudState>(
//   //     listener: (context, state) {
//   //       if (state is Joo_create_Loaded_State ||
//   //           state is Joo_update_Loaded_State ||
//   //           state is Joo_Delete_Loaded_state) {
//   //         onRefreshFunc();
//   //       }
//   //     },
//   //     builder: (context, state) {
//   //       return myBody();
//   //     },
//   //   );
//   // }

//   myBody() {
//     return Row(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         // mainAxisSize: MainAxisSize.max,
//         children: [
//           // ProfileScreen(),
//           // fetch list

//           Flexible(
//             child: MyPosts_fetch_fetchList_widget(
//               scrollController: widget.scrollController,
//             ),
//           ),

//           // below fetch list
//           Flexible(
//             child: MyPosts_fetch_belowList_widget(
//               scrollController: widget.scrollController,
//               scrollListener: widget.scrollListener,
//             ),
//           ),

//           //
//           SizedBox(height: 70)
//         ]);
//   }

// /* -------------------------------------------------------------------------- */
// /*                           //# Scaffold widgets                             */
// /* -------------------------------------------------------------------------- */

//   AppBar myHeader() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       title: Text(
//         'Profile',
//         style: TextStyle(color: Colors.black
//             // fontWeight: FontWeight.bold
//             // fontSize: 15,
//             ),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: IconButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return SettingScreen();
//                 }));
//               },
//               icon: Icon(
//                 Icons.settings,
//                 color: Colors.black,
//               )),
//         )
//         // Padding(
//         //   padding: const EdgeInsets.all(8.0),
//         //   child: IconButton(
//         //       onPressed: () {
//         //         onRefreshFunc()
//         //       },
//         //       icon: Icon(
//         //         Icons.refresh,
//         //         color: Colors.black,
//         //       )),
//         // )
//       ],
//     );
//   }
// }
