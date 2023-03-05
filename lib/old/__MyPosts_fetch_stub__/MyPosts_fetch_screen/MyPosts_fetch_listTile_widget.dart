// part of 'MyPosts_fetch_screen.dart';

// class MyPosts_fetch_listTile_widget extends StatelessWidget {
//   final singleObj;
//   const MyPosts_fetch_listTile_widget({super.key, required this.singleObj});

//   @override
//   Widget build(BuildContext context) {
//     return listTile(context);
//   }

//   listTile(context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(15.0, 1, 15.0, 10),
//       child: ListTile(
//         tileColor: Colors.yellow[600],
//         // leading: tile_leading(),
//         title: tile_title(),
//         subtitle: tile_subtitle(context),
//         onTap: () async => await fetchListFunc(singleObj, context),
//       ),
//     );
//   }

//   tile_leading() {
//     return CircleAvatar(
//       backgroundColor: Colors.white,
//       child: Text(singleObj.id.toString()),
//     );
//   }

//   tile_title() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(
//         'ID:${singleObj.id}.   -   ${singleObj.title}',
//         maxLines: 1,
//       ),
//     );
//   }

//   tile_subtitle(context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Divider(),
//           Text('profile fk : ${singleObj.post_fk}'),
//           Divider(),
//           Text('posted by: ${singleObj.owner_username}'),
//           Divider(),
//           Text(
//             singleObj.description,
//             maxLines: 6,
//             overflow: TextOverflow.ellipsis,
//           ),
//           Divider(),
//           Text(
//             'Goals: ${singleObj.goals}',
//             maxLines: 6,
//             overflow: TextOverflow.ellipsis,
//           ),
//           Divider(),
//           Text('Salary methods: ${singleObj.salary_method}'),
//           Divider(),
//           Text('Qualifications required: ${singleObj.qualifications_req}'),
//           Divider(),
//           Text('Skills required: ${singleObj.skills_req}'),
//           Divider(),
//           Text('Created at: ${singleObj.recordDate}'),
//           Divider(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               TextButton(
//                 child: Text(
//                   "Waiting member list",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return WaitingPostMembers_Fetch_Screen(
//                       post_fk: singleObj.id,
//                     );
//                   }));
//                 },
//               ),
//               TextButton(
//                 child: Text(
//                   "Accepted Members",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return AcceptedPostMembers_Fetch_Screen(
//                       post_fk: singleObj.id,
//                       fromProfile: true,
//                     );
//                   }));
//                 },
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                             //@ Functionalities                            */
// /* -------------------------------------------------------------------------- */

//   fetchListFunc(context, listTileInfo) async {
//     // Navigator.push(context, MaterialPageRoute(builder: (context) {
//     //   return AdminVerifyScreen();
//     // }));
//   }
// }
