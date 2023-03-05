part of 'AcceptedPostMembers_fetch_screen.dart';

class AcceptedPostMembers_fetch_listTile_widget extends StatelessWidget {
  final singleObj;
  final fromProfile;
  const AcceptedPostMembers_fetch_listTile_widget(
      {super.key, required this.singleObj, required this.fromProfile});

  @override
  Widget build(BuildContext context) {
    return listTile(context);
  }

  listTile(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
      child: ListTile(
        tileColor: Colors.teal,
        leading: tile_leading(),
        title: tile_title(),
        subtitle: tile_subtitle(),
        trailing: fromProfile ? deleteButton_Ui(context) : Text(''),
        onTap: () async => await fetchListFunc(singleObj, context),
      ),
    );
  }

  tile_leading() {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Text(singleObj.id.toString()),
    );
  }

  tile_title() {
    return Text(
      '${singleObj.post_fk}.  ${singleObj.post_title}',
      maxLines: 1,
    );
  }

  tile_subtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${singleObj.post_description}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10),
        Text(
          'post by : ${singleObj.member_fk}.${singleObj.member_username}',
          maxLines: 1,
        ),
        Text(
          singleObj.isAccepted
              ? 'You are team member'
              : 'You are a team member yet',
          maxLines: 1,
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                              //! Delete button                             */
/* -------------------------------------------------------------------------- */

  deleteButton_Ui(context) {
    return TextButton(
      child: Text(
        "Delete",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () => deleteButton_FUNC(context),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  deleteButton_FUNC(context) {
    //# Delete bloc, ( pass widget.single.id as ID )
    BlocProvider.of<PostMembersCudBloc>(context)
        .add(PostMembers_Delete_onButtonPressed_Event(singleObj!.id));
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
