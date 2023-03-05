part of 'SearchProfile_fetch_screen.dart';

class SearchProfile_fetch_listTile_widget extends StatelessWidget {
  final singleObj;
  const SearchProfile_fetch_listTile_widget(
      {super.key, required this.singleObj});

  @override
  Widget build(BuildContext context) {
    return listTile(context);
  }

  listTile(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
      child: ListTile(
        tileColor: Color.fromARGB(255, 18, 0, 97),
        leading: tile_leading(),
        title: tile_title(),
        subtitle: tile_subtitle(),
        onTap: () async => await fetchListFunc(singleObj, context),
      ),
    );
  }

  tile_leading() {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Text(singleObj.p_uid.toString()),
    );
  }

  tile_title() {
    return Text(
      singleObj.username,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      maxLines: 1,
    );
  }

  tile_subtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          singleObj.bio,
          maxLines: 1,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  fetchListFunc(context, listTileInfo) async {
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return AdminVerifyScreen();
    // }));
  }
}
