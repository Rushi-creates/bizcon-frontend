part of 'MyJoinedPosts_fetch_screen.dart';

class MyJoinedPosts_fetch_listTile_widget extends StatelessWidget {
  final singleObj;
  const MyJoinedPosts_fetch_listTile_widget(
      {super.key, required this.singleObj});

  @override
  Widget build(BuildContext context) {
    return listTile(context);
  }

  listTile(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Neumorphic(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(12),
          ),
          depth: 5,
          intensity: 0.7,
          color: Colors.white,
          shadowLightColor: Colors.grey[400],
          shadowDarkColor: Colors.grey[700],
        ),
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
          title: Text(
            singleObj.post_title!,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.0),
              // Text(
              //   singlObj.m,
              //   style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
              // ),
              // SizedBox(height: 10.0),
              Text(
                'Post: ${singleObj.post_description}',
                maxLines: 2,
                style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    singleObj.joinedTime.substring(0, 10),
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                  ),
                  // Spacer(),
                  SizedBox(width: 5.0),

                  singleObj.isAccepted ?? false
                      ? Icon(Icons.check_circle,
                          color: Colors.green, size: 18.0)
                      : Icon(Icons.radio_button_unchecked,
                          color: Colors.grey, size: 18.0),
                  SizedBox(width: 5.0),
                  Text(
                    singleObj.isAccepted ?? false ? 'Accepted' : 'Pending',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                  ),
                  // SizedBox(width: 10.0),
                  Spacer(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ChatScreen(
                            postId: singleObj.post_fk,
                            postMemberObj: singleObj,
                          );
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.pink,
                                  Colors.purple,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.chat_sharp,
                                  color: Colors.white,
                                )),

                            //
                            Text(
                              'Chat     ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.0),
            ],
          ),
          onTap: () {},
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        ),
      ),
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
