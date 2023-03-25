import 'package:bizcon1/MODULES/CHATS/Chats_cud_logic/Chats_cud_bloc.dart';
import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
import 'package:bizcon1/MODULES/POST/__AcceptedPostMembers_fetch_stub__/AcceptedPostMembers_fetch_screen/AcceptedPostMembers_fetch_screen.dart';
import 'package:bizcon1/Repo/Profile_repo.dart';
import 'package:bizcon1/service_layer_stub/models/Chat.dart';
import 'package:bizcon1/service_layer_stub/models/PostMembers.dart';
import 'package:bizcon1/service_layer_stub/models/Profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//to change class name = right click on className> Rename symbol
class ChatScreen extends StatefulWidget {
  final postId;
  final PostMembers postMemberObj;
  const ChatScreen({required this.postId, required this.postMemberObj});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody(),
    );
  }

  myBody() {
    return SafeArea(
        child: Container(
      // decoration: BoxDecoration(
      //     shape: BoxShape.rectangle,
      //     image: DecorationImage(
      //         image: AssetImage('images/chat_bg2.jpg'),
      //         opacity: 0.1,
      //         fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Stack(
          children: [
            SingleChildScrollView(
              child: fetchStreamCollec_chats(),
            ),
            Column(
              children: [
                SizedBox(
                  height: MyComponents.screenSize(context).height * 0.78,
                ),
                enterMessageBox(),
              ],
            )
          ],
        )),
      ),
    ));
  }

  fetchStreamCollec_chats() {
    return StreamBuilder<QuerySnapshot>(
        //Todo: pass here the 'whole' fetching path of 'collection' from firebase
        stream: FirebaseFirestore.instance
            .collection(widget.postId.toString())
            .orderBy('createdAt')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            Center(child: Text("Something went wrong: ${snapshot.error}"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.data == null) {
            return Text("No data yet");
          }

          /* -------------------------------------------------------------------------------------- */
          /* //!  if data is fetched properly, then store it in docsListName (1 doc = 1 docListName)*/
          /* -------------------------------------------------------------------------------------- */

          final List docsListName = [];

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            docsListName.add(a);

            /* -------------------------------------------------------------------------- */
            /*    //! storing name/id of document , inside its own doc body , as a key    */
            /* -------------------------------------------------------------------------- */
            //this 'idKEY' string is imp , use it as actual arg, to pass in delete,update crud
            a['idKEY'] = document.id;
          }).toList();

/* -------------------------------------------------------------------------- */
/*              //Todo: change UI here , and display data as req              */
/* -------------------------------------------------------------------------- */
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: docsListName.length,
            itemBuilder: (context, i) {
              DateTime time = DateTime.fromMillisecondsSinceEpoch(
                  docsListName[i]['createdAt']);

              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  // color: Colors.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: docsListName[i]['senderId'] ==
                                  Profile_sp_repo.get_profile()!.p_uid
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Card(
                            color: docsListName[i]['senderId'] ==
                                    Profile_sp_repo.get_profile()!.p_uid
                                ? Color.fromARGB(255, 99, 0, 82)
                                : Colors.white,
                            elevation: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        docsListName[i]['message'],
                                        style: TextStyle(
                                          color: docsListName[i]['senderId'] ==
                                                  Profile_sp_repo.get_profile()!
                                                      .p_uid
                                              ? Color.fromARGB(
                                                  255, 255, 255, 255)
                                              : Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '~ ${docsListName[i]['senderName']}  -  ${time.toString().substring(11, 16)}',
                                        style: TextStyle(
                                            color: docsListName[i]
                                                        ['senderId'] ==
                                                    Profile_sp_repo
                                                            .get_profile()!
                                                        .p_uid
                                                ? Color.fromARGB(
                                                    255, 255, 255, 255)
                                                : Colors.grey,
                                            fontSize: 8),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  enterMessageBox() {
    Profile profile = Profile_sp_repo.get_profile()!;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 5,
              child: myTextField(chatController, 'Enter your message here'),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Center(
                    child: FittedBox(
                      child: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          Chats chats = Chats(
                            senderId: profile.p_uid,
                            senderName: profile.username,
                            message: chatController.text,
                            createdAt: DateTime.now().millisecondsSinceEpoch,
                          );
                          BlocProvider.of<ChatsCudBloc>(context).add(
                              Chats_create_onButtonPressed_Event(
                                  chats, widget.postId.toString()));

                          chatController.clear();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  myTextField(controllerArg, label) {
    return SizedBox(
      child: TextFormField(
        controller: controllerArg,
        keyboardType: TextInputType.multiline,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field required'; //if empty give error msg here
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label, //hint text here
        ),
      ),
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 2.0,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        '${widget.postMemberObj.post_title} '
        'Chat room', //give here appBar title
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.black,

          // fontWeight: FontWeight.bold
          fontSize: 12,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            top: 18,
            bottom: 18,
            right: 15,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AcceptedPostMembers_Fetch_Screen(
                  fromProfile: false,
                  post_fk: widget.postId,
                );
              }));
            },
            child: SizedBox(
              // height: 3,
              width: 70,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage('images/team_members.png'),
                        fit: BoxFit.fill)),
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: IconButton(
        //       onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (context) {
        //           return AcceptedPostMembers_Fetch_Screen(
        //             fromProfile: false,
        //             post_fk: widget.postId,
        //           );
        //         }));
        //       },
        //       icon: Icon(
        //         Icons.group,
        //         color: Colors.black,
        //       )),
        // )
      ],
    );
  }
}
