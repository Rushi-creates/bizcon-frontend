import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Splash_stub/SplashScreen.dart';
import 'UserRegButton_logic/user_reg_button_bloc.dart';

//to change class name = right click on className> Rename symbol
class UserRegButtonScreen extends StatefulWidget {
/* -------------------------------------------------------------------------- */
/*                           //@ constructor fields                           */
/* -------------------------------------------------------------------------- */
  final regModelObj;
  final otp;

  const UserRegButtonScreen({Key? key, this.regModelObj, this.otp})
      : super(key: key);

  const UserRegButtonScreen.named(
      {super.key, required this.regModelObj, required this.otp});

  @override
  _UserRegButtonScreenState createState() => _UserRegButtonScreenState();
}

class _UserRegButtonScreenState extends State<UserRegButtonScreen> {
  final _createFormKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

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
      child: Center(
          child:
              Padding(padding: const EdgeInsets.all(15.0), child: myOtpForm())),
    );
  }

  otpTextField(controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label, //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'OTP cannot be empty'; //if empty give error msg here
        } else if (value.length < 4)
          return 'Enter 4 digit otp';
        else if (value.length > 4) return 'Otp cannot be more than 4 digits';
        return null;
      },
      onChanged: (value) {
        _createFormKey.currentState!.validate();
      },
      // onChanged: (value) {
      //   BlocProvider.of<UserLoginFormBloc>(context)
      //       .add(UserLoginPass_Changed_Event(controller.text));
      // },
    );
  }

  myOtpForm() {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _createFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.center,
                child: myImage(),
              ),
              otpTextField(otpController, 'Enter the 4 digit otp here'),
              regErrorText_STATES(),
              Center(
                child: myRegButton_STATES(),
              ),
              SizedBox(height: 10),
              resendOtpButtonDesign()
            ],
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                              //! body widgets                              */
/* -------------------------------------------------------------------------- */
  // registerButtonDesgin() {
  //   var dimVar = MediaQuery.of(context).size;

  //   return TextButton(
  //     onPressed: () async => registerFunctionality(),
  //     child: Container(
  //       decoration: BoxDecoration(color: Color.fromARGB(255, 0, 7, 102)),
  //       width: dimVar.width * 0.7,
  //       height: dimVar.height * 0.05,
  //       child: Center(
  //         child: Text(
  //           'Register',
  //           style: TextStyle(
  //               color: Colors.white,
  //               fontWeight: FontWeight.bold,
  //               letterSpacing: 2),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  myImage() {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: SizedBox(
        height: 250,
        width: 300,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  image: AssetImage('images/otp1.png'), fit: BoxFit.fill)),
        ),
      ),
    );
  }

  registerButtonDesgin() {
    var dimVar = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: TextButton(
        // onPressed: () async => myOtpButton_func(),
        onPressed: () async => registerFunctionality(),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromARGB(255, 16, 26, 161),
              // color: Color.fromARGB(255, 68, 202, 255),
              border: Border.all(
                width: 2.0,
                color: Colors.white,
              )),
          width: dimVar.width * 0.8,
          height: dimVar.height * 0.06,
          child: Center(
            child: Text(
              'Register',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
          ),
        ),
      ),
    );
  }

  resendOtpButtonDesign() {
    return TextButton(
      child: Text(
        "Go back and resend Otp",
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        // textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          // fontWeight: FontWeight.bold,
          // fontWeight: FontWeight.w300,
          // fontSize: 20.0,
        ),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.white),
      onPressed: () => resendOtpButton_Func(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Static widgets                             */
/* -------------------------------------------------------------------------- */
  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      // leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     }),
      // // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        'Enter Otp', //give here appBar title
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

  buildWarnTextDeisgn(String textArg) {
    return Text(
      textArg,
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        fontWeight: FontWeight.bold,
        // fontWeight: FontWeight.w300,
        fontSize: 15.0,
      ),
    );
  }

  buildLoading() {
    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Please wait...'),
        ),
        CircularProgressIndicator(),
      ],
    ));
  }

  pushReplaceToSplash() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return SplashScreen();
    }));
  }
/* -------------------------------------------------------------------------- */
/*                                //@ My STATES                               */
/* -------------------------------------------------------------------------- */

  regErrorText_STATES() {
    return BlocConsumer<UserRegButtonBloc, UserRegButtonState>(
      listener: (context, state) {
        if (state is UserRegisterSuccessState) {
          pushReplaceToSplash();
          MyComponents.successSnackBar(context, 'Signed in successfully');
        }
      },
      builder: (context, state) {
        if (state is UserRegisterLoadingState)
          return buildWarnTextDeisgn('');
        else if (state is UserRegister_UnknownError_State)
          return buildWarnTextDeisgn(state.error);
        else if (state is OtpDidntMatched_State)
          return buildWarnTextDeisgn(
              'Wrong OTP entered, please enter correct OTP');
        else if (state is UserRegisterSuccessState)
          return buildWarnTextDeisgn('');
        return buildWarnTextDeisgn('');
      },
    );
  }

  myRegButton_STATES() {
    return BlocBuilder<UserRegButtonBloc, UserRegButtonState>(
      builder: (context, state) {
        if (state is UserRegisterLoadingState) return buildLoading();
        // else if (state is UserOtp_UnknownError_State)
        //   return myOtpButtonDesign();
        // else if (state is UserOtp_accountAlreadyExists_State)
        //   return buildWarnTextDeisgn(state.msg);
        // else if (state is UserOtp_SuccessState) return buildWarnTextDeisgn('');
        return registerButtonDesgin();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ FUNCTIONALITIES                            */
/* -------------------------------------------------------------------------- */

  registerFunctionality() {
    if (_createFormKey.currentState!.validate()) {
      BlocProvider.of<UserRegButtonBloc>(context).add(
          UserRegButtonClicked_Event(
              modelObjToAdd: widget.regModelObj,
              otpFromPreviousPage: widget.otp,
              otpFromTextField: int.tryParse(otpController.text)));
    }
  }

  resendOtpButton_Func() {
    Navigator.pop(context);
  }
}
