import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
import 'package:bizcon1/service_layer_stub/models/Post.dart';
import 'package:flutter/material.dart';

import '../../Repo/Profile_repo.dart';
import '../HOME/PostMembers_cud_logic/__PostMembers_cud_screen__/PostMembers_cud_screen.dart';
import '__AcceptedPostMembers_fetch_stub__/AcceptedPostMembers_fetch_screen/AcceptedPostMembers_fetch_screen.dart';

//to change class name = right click on className> Rename symbol
class PostCardWidget extends StatelessWidget {
  final Post postObj;
  final forScreen;
  const PostCardWidget({required this.postObj, required this.forScreen});

  @override
  Widget build(BuildContext context) {
    return myBody(context);
  }

  myBody(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          // gradient: LinearGradient(colors: [
          //   Colors.deepPurpleAccent,
          //   Colors.deepPurple,
          // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(1, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
/* -------------------------------------------------------------------------- */
/*                                 //! isOpen                                 */
/* -------------------------------------------------------------------------- */
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: postObj.isOpen
                          ? Color.fromARGB(255, 10, 255, 19)
                          : Color.fromARGB(255, 255, 10, 10),
                    ),
                  ],
                ),
/* -------------------------------------------------------------------------- */
/*                                  //! Title                                 */
/* -------------------------------------------------------------------------- */
                Text(
                  '${postObj.title}',
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 0, 53),
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(height: 5),

/* -------------------------------------------------------------------------- */
/*                               //! description                              */
/* -------------------------------------------------------------------------- */
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Text(
                    '${postObj.description}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      // decoration: TextDecoration.none,
                      // fontStyle: FontStyle.italic,
                      // fontFamily: "FontNameHere" ,
                      // fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.w300,
                      fontSize: 11.0,
                    ),
                  ),
                ),
                // SizedBox(height: 10),
                // Divider(thickness: 1),
                SizedBox(height: 10),

/* -------------------------------------------------------------------------- */
/*                                 //! Post by                                */
/* -------------------------------------------------------------------------- */

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 13,
                    ),
                    SizedBox(width: 2),
                    Text(
                      // 'Post by:  Rushi Patil',
                      '${postObj.owner_username}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        // decoration: TextDecoration.none,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: "FontNameHere" ,
                        fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w300,
                        fontSize: 10.0,
                      ),
                    ),
/* -------------------------------------------------------------------------- */
/*                              //! created date                              */
/* -------------------------------------------------------------------------- */

                    SizedBox(width: 5),
                    Text(
                      '${postObj.recordDate.substring(0, 10)}',
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        // decoration: TextDecoration.none,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: "FontNameHere" ,
                        // fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w300,
                        fontSize: 10.0,
                      ),
                    ),
                    SizedBox(width: 5),
                    SizedBox(width: 5),
                  ],
                ),

                // SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Divider(),
                ),
                SizedBox(height: 15),

/* -------------------------------------------------------------------------- */
/*                          //! Goals, salary method                          */
/* -------------------------------------------------------------------------- */

                mySmallCard2(),
                // SizedBox(height: 2),

/* -------------------------------------------------------------------------- */
/*                    //! qualifications/skills card                          */
/* -------------------------------------------------------------------------- */
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      flex: 1,
                      child: mySmallCard(Icons.book, 'Qualification required:',
                          '${postObj.qualifications_req}'),
                    ),
                    // Flexible(
                    //     child: VerticalDivider(
                    //   color: Colors.black,
                    // )),
                    // SizedBox(width: 5),
                    Flexible(
                      flex: 1,
                      child: mySmallCard(Icons.edit, 'Skills required:',
                          '${postObj.skills_req}'),
                    )
                  ],
                ),

                // SizedBox(height: 10),
                // Divider(
                //   thickness: 1,
                //   // color: Colors.grey,
                // ),
                SizedBox(height: 20),

/* -------------------------------------------------------------------------- */
/*                           //! View members button                          */
/* -------------------------------------------------------------------------- */

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AcceptedPostMembers_Fetch_Screen(
                          post_fk: postObj.id,
                          fromProfile: false,
                        );
                      }));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 58, 0, 233),
                            width: 1,
                          ),

                          borderRadius: BorderRadius.circular(4),
                          // color: Colors.blue,
                          gradient: LinearGradient(
                              colors: [
                                // Color.fromARGB(255, 243, 243, 243),
                                // Color.fromARGB(255, 231, 231, 231),
                                // Colors.blueAccent,
                                // Color.fromARGB(255, 2, 68, 182),

                                // Color(0xff2D42FF),
                                // Color(0xff190062),

                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.1,
                              blurRadius: 0.5,
                              offset:
                                  Offset(1, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width:
                                MyComponents.screenSize(context).width * 0.45,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 70,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'images/team_members.png'),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'View team members',
                                      // maxLines: 2,
                                      // overflow: TextOverflow.ellipsis,
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.deepPurpleAccent,
                                        // decoration: TextDecoration.none,
                                        // fontStyle: FontStyle.italic,
                                        // fontFamily: "FontNameHere" ,
                                        // fontWeight: FontWeight.bold,
                                        // fontWeight: FontWeight.w300,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    Text(
                                      'Max users: ${postObj.max_users}',
                                      // maxLines: 2,
                                      // overflow: TextOverflow.ellipsis,
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.deepPurpleAccent,
                                        // decoration: TextDecoration.none,
                                        // fontStyle: FontStyle.italic,
                                        // fontFamily: "FontNameHere" ,
                                        fontWeight: FontWeight.bold,
                                        // fontWeight: FontWeight.w300,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 5),

/* -------------------------------------------------------------------------- */
/*                               //! Text button                              */
/* -------------------------------------------------------------------------- */
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: MyComponents.screenSize(context).height * 0.055,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        // color: Colors.blue,
                        gradient: LinearGradient(
                            colors: [
                              // Color(0xffDDDDDD),
                              // Color.fromARGB(255, 255, 60, 125),
                              // Color.fromARGB(255, 53, 1, 194),
                              // Color.fromARGB(255, 25, 0, 255),
                              // Color.fromARGB(255, 81, 0, 231),

                              Color.fromARGB(255, 81, 0, 231),
                              Color.fromARGB(255, 11, 0, 114),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              postObj.post_fk ==
                                      Profile_sp_repo.get_profile()!.p_uid
                                  ? Icons.not_interested
                                  : Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              postObj.post_fk ==
                                      Profile_sp_repo.get_profile()!.p_uid
                                  ? '"Post author - cant join"'
                                  : "Join the team",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        // style: TextButton.styleFrom(
                        //     // backgroundColor: Colors.pink[600]
                        //     ),
                        onPressed: () async {
                          if (postObj.post_fk !=
                              Profile_sp_repo.get_profile()!.p_uid) {
                            await fetchListFunc(context, postObj);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 20),
                // Divider(thickness: 1),

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */
              ]),
        ),
      ),
    );
  }

  mySmallCard(IconData icon, String heading, String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 231, 231, 231),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          gradient: LinearGradient(colors: [
            // Color.fromARGB(255, 30, 210, 255),
            // Color.fromARGB(255, 99, 185, 255),

            // Color.fromARGB(255, 0, 31, 102),

            // Color(0xff3C6EE1),
            // Color.fromARGB(255, 12, 67, 194),

            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 1,
          //     blurRadius: 1,
          //     offset: Offset(0, 3), // changes position of shadow
          //   ),
          // ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(
                  icon,
                  color: Colors.black,
                  size: 16,
                ),
                SizedBox(width: 4),
                Text(
                  '$heading',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 9.0,
                  ),
                ),
              ]),
              SizedBox(height: 4),
              Text(
                '$value',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  // decoration: TextDecoration.none,
                  // fontStyle: FontStyle.italic,
                  // fontFamily: "FontNameHere" ,
                  // fontWeight: FontWeight.bold,
                  // fontWeight: FontWeight.w300,
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  mySmallCard2() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 231, 231, 231),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
          color: Colors.blue,
          gradient: LinearGradient(colors: [
            // Color.fromARGB(255, 30, 210, 255),
            // Color.fromARGB(255, 99, 185, 255),

            // Color(0xff3C6EE1),
            // Color.fromARGB(255, 12, 67, 194),

            // Color.fromARGB(255, 0, 31, 102),

            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.2),
          //     spreadRadius: 0.5,
          //     blurRadius: 1,
          //     offset: Offset(1, 2), // changes position of shadow
          //   ),
          // ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.track_changes,
                    size: 20,
                    color: Colors.black,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Goals: ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      // decoration: TextDecoration.none,
                      // fontStyle: FontStyle.italic,
                      // fontFamily: "FontNameHere" ,
                      fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.w300,
                      fontSize: 10.0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${postObj.goals}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        // decoration: TextDecoration.none,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: "FontNameHere" ,
                        // fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w300,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.attach_money,
                    size: 20,
                    color: Colors.black,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Salary methods: ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      // decoration: TextDecoration.none,
                      // fontStyle: FontStyle.italic,
                      // fontFamily: "FontNameHere" ,
                      fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.w300,
                      fontSize: 10.0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${postObj.salary_method}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        // decoration: TextDecoration.none,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: "FontNameHere" ,
                        // fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w300,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      //leading: IconButton(
      //  icon: Icon(
      //   Icons.arrow_back,
      //   color: Colors.black,
      //   ),
      //   onPressed: (){
      //       Navigator.pop(context);
      //   }
      // ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        'Home', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      //actions: [

      //  Padding(
      //    padding: const EdgeInsets.all(8.0),
      //   child: IconButton(
      //       onPressed: null,
      //       icon: Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       )), )
      // ],
    );
  }
/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  fetchListFunc(context, listTileInfo) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PostMembers_cud_screen(singleObj: listTileInfo);
    }));
  }
}
