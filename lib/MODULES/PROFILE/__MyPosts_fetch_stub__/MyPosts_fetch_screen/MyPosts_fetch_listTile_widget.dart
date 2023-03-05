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
//       padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
//       child: ListTile(
//         tileColor: Colors.teal,
//         leading: tile_leading(),
//         title: tile_title(),
//         subtitle: tile_subtitle(),
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
//     return Text(
//       singleObj.name,
//       maxLines: 1,
//     );
//   }

//   tile_subtitle() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           singleObj.description,
//           maxLines: 1,
//         ),
//         SizedBox(
//           height: 80,
//         )
//       ],
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
