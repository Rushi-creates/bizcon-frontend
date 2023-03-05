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
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: myBody(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Body Structure                             */
/* -------------------------------------------------------------------------- */

  myBody() {
    var dimVar = MediaQuery.of(context).size;

    return SafeArea(child: interactionCard()

        // Stack(
        //   children: [
        //     // bgDesign(),
        //     interactionCard()
        //   ],
        // ),

        // SingleChildScrollView(
        //   child:

        // ),
        );
  }

  interactionCard() {
    var dimVar = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: myNewHeader(),
          ),
          SizedBox(height: dimVar.height * 0.03),
          // proceedAsUserText(),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Image.asset("images/authUser.jpg",
                // height: dimVar.width * 0.5,
                width: dimVar.width),
          ),
          Text(
            'Register - if you do not have an account\n'
            'Login - if you already have an account',
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue[900],
              // decoration: TextDecoration.none,
              fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              // fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              // fontSize: 20.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 2),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(children: [
                SizedBox(height: 20),
                myFormButtonStates(),
                myForm_STATES(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                              //! body widgets                              */
/* -------------------------------------------------------------------------- */

  myButtons(state) {
    var dimVar =
        MediaQuery.of(context).size; //declare only this line in build()

    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () => registerSwitchFunc(),
                child: SizedBox(
                  // width: dimVar.width * 0.4,
                  // width: double. * 0.5,

                  height: dimVar.height * 0.05,
                  child: Container(
                    color: (state is SwitchedToRegister_State) ||
                            (state is UserSwitchScreenInitial)
                        ? Colors.pink
                        : Colors.white,
                    child: Center(
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () => loginSwitchFunc(),
                child: SizedBox(
                  // width: double.infinity * 0.5,
                  // width: dimVar.width * 0.4,

                  height: dimVar.height * 0.05,
                  child: Container(
                    // width: double.infinity,

                    color: (state is SwitchedToLogin_State)
                        ? Colors.pink
                        : Colors.white,
                    child: Center(
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
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

  bgDesign() {
    var dimVar = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: dimVar.height * 0.4,
          // color: Colors.pink,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.red,
            Colors.pink,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
      ],
    );
  }

  proceedAsUserText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Continue as user',
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        // textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.pink[900],
          // decoration: TextDecoration.none,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          fontWeight: FontWeight.bold,
          // fontWeight: FontWeight.w300,
          fontSize: 22.0,
        ),
      ),
    );
  }

  myNewHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      // leading: customHeader(),
      // leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     }),
      // automaticallyImplyLeading: true, //removes default back arrow on appbar

      title: proceedAsUserText(),
      // actions: [

      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: IconButton(
      //         onPressed: null,
      //         icon: Icon(
      //           Icons.mail,
      //           color: Colors.black,
      //         )),
      //   )
      // ],
    );
  }

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
