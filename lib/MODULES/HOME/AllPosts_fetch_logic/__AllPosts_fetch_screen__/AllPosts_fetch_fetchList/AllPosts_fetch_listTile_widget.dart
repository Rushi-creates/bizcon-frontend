// import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
// import 'package:bizcon1/MODULES/HOME/PostMembers_cud_logic/__PostMembers_cud_screen__/PostMembers_cud_screen.dart';
// import 'package:bizcon1/MODULES/POST/PostCard_widget.dart';
// import 'package:bizcon1/Repo/Profile_repo.dart';
// import 'package:flutter/material.dart';

// import '../../../../POST/__AcceptedPostMembers_fetch_stub__/AcceptedPostMembers_fetch_screen/AcceptedPostMembers_fetch_screen.dart';

// class AllPosts_fetch_listTile_widget extends StatelessWidget {
//   final singleObj;
//   const AllPosts_fetch_listTile_widget({super.key, required this.singleObj});

//   @override
//   Widget build(BuildContext context) {
//     return PostCardWidget(
//       postObj: singleObj,
//       forScreen: 'home',
//     );
//   }

//   // listTile(context) {
//   //   return Padding(
//   //     padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
//   //     child: ListTile(
//   //       tileColor: singleObj.post_fk == Profile_sp_repo.get_profile()!.p_uid
//   //           ? Colors.amber
//   //           : Colors.teal,
//   //       // leading: tile_leading(),
//   //       // title: tile_title(),
//   //       // subtitle: tile_subtitle(context),
//   //       // trailing: singleObj.post_fk == Profile_sp_repo.get_profile()!.p_uid
//   //       //     ? Text('My Post')
//   //       //     : PostMembers_cud_save_button(singleObj: singleObj),
//   //       // onTap: () async =>
//   //       //     singleObj.post_fk == Profile_sp_repo.get_profile()!.p_uid
//   //       //         ? null
//   //       //         : await fetchListFunc(context, singleObj),
//   //     ),
//   //   );
//   // }

// //   // joinTeam() {
// //   //   return TextButton(
// //   //     child: Text(
// //   //       "Join Team",
// //   //       style: TextStyle(color: Colors.white),
// //   //     ),
// //   //     style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
// //   //     onPressed: () {},
// //   //   );
// //   // }

// //   // tile_leading() {
// //   //   return CircleAvatar(
// //   //     backgroundColor: Colors.white,
// //   //     child: Text(singleObj.id.toString()),
// //   //   );
// //   // }

// //   // tile_title() {
// //   //   return Padding(
// //   //     padding: const EdgeInsets.all(8.0),
// //   //     child: Text(
// //   //       'ID:${singleObj.id}.   -   ${singleObj.title}',
// //   //       maxLines: 1,
// //   //     ),
// //   //   );
// //   // }

// //   tile_subtitle(context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Divider(),
// //           Text('profile fk : ${singleObj.post_fk}'),
// //           Divider(),
// //           Text('posted by: ${singleObj.owner_username}'),
// //           Divider(),
// //           Text(
// //             singleObj.description,
// //             maxLines: 6,
// //             overflow: TextOverflow.ellipsis,
// //           ),
// //           Divider(),
// //           Text(
// //             'Goals: ${singleObj.goals}',
// //             maxLines: 6,
// //             overflow: TextOverflow.ellipsis,
// //           ),
// //           Divider(),
// //           Text('Salary methods: ${singleObj.salary_method}'),
// //           Divider(),
// //           Text('Qualifications required: ${singleObj.qualifications_req}'),
// //           Divider(),
// //           Text('Skills required: ${singleObj.skills_req}'),
// //           Divider(),
// //           Text('Created at: ${singleObj.recordDate}'),
// //           Divider(),
// //           TextButton(
// //             child: Text(
// //               "Team members",
// //               style: TextStyle(color: Colors.white),
// //             ),
// //             style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
// //             onPressed: () {
// //               Navigator.push(context, MaterialPageRoute(builder: (context) {
// //                 return AcceptedPostMembers_Fetch_Screen(
// //                   post_fk: singleObj.id,
// //                   fromProfile: false,
// //                 );
// //               }));
// //             },
// //           ),
// //           Divider(),
// //           SizedBox(
// //             width: MyComponents.screenSize(context).width * 0.9,
// //             child: TextButton(
// //               child: Padding(
// //                 padding: const EdgeInsets.all(4.0),
// //                 child: Text(
// //                   "Apply to Join team",
// //                   style: TextStyle(color: Colors.white),
// //                 ),
// //               ),
// //               style: TextButton.styleFrom(backgroundColor: Colors.black),
// //               onPressed: () async {
// //                 singleObj.post_fk == Profile_sp_repo.get_profile()!.p_uid
// //                     ? null
// //                     : await fetchListFunc(context, singleObj);
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// // /* -------------------------------------------------------------------------- */
// // /*                             //@ Functionalities                            */
// // /* -------------------------------------------------------------------------- */

// //   fetchListFunc(context, listTileInfo) async {
// //     Navigator.push(context, MaterialPageRoute(builder: (context) {
// //       return PostMembers_cud_screen(singleObj: listTileInfo);
// //     }));
// //   }
// }
