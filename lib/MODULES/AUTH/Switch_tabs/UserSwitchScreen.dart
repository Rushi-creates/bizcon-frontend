import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Login_screen/UserLoginForm_widget.dart';
import '../Otp_screen/UserOtpForm_widget.dart';
import 'UserSwitchScreen_logic/user_switch_screen_bloc.dart';

//to change class name = right click on className> Rename symbol
class UserSwitchScreen extends StatefulWidget {
  const UserSwitchScreen({Key? key}) : super(key: key);

  @override
  _UserSwitchScreenState createState() => _UserSwitchScreenState();
}

class _UserSwitchScreenState extends State<UserSwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      body: interactionCard(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Body Structure                             */
/* -------------------------------------------------------------------------- */

  interactionCard() {
    // var dimVar = MediaQuery.of(context).size;

    return Column(
      // direction: Axis.vertical,
      children: [
        // Flexible(
        //   child: topWave(),
        // ),
        // Flexible(
        //   child: myFormButtonStates(),
        // ),
        // Flexible(
        //   flex: 3,
        //   child: myForm_STATES(),
        // ),
        // Spacer(),
        // Flexible(
        //   child: bottomWave(),
        // ),
        // Spacer(),
        topWave(),
        SizedBox(height: 30),
        myForm_STATES(),
        Align(
          alignment: Alignment.bottomLeft,
          child: myFormButtonStates(),
        ),
        Spacer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: bottomWave(),
        )
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                              //! body widgets                              */
/* -------------------------------------------------------------------------- */

  topWave() {
    return SizedBox(
      height: MyComponents.screenSize(context).height * 0.18,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
                image: AssetImage('images/login_wave1.png'), fit: BoxFit.fill)),
      ),
    );
  }

  bottomWave() {
    return SizedBox(
      height: MyComponents.screenSize(context).height * 0.1,
      width: MyComponents.screenSize(context).width,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
                image: AssetImage('images/login_wave2.png'), fit: BoxFit.fill)),
      ),
    );
  }

  myButtons(state) {
    var dimVar =
        MediaQuery.of(context).size; //declare only this line in build()

    return Padding(
      padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
      child: SizedBox(
        // width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (state is SwitchedToLogin_State)
                ? GestureDetector(
                    onTap: () => registerSwitchFunc(),
                    child: SizedBox(
                      // width: dimVar.width * 0.4,
                      // width: double. * 0.5,
                      width: dimVar.width * 0.2,

                      height: dimVar.height * 0.05,
                      child: Material(
                        shadowColor: Colors.blueGrey,
                        elevation: 2,
                        child: Container(
                          color: (state is SwitchedToRegister_State) ||
                                  (state is UserSwitchScreenInitial)
                              ? Color.fromARGB(255, 20, 255, 243)
                              : Color.fromARGB(255, 255, 255, 255),
                          child: Center(
                            child: Text(
                              'Register ?',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () => loginSwitchFunc(),
                    child: SizedBox(
                      // width: double.infinity * 0.5,
                      width: dimVar.width * 0.2,

                      height: dimVar.height * 0.05,
                      child: Material(
                        shadowColor: Colors.blueGrey,
                        elevation: 2,
                        child: Container(
                          // width: double.infinity,

                          color: (state is SwitchedToLogin_State)
                              ? Color.fromARGB(255, 20, 255, 243)
                              // ? Color.fromARGB(255, 34, 81, 211)
                              : Color.fromARGB(255, 255, 255, 255),
                          child: Center(
                            child: Text(
                              'Sign in?',
                              textAlign: TextAlign.center,
                              // style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Static Widgets                             */
/* -------------------------------------------------------------------------- */

  // bgDesign() {
  //   var dimVar = MediaQuery.of(context).size;

  //   return Column(
  //     children: [
  //       Container(
  //         height: dimVar.height * 0.4,
  //         // color: Colors.pink,
  //         decoration: BoxDecoration(
  //             gradient: LinearGradient(colors: [
  //           Colors.red,
  //           Colors.pink,
  //         ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
  //       ),
  //     ],
  //   );
  // }

  // proceedAsUserText() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Text(
  //       'Continue as user',
  //       // maxLines: 2,
  //       // overflow: TextOverflow.ellipsis,
  //       // textAlign: TextAlign.center,
  //       style: TextStyle(
  //         color: Colors.pink[900],
  //         // decoration: TextDecoration.none,
  //         // fontStyle: FontStyle.italic,
  //         // fontFamily: "FontNameHere" ,
  //         fontWeight: FontWeight.bold,
  //         // fontWeight: FontWeight.w300,
  //         fontSize: 22.0,
  //       ),
  //     ),
  //   );
  // }

  // myNewHeader() {
  //   return AppBar(
  //     backgroundColor: Colors.white,
  //     centerTitle: true,
  //     elevation: 0.0,
  //     // leading: customHeader(),
  //     // leading: IconButton(
  //     //     icon: Icon(
  //     //       Icons.arrow_back,
  //     //       color: Colors.black,
  //     //     ),
  //     //     onPressed: () {
  //     //       Navigator.pop(context);
  //     //     }),
  //     // automaticallyImplyLeading: true, //removes default back arrow on appbar

  //     title: proceedAsUserText(),
  //     // actions: [

  //     //   Padding(
  //     //     padding: const EdgeInsets.all(8.0),
  //     //     child: IconButton(
  //     //         onPressed: null,
  //     //         icon: Icon(
  //     //           Icons.mail,
  //     //           color: Colors.black,
  //     //         )),
  //     //   )
  //     // ],
  //   );
  // }

  customHeader() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 20, 8.0, 1),
          child: Text(
            "< Go back",
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
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ STATES                                 */
/* -------------------------------------------------------------------------- */

  myForm_STATES() {
    return BlocBuilder<UserSwitchScreenBloc, UserSwitchScreenState>(
      builder: (context, state) {
        if (state is SwitchedToLogin_State)
          return UserLoginForm();
        else if (state is SwitchedToRegister_State) return UserOtpForm();
        return UserOtpForm();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                         // @ Switch button states                          */
/* -------------------------------------------------------------------------- */

  myFormButtonStates() {
    return BlocBuilder<UserSwitchScreenBloc, UserSwitchScreenState>(
      builder: (context, state) {
        return myButtons(state);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ FUNCTIONALITIES                            */
/* -------------------------------------------------------------------------- */

  loginSwitchFunc() {
    BlocProvider.of<UserSwitchScreenBloc>(context).add(SwitchToLogin_Event());
  }

  registerSwitchFunc() {
    {
      BlocProvider.of<UserSwitchScreenBloc>(context)
          .add(SwitchToRegister_Event());
    }
  }
}
