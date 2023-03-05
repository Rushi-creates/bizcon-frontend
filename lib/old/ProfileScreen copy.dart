// import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
// import 'package:bizcon1/MODULES/CREATE_PROFILE/CreateProfileScreen.dart';
// import 'package:bizcon1/MODULES/PROFILE/__AppliedToJoinPosts_fetch_stub__/AppliedToJoinPosts_fetch_screen/AppliedToJoinPosts_fetch_screen.dart';
// import 'package:bizcon1/MODULES/PROFILE/__MyJoinedPosts_fetch_stub__/MyJoinedPosts_fetch_screen/MyJoinedPosts_fetch_screen.dart';
// import 'package:bizcon1/Repo/Profile_repo.dart';
// import 'package:bizcon1/service_layer_stub/models/Profile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../SETTINGS_SCREEN/Settings_screen.dart';
// import '__MyPosts_fetch_stub__/MyPosts_fetch_logic/MyPosts_fetch_bloc.dart';
// import '__MyPosts_fetch_stub__/MyPosts_fetch_screen/MyPosts_fetch_screen.dart';

// //to change class name = right click on className> Rename symbol
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final ScrollController scrollController = ScrollController();

// /* -------------------------------------------------------------------------- */
// /*                            //! lifecycle methods                           */
// /* -------------------------------------------------------------------------- */

//   @override
//   void initState() {
//     super.initState();

//     //# a scroll listner which listens always
//     scrollController.addListener(scrollListener);

//     //# to call first set of pages
//     BlocProvider.of<MyPostsFetchBloc>(context)
//         .add(MyPosts_Fetch_onInit_Event());
//   }

//   @override
//   void dispose() {
//     scrollController.dispose();
//     print('scroll controller disposed');
//     super.dispose();
//   }

//   void scrollListener() {
//     if (scrollController.offset >= scrollController.position.maxScrollExtent &&
//         !scrollController.position.outOfRange) {
//       print('list endedddd');
//       Future.delayed(Duration(milliseconds: 100), () {
//         BlocProvider.of<MyPostsFetchBloc>(context)
//             .add(MyPosts_Fetch_onInit_Event());
//       });
//     }
//   }

// /* -------------------------------------------------------------------------- */
// /*                                  //@ build                                 */
// /* -------------------------------------------------------------------------- */
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // resizeToAvoidBottomInset: false,
//       appBar: myHeader(),
//       body: myBody(),
//     );
//   }

//   myBody() {
//     return SafeArea(
//         child: RefreshIndicator(
//             onRefresh: () async {
//               print('Refreshed');
//               onRefreshFunc();
//             },
//             child: SingleChildScrollView(
//               controller: scrollController,
//               child: Container(
//                   child: Column(
//                 children: [
//                   displayProfileDetailsCard(),
//                   // SizedBox(height: 2),
//                   editProfileButton(),
//                   SizedBox(height: 10),
//                   checkMyJoinedPosts_card(),
//                   SizedBox(height: 10),

//                   Divider(),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Text(
//                         "Ideas created by me : ",
//                         // maxLines: 2,
//                         // overflow: TextOverflow.ellipsis,
//                         // textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.black,
//                           // decoration: TextDecoration.none,
//                           // fontStyle: FontStyle.italic,
//                           // fontFamily: "FontNameHere" ,
//                           fontWeight: FontWeight.bold,
//                           // fontWeight: FontWeight.w300,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: MyPosts_Fetch_Screen(
//                       scrollController: scrollController,
//                       scrollListener: scrollListener,
//                     ),
//                   )
//                 ],
//               )),
//             )));
//   }

//   checkMyJoinedPosts_card() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         SizedBox(
//           width: MyComponents.screenSize(context).width * 0.44,
//           child: TextButton(
//             child: Text(
//               "My Joined posts",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: TextButton.styleFrom(backgroundColor: Colors.black),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return MyJoinedPosts_Fetch_Screen(
//                     member_fk: Profile_sp_repo.get_profile()!.p_uid);
//               }));
//             },
//           ),
//         ),

//         //

//         SizedBox(
//           width: MyComponents.screenSize(context).width * 0.44,
//           child: TextButton(
//             child: Text(
//               "Applied to join posts",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: TextButton.styleFrom(backgroundColor: Colors.black),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return AppliedToJoinPosts_Fetch_Screen(
//                     member_fk: Profile_sp_repo.get_profile()!.p_uid);
//               }));
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   displayProfileDetailsCard() {
//     // UserAcc user =  User_sp_repo.get_user()!;
//     Profile profile = Profile_sp_repo.get_profile()!;
//     return Padding(
//       // padding: const EdgeInsets.all(20.0),
//       padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
//       child: SizedBox(
//         width: double.infinity,
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               gradient: LinearGradient(colors: [
//                 Color.fromARGB(255, 45, 0, 53),
//                 Color.fromARGB(255, 102, 0, 161),
//               ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   displayProfileText('Username : ${profile.username}'),
//                   displayProfileText('Bio : ${profile.bio}'),
//                   displayProfileText('Role : ${profile.role}'),
//                   displayProfileText(
//                       'Qualifications : ${profile.qualifications}'),
//                   displayProfileText('Skills : ${profile.skills}'),
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }

//   editProfileButton() {
//     return SizedBox(
//       width: MyComponents.screenSize(context).width * 0.9,
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6.0),
//             gradient: LinearGradient(colors: [
//               // Color.fromARGB(255, 45, 0, 53),
//               // Color.fromARGB(255, 102, 0, 161),
//               Color.fromARGB(255, 212, 93, 1),
//               Color.fromARGB(255, 255, 111, 0),
//             ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
//         child: TextButton(
//           onPressed: () {
//             // Add your onPressed function here
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return CreateProfileScreen.fromProfileScreen(
//                 isFromProfileScreen: true,
//               );
//             }));
//           },
//           style: TextButton.styleFrom(
//             // backgroundColor: Color.fromARGB(255, 233, 101, 0),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(6),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
//           ),
//           child: Text(
//             'Edit Profile',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   displayProfileText(text) {
//     return Padding(
//       padding: const EdgeInsets.all(6),
//       // padding: const EdgeInsets.only(left: 20, bottom: 2, top: 2),
//       child: Text(
//         text,
//         // maxLines: 2,
//         // overflow: TextOverflow.ellipsis,
//         // textAlign: TextAlign.center,
//         style: TextStyle(
//           color: Colors.white,
//           // decoration: TextDecoration.none,
//           // fontStyle: FontStyle.italic,
//           // fontFamily: "FontNameHere" ,
//           fontWeight: FontWeight.bold,
//           // fontWeight: FontWeight.w300,
//           fontSize: 14.0,
//         ),
//       ),
//     );
//   }

//   AppBar myHeader() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       // elevation: 0.0,
//       //leading: IconButton(
//       //  icon: Icon(
//       //   Icons.arrow_back,
//       //   color: Colors.black,
//       //   ),
//       //   onPressed: (){
//       //       Navigator.pop(context);
//       //   }
//       // ),
//       // automaticallyImplyLeading: true,  //removes default back arrow on appbar

//       title: Text(
//         'Profile', //give here appBar title
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
//       ],
//     );
//   }

//   /* -------------------------------------------------------------------------- */
// /*                         //# Sttic Helper functions                         */
// /* -------------------------------------------------------------------------- */

//   onRefreshFunc() {
//     BlocProvider.of<MyPostsFetchBloc>(context)
//         .add(MyPosts_Fetch_onRefresh_Event());
//     BlocProvider.of<MyPostsFetchBloc>(context)
//         .add(MyPosts_Fetch_onInit_Event());
//     scrollController.addListener(scrollListener);
//   }
// }
