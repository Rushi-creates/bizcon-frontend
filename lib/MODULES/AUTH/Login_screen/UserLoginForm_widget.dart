import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_layer_stub/models/User.dart';
import '../../Splash_stub/SplashScreen.dart';
import 'UserLoginButton_logic/user_login_button_bloc.dart';
import 'UserLoginForm_logic/user_login_form_bloc.dart';

//to change class name = right click on className> Rename symbol
class UserLoginForm extends StatefulWidget {
  const UserLoginForm({Key? key}) : super(key: key);

  @override
  _UserLoginFormState createState() => _UserLoginFormState();
}

class _UserLoginFormState extends State<UserLoginForm> {
  //

  final _createFormKey = GlobalKey<FormState>();
  TextEditingController login_emailController = TextEditingController();
  TextEditingController login_passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return myLoginForm();
  }

  myLoginForm() {
    // var dimVar = MediaQuery.of(context).size;
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  emailTextField(login_emailController, 'Enter email'),
                  SizedBox(height: 15),
                  passTextField(login_passwordController, 'Enter password'),
                  SizedBox(height: 15),
                  // commonValidationText_STATES(),
                  // validateButton_STATES(),
                  loginErrorText_STATES(),
                  myLoginButton_STATES()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

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
      // onChanged: (value) {
      //   BlocProvider.of<UserLoginFormBloc>(context)
      //       .add(UserLoginEmail_Changed_Event(controller.text));
      // },
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

/* -------------------------------------------------------------------------- */
/*                              //! Body widgets                              */
/* -------------------------------------------------------------------------- */

  GreyLoginButtonDesgin() {
    var dimVar = MediaQuery.of(context).size;

    return TextButton(
      onPressed: null,
      child: Container(
        decoration: BoxDecoration(color: Colors.grey),
        width: dimVar.width * 0.7,
        height: dimVar.height * 0.05,
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }

  loginButtonDesgin() {
    var dimVar = MediaQuery.of(context).size;

    return TextButton(
      onPressed: () async => loginFunctionality(),
      child: Container(
        decoration: BoxDecoration(color: Colors.pink),
        width: dimVar.width * 0.7,
        height: dimVar.height * 0.05,
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
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
              onChanged: (value) {
                BlocProvider.of<UserLoginFormBloc>(context)
                    .add(UserLoginEmail_Changed_Event(controllerArg.text));
                BlocProvider.of<UserLoginFormBloc>(context)
                    .add(UserLoginPass_Changed_Event(controllerArg.text));
              },
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

/* -------------------------------------------------------------------------- */
/*                            //@ Validation states                           */
/* -------------------------------------------------------------------------- */

  validateButton_STATES() {
    return BlocBuilder<UserLoginFormBloc, UserLoginFormState>(
      builder: (context, state) {
        if (state is UserLoginEmail_valid_State &&
            state is UserLoginPass_valid_State) return myLoginButton_STATES();

        return GreyLoginButtonDesgin();
      },
    );
  }

  commonValidationText_STATES() {
    return BlocBuilder<UserLoginFormBloc, UserLoginFormState>(
      builder: (context, state) {
        if (state is UserLoginEmail_NOT_Valid_State)
          return buildText(state.error);
        else if (state is UserLoginPass_NOT_Valid_State)
          return buildText(state.error);
        else if (state is UserLoginPass_NOT_Valid_State &&
            state is UserLoginEmail_valid_State)
          return state.error;
        else if (state is UserLoginEmail_NOT_Valid_State &&
            state is UserLoginPass_valid_State) return state.error;
        return emptyText();
      },
    );
  }

  // emailValidationText_STATES() {
  //   return BlocBuilder<UserLoginFormBloc, UserLoginFormState>(
  //     builder: (context, state) {
  //       if (state is UserLoginEmail_NOT_Valid_State)
  //         return buildText(state.error);
  //       return emptyText();
  //     },
  //   );
  // }

  // passValidationText_STATES() {
  //   return BlocBuilder<UserLoginFormBloc, UserLoginFormState>(
  //     builder: (context, state) {
  //       if (state is UserLoginPass_NOT_Valid_State)
  //         return buildText(state.error);
  //       return emptyText();
  //     },
  //   );
  // }

/* -------------------------------------------------------------------------- */
/*                                //@ My States                               */
/* -------------------------------------------------------------------------- */

  buildText(textArg) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(textArg),
    );
  }

  emptyText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(''),
    );
  }

  loginErrorText_STATES() {
    return BlocConsumer<UserLoginButtonBloc, UserLoginButtonState>(
      listener: (context, state) {
        if (state is UserLoginSuccessState) {
          pushReplaceToSplash();
          MyComponents.successSnackBar(context, 'Logged in successfully');
        }
      },
      builder: (context, state) {
        if (state is UserLoginLoadingState)
          return buildWarnTextDeisgn('');
        else if (state is UserLogin_UnknownError_State)
          return buildWarnTextDeisgn(state.error);
        else if (state is UserLoginFailure_accountDontExist_State)
          return buildWarnTextDeisgn(state.msg);
        else if (state is UserLoginSuccessState) return buildWarnTextDeisgn('');
        return buildWarnTextDeisgn('');
      },
    );
  }

  myLoginButton_STATES() {
    return BlocBuilder<UserLoginButtonBloc, UserLoginButtonState>(
      builder: (context, state) {
        if (state is UserLoginLoadingState) return buildLoading();
        // else if (state is UserOtp_UnknownError_State)
        //   return myOtpButtonDesign();
        // else if (state is UserOtp_accountAlreadyExists_State)
        //   return buildWarnTextDeisgn(state.msg);
        // else if (state is UserOtp_SuccessState) return buildWarnTextDeisgn('');
        return loginButtonDesgin();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ FUNCTIONALITIES                            */
/* -------------------------------------------------------------------------- */
  loginFunctionality() async {
    if (_createFormKey.currentState!.validate()) {
      UserAcc userObj = UserAcc(
          email: login_emailController.text,
          password: login_passwordController.text);

      BlocProvider.of<UserLoginButtonBloc>(context)
          .add(UserLoginButton_Clicked_Event(userObj));
    }
  }
}
