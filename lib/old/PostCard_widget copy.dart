// import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
// import 'package:flutter/material.dart';

// import '../Repo/Profile_repo.dart';
// import '../MODULES/HOME/PostMembers_cud_logic/__PostMembers_cud_screen__/PostMembers_cud_screen.dart';
// import '../MODULES/POST/__AcceptedPostMembers_fetch_stub__/AcceptedPostMembers_fetch_screen/AcceptedPostMembers_fetch_screen.dart';

// class PostCardWidget extends StatelessWidget {
//   final postObj;
//   final forScreen;
//   const PostCardWidget({required this.postObj, required this.forScreen});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: SizedBox(
//         width: MyComponents.screenSize(context).width,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //@
//                 Text(
//                   postObj.title,
//                   // maxLines: 2,
//                   // overflow: TextOverflow.ellipsis,
//                   // textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     // decoration: TextDecoration.none,
//                     // fontStyle: FontStyle.italic,
//                     // fontFamily: "FontNameHere" ,
//                     fontWeight: FontWeight.bold,
//                     // fontWeight: FontWeight.w300,
//                     fontSize: 28.0,
//                   ),
//                 ),

//                 //@
//                 SizedBox(height: 10),

//                 //@
//                 Text(
//                   postObj.description,
//                   // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vulputate, dolor pulvinar imperdiet',
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   // textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     // decoration: TextDecoration.none,
//                     // fontStyle: FontStyle.italic,
//                     // fontFamily: "FontNameHere" ,
//                     // fontWeight: FontWeight.bold,
//                     // fontWeight: FontWeight.w300,
//                     fontSize: 12.0,
//                   ),
//                 ),

//                 //@
//                 SizedBox(height: 30),

//                 //@
//                 secondDescription('Goals', postObj.goals),
//                 secondDescription('Skills required', postObj.skills_req),
//                 secondDescription(
//                     'Qualifications required', postObj.qualifications_req),

//                 //@
//                 SizedBox(height: 40),

//                 //@
//                 memberTeamButtons(context),

//                 //@
//                 SizedBox(height: 15),

//                 //@
//                 joinButton_createdBy_widget(context)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                                     //!                                    */
// /* -------------------------------------------------------------------------- */

//   secondDescription(String textArg, valueText) {
//     return Row(
//       children: [
//         Flexible(
//           child: Text(
//             ' - ${textArg}: ',
//             // maxLines: 2,
//             // overflow: TextOverflow.ellipsis,
//             // textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               // decoration: TextDecoration.none,
//               // fontStyle: FontStyle.italic,
//               // fontFamily: "FontNameHere" ,
//               fontWeight: FontWeight.bold,
//               // fontWeight: FontWeight.w300,
//               fontSize: 11.0,
//             ),
//           ),
//         ),

//         //

//         Flexible(
//           child: Text(
//             '${valueText}',
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             // textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               // decoration: TextDecoration.none,
//               // fontStyle: FontStyle.italic,
//               // fontFamily: "FontNameHere" ,
//               // fontWeight: FontWeight.bold,
//               // fontWeight: FontWeight.w300,
//               fontSize: 11.0,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                                     //!                                    */
// /* -------------------------------------------------------------------------- */

//   memberTeamButtons(context) {
//     return Row(
//       children: [
//         Flexible(
//           child: SizedBox(
//             height: 30,
//             width: forScreen == 'home'
//                 ? MyComponents.screenSize(context).width * 0.3
//                 : double.infinity,
//             child: TextButton(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.person,
//                     color: Colors.white,
//                     size: 14,
//                   ),
//                   SizedBox(width: 2),
//                   Text(
//                     'Team Members',
//                     style: TextStyle(color: Colors.white, fontSize: 10),
//                   ),
//                 ],
//               ),
//               style: TextButton.styleFrom(
//                   backgroundColor: Colors.deepPurpleAccent),
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return AcceptedPostMembers_Fetch_Screen(
//                     post_fk: postObj.id,
//                     fromProfile: false,
//                   );
//                 }));
//               },
//             ),
//           ),
//         ),

//         //

//         SizedBox(width: 10),

//         //!

//         forScreen == 'home'
//             ? Container()
//             : Flexible(
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Container(
//                     height: 30,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                     child: TextButton(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.person,
//                             color: Colors.white,
//                             size: 14,
//                           ),
//                           SizedBox(width: 2),
//                           Text(
//                             'Waiting Members',
//                             style: TextStyle(color: Colors.white, fontSize: 10),
//                           ),
//                         ],
//                       ),
//                       style: TextButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         // backgroundColor: Colors.grey,
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ),
//               ),
//       ],
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                                     //!                                    */
// /* -------------------------------------------------------------------------- */

//   joinButton_createdBy_widget(context) {
//     return Flex(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       direction: Axis.horizontal,
//       children: [
//         //
//         forScreen == 'profile'
//             ? Container()
//             :

//             //
//             postObj.post_fk == Profile_sp_repo.get_profile()!.p_uid
//                 ? cantJoinMyPostButton()
//                 : Flexible(
//                     flex: 3,
//                     child: SizedBox(
//                       height: 40,
//                       width: double.infinity,
//                       child: TextButton(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.add,
//                               color: Colors.black,
//                               size: 18,
//                             ),
//                             SizedBox(width: 2),
//                             Text(
//                               'Join the Team',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         style:
//                             TextButton.styleFrom(backgroundColor: Colors.white),
//                         onPressed: () async {
//                           await fetchListFunc(context, postObj);
//                         },
//                       ),
//                     ),
//                   ),

//         //
//         SizedBox(width: 8),

//         Flexible(
//             flex: 1,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   postObj.owner_username,
//                   // textDirection: TextDirection.rtl,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   // textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     // decoration: TextDecoration.none,
//                     // fontStyle: FontStyle.italic,
//                     // fontFamily: "FontNameHere" ,
//                     fontWeight: FontWeight.bold,
//                     // fontWeight: FontWeight.w300,
//                     fontSize: 8.0,
//                   ),
//                 ),
//                 Text(
//                   postObj.recordDate.substring(0, 10),
//                   // textDirection: TextDirection.rtl,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.end,
//                   style: TextStyle(
//                     color: Colors.white,
//                     // decoration: TextDecoration.none,
//                     // fontStyle: FontStyle.italic,
//                     // fontFamily: "FontNameHere" ,
//                     // fontWeight: FontWeight.bold,
//                     // fontWeight: FontWeight.w300,
//                     fontSize: 8.0,
//                   ),
//                 ),
//               ],
//             ))
//       ],
//     );
//   }

//   cantJoinMyPostButton() {
//     return Flexible(
//       flex: 3,
//       child: SizedBox(
//         height: 40,
//         width: double.infinity,
//         child: TextButton(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.not_interested,
//                 color: Colors.black,
//                 size: 18,
//               ),
//               SizedBox(width: 2),
//               Text(
//                 "Post author - cant join",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           style: TextButton.styleFrom(backgroundColor: Colors.white),
//           onPressed: null,
//         ),
//       ),
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                             //@ Functionalities                            */
// /* -------------------------------------------------------------------------- */

//   fetchListFunc(context, listTileInfo) async {
//     Navigator.push(context, MaterialPageRoute(builder: (context) {
//       return PostMembers_cud_screen(singleObj: listTileInfo);
//     }));
//   }
// }
