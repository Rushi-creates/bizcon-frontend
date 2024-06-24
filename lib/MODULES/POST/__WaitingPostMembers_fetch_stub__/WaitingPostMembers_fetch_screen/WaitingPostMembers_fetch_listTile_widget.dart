part of 'WaitingPostMembers_fetch_screen.dart';

class WaitingPostMembers_fetch_listTile_widget extends StatelessWidget {
  final singleObj;
  const WaitingPostMembers_fetch_listTile_widget(
      {super.key, required this.singleObj});

  @override
  Widget build(BuildContext context) {
    return listTile(context);
  }

  listTile(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      // child: Neumorphic(
      //   style: NeumorphicStyle(
      //     boxShape: NeumorphicBoxShape.roundRect(
      //       BorderRadius.circular(12),
      //     ),
      //     depth: 5,
      //     intensity: 0.7,
      //     color: Colors.white,
      //     shadowLightColor: Colors.grey[400],
      //     shadowDarkColor: Colors.grey[700],
      //   ),
      child: ListTile(
        // leading: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       colors: [
        //         Colors.pink,
        //         Colors.purple,
        //       ],
        //     ),
        //     shape: BoxShape.circle,
        //   ),
        //   child: CircleAvatar(
        //     // radius: size / 2.0,
        //     backgroundColor: Colors.transparent,
        //     child: Text(
        //       singleObj.member_fk.toString(),
        //       style: TextStyle(
        //           // fontSize: size / 4.0,
        //           fontWeight: FontWeight.bold),
        //     ),
        //   ),
        // ),
        trailing: new_updateButton_ui(context),
        title: Text(
          singleObj.member_username!,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            // Text(
            //   singlObj.m,
            //   style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
            // ),
            // SizedBox(height: 10.0),
            Text(
              'Post: ${singleObj.post_title}',
              maxLines: 2,
              style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
            ),
            SizedBox(height: 3.0),
            Row(
              children: [
                Text(
                  singleObj.joinedTime.substring(0, 10),
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                ),
                // Spacer(),
                SizedBox(width: 5.0),

                singleObj.isAccepted ?? false
                    ? Icon(Icons.check_circle, color: Colors.green, size: 18.0)
                    : Icon(Icons.radio_button_unchecked,
                        color: Colors.grey, size: 18.0),
                SizedBox(width: 5.0),
                Text(
                  singleObj.isAccepted ?? false ? 'Accepted' : 'Pending',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                ),
              ],
            ),
            SizedBox(height: 5.0),
          ],
        ),
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        // ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                              //! Update button                             */
/* -------------------------------------------------------------------------- */

  update_Button_ui(context) {
    return TextButton(
      child: Text(
        "Update",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
      onPressed: () async => update_FUNC(context),
    );
  }

  new_updateButton_ui(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Colors.purple,
            // Colors.deepPurple,
            Colors.pink,
            Colors.purple,
          ],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        child: Text(
          "Add to team",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async => update_FUNC(context),
      ),
    );
  }

  /* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  update_FUNC(context) {
    // if (formKey.currentState!.validate()) {
    // create diff obj to update ( with id )or else , to much error
    print('old model is : ${singleObj} ');

    PostMembers postMembers = PostMembers(
        id: singleObj.id,
        post_fk: singleObj.post_fk,
        member_fk: singleObj.member_fk,
        isAccepted: true,
        joinedTime: DateTime.now().toString());

    print('model is : ${postMembers} and id is :  ${postMembers.id}');

    BlocProvider.of<PostMembersCudBloc>(context).add(
        PostMembers_Update_onButtonPressed_Event(postMembers, postMembers.id));
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
