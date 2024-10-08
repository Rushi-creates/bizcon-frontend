import 'package:bizcon1/MODULES/AUTH/Register_screen/UserRegButtonScreen.dart';
import 'package:bizcon1/MODULES/AUTH/Switch_tabs/UserSwitchScreen.dart';
import 'package:bizcon1/MODULES/CREATE_PROFILE/CreateProfileScreen.dart';
import 'package:bizcon1/MODULES/PROFILE/__MyJoinedPosts_fetch_stub__/MyJoinedPosts_fetch_logic/MyJoinedPosts_fetch_bloc.dart';
import 'package:bizcon1/Repo/Profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../HOME/AllPosts_fetch_logic/AllPosts_fetch_bloc.dart';
import '../My_BottomBar_stub/My_BottomBar.dart';
import '../PROFILE/__MyPosts_fetch_stub__/MyPosts_fetch_logic/MyPosts_fetch_bloc.dart';
import 'Splash_roles_logic/splash_roles_bloc.dart';

//to change class name = right click on className> Rename symbol
class SplashScreen extends StatefulWidget {
  final isStartUp;
  SplashScreen({this.isStartUp = false});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    blocFunc();
    // if (widget.isStartUp) {
    //   resetBlocs();
    //   initializeBlocs();
    // }
  }

  blocFunc() {
    Future.delayed(Duration(milliseconds: widget.isStartUp ? 2000 : 500), () {
      BlocProvider.of<SplashRolesBloc>(context)
          .add(CheckRole_OnAppStartUpEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // backgroundColor: Color.fromARGB(255, 64, 0, 182),
      body:

          // BlocListener<InternetBloc, InternetState>(
          //   listener: (context, state) {
          //     // TODO: implement listener
          //     if (state is InternetGainState) {
          //       //Make sure this is a part of scaffold
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           backgroundColor: Colors.green,
          //           content: Text("Connected to internet"),
          //         ),
          //       );
          //     } else if (state is InternetLossState) {
          //       //Make sure this is a part of scaffold
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           backgroundColor: Colors.red,
          //           content: Text("Internet connection lost"),
          //         ),
          //       );
          //     }
          //   },
          //   child: myStates(),
          // )
          myStates(),
    );
  }

  myStates() {
    return BlocListener<SplashRolesBloc, SplashRolesState>(
      listener: (context, state) {
        if (state is RoleErrorState) {
          print('error while loading sp');
        } else if (state is User_Role_State) {
          //!
          resetBlocs();
          initializeBlocs();

          //!
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return My_BottomBar();
          }));
        } else if (state is ProfileNotCreated_Role_State) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return CreateProfileScreen();
          }));
        } else if (state is SelectRoleScreen_state) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return UserSwitchScreen();
          }));
        }
      },
      child: newDesignSplashScreenUi(),
      // child: designSplashScreenUi(),
    );
  }

  newDesignSplashScreenUi() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 3, 4, 36),
        Color(0xff090a2f),
        // Color(0xff20459c),
        // Color.fromARGB(255, 54, 96, 192),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 45,
            //   width: 50,
            //   child: Container(
            //     decoration: BoxDecoration(
            //         // color: Colors.amber,
            //         shape: BoxShape.rectangle,
            //         image: DecorationImage(
            //             // colorFilter:
            //             // ColorFilter.mode(Colors.pink, BlendMode.color),
            //             image: AssetImage('images/lightbulb.png'),
            //             fit: BoxFit.fill)),
            //   ),
            // ),
            // SizedBox(width: 5),
            // SizedBox(
            //   height: 90,
            //   width: 200,
            //   child: Container(
            //     decoration: BoxDecoration(
            //         // color: Colors.amber,
            //         shape: BoxShape.rectangle,
            //         image: DecorationImage(
            //             // colorFilter:
            //             // ColorFilter.mode(Colors.pink, BlendMode.color),
            //             image: AssetImage('images/bizcon.png'),
            //             fit: BoxFit.fill)),
            //   ),
            // ),
            Text(
              "Bizcon",
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                // fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  designSplashScreenUi() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff00cc99),
        Colors.teal,
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.amber,
          radius: 130,
          child: CircleAvatar(
            radius: 125,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
                radius: 120,
                backgroundColor: Colors.black,
                child: CircularProgressIndicator(
                  color: Colors.white,
                )

                //  Text(
                //   "",
                //   // maxLines: 2,
                //   // overflow: TextOverflow.ellipsis,
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     color: Colors.white,
                //     // decoration: TextDecoration.none,
                //     // fontStyle: FontStyle.italic,
                //     // fontFamily: "FontNameHere" ,
                //     fontWeight: FontWeight.bold,
                //     // fontWeight: FontWeight.w300,
                //     fontSize: 30.0,
                //   ),
                // ),
                ),
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                          //@ Initialize all blocs                          */
/* -------------------------------------------------------------------------- */

  resetBlocs() {
    BlocProvider.of<MyPostsFetchBloc>(context)
        .add(MyPosts_Fetch_onRefresh_Event());
    BlocProvider.of<AllPostsFetchBloc>(context)
        .add(AllPosts_Fetch_onRefresh_Event());
    BlocProvider.of<MyJoinedPostsFetchBloc>(context)
        .add(MyJoinedPosts_Fetch_onRefresh_Event());
  }

  initializeBlocs() {
    //# to call first set of pages
    BlocProvider.of<MyPostsFetchBloc>(context)
        .add(MyPosts_Fetch_onInit_Event(Profile_sp_repo.get_profile()!.p_uid));

    //# to call first set of pages
    BlocProvider.of<AllPostsFetchBloc>(context)
        .add(AllPosts_Fetch_onInit_Event());

    //#
    BlocProvider.of<MyJoinedPostsFetchBloc>(context).add(
        MyJoinedPosts_Fetch_onInit_Event(Profile_sp_repo.get_profile()!.p_uid));
  }
}
