import 'package:bizcon1/MODULES/AUTH/Register_screen/UserRegButtonScreen.dart';
import 'package:bizcon1/MODULES/AUTH/Switch_tabs/UserSwitchScreen.dart';
import 'package:bizcon1/MODULES/CREATE_PROFILE/CreateProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../My_BottomBar_stub/My_BottomBar.dart';
import 'Splash_roles_logic/splash_roles_bloc.dart';

//to change class name = right click on className> Rename symbol
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    blocFunc();
  }

  blocFunc() {
    Future.delayed(Duration(milliseconds: 2000), () {
      BlocProvider.of<SplashRolesBloc>(context)
          .add(CheckRole_OnAppStartUpEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 0, 143),
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
      child: Center(
        child: Text(
          "Current Trends",
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            // fontWeight: FontWeight.bold,
            // fontWeight: FontWeight.w300,
            fontSize: 20.0,
          ),
        ),
      ),
      // child: Image.asset("images/blackLogo.png", height: 250, width: 250)),
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
}
