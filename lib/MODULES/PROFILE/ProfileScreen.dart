import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
import 'package:bizcon1/MODULES/CREATE_PROFILE/CreateProfileScreen.dart';
import 'package:bizcon1/service_layer_stub/models/Profile.dart';
import 'package:flutter/material.dart';

import '../SETTINGS_SCREEN/Settings_screen.dart';
import '__AppliedToJoinPosts_fetch_stub__/AppliedToJoinPosts_fetch_screen/AppliedToJoinPosts_fetch_screen.dart';
import '__MyJoinedPosts_fetch_stub__/MyJoinedPosts_fetch_screen/MyJoinedPosts_fetch_screen.dart';
import '__MyPosts_fetch_stub__/MyPosts_fetch_screen/MyPosts_fetch_screen.dart';

//to change class name = right click on className> Rename symbol
class ProfileScreen extends StatefulWidget {
  final Profile profileObj;
  final bool isFromSearchScreen;
  final profilePuid;
  const ProfileScreen(
      {required this.profileObj,
      required this.profilePuid,
      this.isFromSearchScreen = false});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
/* -------------------------------------------------------------------------- */
/*                                  //@ build                                 */
/* -------------------------------------------------------------------------- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      // appBar: myHeader(),
      body: myBody(),
    );
  }

  myBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: myProfileCard(),
            ),
            // displayProfileDetailsCard(),
            // SizedBox(height: 2),
            // editProfileButton(),
            // SizedBox(height: 10),
            // checkMyJoinedPosts_card(),
            // SizedBox(height: 10),

            // Divider(),

            MyPosts_Fetch_Screen(
              isFromSearchScreen: widget.isFromSearchScreen,
              profilePuid: widget.profilePuid,
            ),
          ],
        ),
      ),
    );
  }

  joinedPostsButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MyJoinedPosts_Fetch_Screen(
            member_fk: widget.profileObj.p_uid,
            isFromProfile: true,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: SizedBox(
            height: MyComponents.screenSize(context).height * 0.06,
            width: MyComponents.screenSize(context).width * 0.4,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurpleAccent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5.0),
                // gradient: LinearGradient(colors: [
                //   Color.fromARGB(255, 90, 0, 235),
                //   Color.fromARGB(255, 143, 46, 255),
                // ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: displayProfileText(
                      'My Joined Posts', Colors.deepPurpleAccent),
                ),
              ),
            )),
      ),
    );
  }

  appliedToJoinButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AppliedToJoinPosts_Fetch_Screen(
              member_fk: widget.profileObj.p_uid);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: SizedBox(
          height: MyComponents.screenSize(context).height * 0.06,
          width: MyComponents.screenSize(context).width * 0.42,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 90, 0, 235),
                  Color.fromARGB(255, 143, 46, 255),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child:
                    displayProfileText('Waiting To Join Posts', Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  editProfileButton() {
    return SizedBox(
      width: MyComponents.screenSize(context).width,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            gradient: LinearGradient(colors: [
              // Color.fromARGB(255, 45, 0, 53),
              // Color.fromARGB(255, 102, 0, 161),
              Color.fromARGB(255, 74, 0, 158),
              Color.fromARGB(255, 16, 0, 87),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: TextButton(
          onPressed: () {
            // Add your onPressed function here
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CreateProfileScreen.fromProfileScreen(
                isFromProfileScreen: true,
              );
            }));
          },
          style: TextButton.styleFrom(
            // backgroundColor: Color.fromARGB(255, 233, 101, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
          ),
          child: Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  displayProfileText(text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(6),
      // padding: const EdgeInsets.only(left: 20, bottom: 2, top: 2),
      child: Text(
        text,
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          // decoration: TextDecoration.none,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          fontWeight: FontWeight.bold,
          // fontWeight: FontWeight.w300,
          fontSize: 10.0,
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                //! settings                                */
/* -------------------------------------------------------------------------- */

  myProfileCard() {
    Profile myProfile = widget.profileObj;
    return Column(
      children: [
        //@
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.isFromSearchScreen ? myBackIcon() : dummyBackButton(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.fromARGB(255, 226, 226, 226),
                    // backgroundImage: NetworkImage(

                    //   'https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-avatar-placeholder-png-image_3416697.jpg',
                    //   // 'https://w0.peakpx.com/wallpaper/121/369/HD-wallpaper-beautiful-girl-flower-aesthetic-ultra-girls-flower-girl-style-beautiful-portrait-woman-design-human-background-charming-young-face-female-beauty-model-gerbera-fashion-look-pretty.jpg'
                    // ),
                  ),
                ],
              ),
            ),
            mySettingsIcon()
          ],
        ),

        //@
        SizedBox(height: 10),
        Text(
          myProfile.username,
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            fontWeight: FontWeight.bold,
            // fontWeight: FontWeight.w300,
            fontSize: 22.0,
          ),
        ),
        Text(
          myProfile.bio,
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
            fontSize: 14.0,
          ),
        ),

        //@
        SizedBox(height: 10),
        // displayProfileDetailsCard(),

        secondDescription('My role', myProfile.role),
        secondDescription('My skills', myProfile.skills),
        secondDescription('My qualifications', myProfile.qualifications),
        SizedBox(height: 40),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            joinedPostsButton(),
            appliedToJoinButton(),
          ],
        ),
        // SizedBox(height: 5),

        editProfileButton(),

        Divider(),

        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Ideas created by me : ",
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 158, 158, 158),
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  secondDescription(String textArg, valueText) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            '      ${textArg}: ',
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              // color: Color.fromARGB(255, 97, 97, 97),
              color: Colors.grey,

              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              // fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 12.0,
            ),
          ),
        ),

        //

        Flexible(
          child: Text(
            '${valueText}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              // color: Color.fromARGB(255, 0, 2, 109),
              // color: Color.fromARGB(255, 97, 97, 97),
              color: Colors.grey,

              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              // fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }

  myBackIcon() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey[200],
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(Icons.keyboard_backspace_sharp),
        ),
      ),
    );
  }

  dummyBackButton() {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Icon(Icons.keyboard_backspace_sharp, color: Colors.white),
      ),
    );
  }

  mySettingsIcon() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey[200],
      child: InkWell(
        onTap: () {
          // Navigate to settings screen
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SettingScreen();
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(Icons.settings),
        ),
      ),
    );
  }
}
