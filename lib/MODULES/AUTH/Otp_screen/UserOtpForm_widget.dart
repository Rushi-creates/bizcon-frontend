import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_layer_stub/models/User.dart';
import '../../Splash_stub/SplashScreen.dart';
import '../Register_screen/UserRegButtonScreen.dart';
import '__UserOtp__/UserOtpButton_logic/user_otp_button_bloc.dart';

//to change class name = right click on className> Rename symbol
class UserOtpForm extends StatefulWidget {
  const UserOtpForm({Key? key}) : super(key: key);

  @override
  _UserOtpFormState createState() => _UserOtpFormState();
}

class _UserOtpFormState extends State<UserOtpForm> {
  //

  final _createFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return myUserOtpForm();
  }

  myUserOtpForm() {
    var dimVar =
        MediaQuery.of(context).size; //declare only this line in build()
    return // get parent height
        Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
      child: Container(
        width: double.infinity,
        // height: double.infinity,
        margin: const EdgeInsets.all(0.0),
        color: Colors.pink,

        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _createFormKey,
              child: Column(
                children: [
                  emailTextField(emailController, 'Enter email'),
                  SizedBox(height: 20),
                  numTextField(numberController, 'Enter number'),
                  SizedBox(height: 20),
                  passTextField(passwordController, 'Enter password'),
                  SizedBox(height: 20),
                  otpErrorText_STATES(),
                  myOtpButton_STATES(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                              //! Body widgets                              */
/* -------------------------------------------------------------------------- */

  myOtpButtonDesign() {
    var dimVar = MediaQuery.of(context).size;

    return TextButton(
      // onPressed: () async => myOtpButton_func(),
      onPressed: () async => FAKE_myOtpButton_func(),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2.0, color: Colors.pink)),
        width: dimVar.width * 0.7,
        height: dimVar.height * 0.05,
        child: Center(
          child: Text(
            'Send OTP',
            style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Static widgets                             */
/* -------------------------------------------------------------------------- */

  emailTextField(controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label, //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email connot be empty'; //if empty give error msg here
        } else if (!value.contains('@'))
          return 'Email should contain @';
        else if (!value.contains('.com')) return 'Email should contain .com';
        return null;
      },
      onChanged: (value) {
        _createFormKey.currentState!.validate();
      },
    );
  }

  passTextField(controller, String label) {
    //******First text Field from here *****
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label, //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password cannot be empty'; //if empty give error msg here
        } else if (value.length < 4) return 'Password too short';
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

  numTextField(controller, String label) {
    //******First text Field from here *****
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label, //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Number cannot be empty'; //if empty give error msg here
        } else if (value.length < 10)
          return 'Length of number must be 10';
        else if (value.length > 10)
          return 'Number cannot be more than 10 digits';
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

  buildBorderedTextField(controllerArg, String labelTextArg,
      {bool isKbNumber = false, bool isObscure = false}) {
    var dimVar = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,

        children: [
          //******First text Field from here *****
          SizedBox(
            width: dimVar.width * 0.7,
            child: TextFormField(
              controller: controllerArg,
              obscureText: isObscure ? true : false,
              // onChanged: (value) {
              //   BlocProvider.of<UserAuthBloc>(context)
              //       .add(Validate_Email_Event(emailController.text));
              //   BlocProvider.of<UserAuthBloc>(context)
              //       .add(Validate_Number_Event(numberController.text));
              //   BlocProvider.of<UserAuthBloc>(context)
              //       .add(Validate_password_Event(passwordController.text));
              // },
              keyboardType:
                  isKbNumber ? TextInputType.number : TextInputType.multiline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field required'; //if empty give error msg here
                }

                //? doesnt work for some reason
                // if (isCredentialWrong) {
                //   print('credtentials are wrong , from validation ');
                //   return 'Either email or password or both are wrong';
                // }
                // if (isAccExists) {
                //   print(
                //       'account already exists , try logging in instead , from validation ');
                //   return 'Account\'s email already exists, try logging in instead';
                // }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: labelTextArg, //hint text here
              ),
            ),
          ),
          SizedBox(
            height: 20,
            //height : dimVar.height*0.04
          ),
        ],
      ),
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

  pushToRegButtonScreen(otp) {
    UserAcc userObj = UserAcc(
        email: emailController.text,
        number: int.tryParse(numberController.text)!,
        password: passwordController.text);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return UserRegButtonScreen.named(
        regModelObj: userObj,
        otp: otp,
      );
    }));
  }

/* -------------------------------------------------------------------------- */
/*                                //@ My States                               */
/* -------------------------------------------------------------------------- */

  otpErrorText_STATES() {
    return BlocConsumer<UserOtpButtonBloc, UserOtpButtonState>(
      listener: (context, state) {
        if (state is UserOtp_SuccessState) {
          pushToRegButtonScreen(state.otp);
        }
      },
      builder: (context, state) {
        if (state is UserOtp_LoadingState)
          return buildWarnTextDeisgn('');
        else if (state is UserOtp_UnknownError_State)
          return buildWarnTextDeisgn(state.error);
        else if (state is UserOtp_accountAlreadyExists_State)
          return buildWarnTextDeisgn(state.msg);
        else if (state is UserOtp_SuccessState) return buildWarnTextDeisgn('');
        return buildWarnTextDeisgn('');
      },
    );
  }

  myOtpButton_STATES() {
    return BlocBuilder<UserOtpButtonBloc, UserOtpButtonState>(
      builder: (context, state) {
        if (state is UserOtp_LoadingState) return buildLoading();
        // else if (state is UserOtp_UnknownError_State)
        //   return myOtpButtonDesign();
        // else if (state is UserOtp_accountAlreadyExists_State)
        //   return buildWarnTextDeisgn(state.msg);
        // else if (state is UserOtp_SuccessState) return buildWarnTextDeisgn('');
        return myOtpButtonDesign();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ FUNCTIONALITIES                            */
/* -------------------------------------------------------------------------- */

  //! this is real func
  myOtpButton_func() {
    if (_createFormKey.currentState!.validate()) {
      UserAcc userObj = UserAcc(
          email: emailController.text,
          number: int.tryParse(numberController.text)!,
          password: passwordController.text);

      BlocProvider.of<UserOtpButtonBloc>(context)
          .add(UserOtpButtonClicked_Event(userObj));
    }
  }

  // this is fake , to avoid current use of otp
  FAKE_myOtpButton_func() {
    if (_createFormKey.currentState!.validate()) {
      UserAcc userObj = UserAcc(
          email: emailController.text,
          number: int.tryParse(numberController.text)!,
          password: passwordController.text);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return UserRegButtonScreen.named(
          regModelObj: userObj,
          otp: 1234,
        );
      }));
    }
  }
}
