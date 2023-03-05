import 'package:bizcon1/Repo/Profile_repo.dart';
import 'package:bizcon1/Repo/User_repo.dart';
import 'package:bizcon1/service_layer_stub/models/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../COMMON/myComponents.dart';
import '../Splash_stub/SplashScreen.dart';
import 'edit_profile_logic/edit_profile_bloc.dart';

class CreateProfileScreen extends StatefulWidget {
  final isFromProfileScreen;
  const CreateProfileScreen({Key? key, this.isFromProfileScreen})
      : super(key: key);
  const CreateProfileScreen.fromProfileScreen(
      {required this.isFromProfileScreen});

  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
/* -------------------------------------------------------------------------- */
/*                               //! controllers                              */
/* -------------------------------------------------------------------------- */
  final _createFormKey = GlobalKey<FormState>();

  /* -------------------------------------------------------------------------- */
/*                               //@ controllers                              */
/* -------------------------------------------------------------------------- */

  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController skillsController = TextEditingController();

/* -------------------------------------------------------------------------- */
/*                            //! lifcycle methods                            */
/* -------------------------------------------------------------------------- */

  // @override
  void initState() {
    super.initState();
    if (widget.isFromProfileScreen != null) {
      Profile profile_spObj = Profile_sp_repo.get_profile()!;
      usernameController.text = profile_spObj.username;
      bioController.text = profile_spObj.bio;
      roleController.text = profile_spObj.role;
      qualificationController.text = profile_spObj.qualifications;
      skillsController.text = profile_spObj.skills;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myHeader(),
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: myBody(),
    );
  }

  myBody() {
    var dimVar = MediaQuery.of(context).size;

//height : dimVar.height*0.5    //to access height
//width : dimVar.width*0.5       //acces width
    return SafeArea(
        child: SingleChildScrollView(
      child: Form(
        key: _createFormKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: dimVar.height * 0.01),
            //
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(45.0, 1, 8.0, 1),
                child: Text(
                  widget.isFromProfileScreen != null
                      ? "UPDATE PROFILE"
                      : "CREATE PROFILE",
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      // decoration: TextDecoration.none,
                      // fontStyle: FontStyle.italic,
                      // fontFamily: "Rubik",
                      fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.w300,
                      fontSize: 22),
                ),
              ),
            ),

            //

            SizedBox(height: 40),

            //

            // CircleAvatar(
            //   radius: dimVar.height * 0.08,
            //   backgroundColor: Color(0xffFFE247),
            //   // backgroundImage: NetworkImage(GAuth_sp_repo.spGet_userPhotoUrl()),
            // ),

            //
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  MyComponents.buildTextField(
                      usernameController, 'Enter username'),
                  MyComponents.buildTextField(bioController, 'Enter bio'),
                  MyComponents.buildTextField(roleController,
                      'Your current role(student/software engineer/etc)'),
                  MyComponents.buildTextField(qualificationController,
                      'Enter Academic qualification/Work experience'),
                  MyComponents.buildTextField(skillsController,
                      'Enter skills (python,marketing,finance,etc)'),
                ],
              ),
            ),

            SizedBox(height: 5),
            editProfileButton_STATES()
          ],
        ),
      ),
    ));
  }

  submitButton() {
    var dimVar = MediaQuery.of(context).size;

//height : dimVar.height*0.5    //to access height
//width : dimVar.width*0.5       //acces width
    return SizedBox(
        width: dimVar.width * 0.85,
        height: dimVar.height * 0.065,
        child: TextButton(
          child: Text(
            widget.isFromProfileScreen != null
                ? "UPDATE PROFILE"
                : "CONTINUE TO APP",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          style: TextButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {
            if (_createFormKey.currentState!.validate()) {
              Profile profileObj = Profile(
                  p_uid: User_sp_repo.get_user()!.id!,
                  username: usernameController.text,
                  bio: bioController.text,
                  role: roleController.text,
                  qualifications: qualificationController.text,
                  skills: skillsController.text);

              widget.isFromProfileScreen != null
                  ? BlocProvider.of<EditProfileBloc>(context).add(
                      EditProfile_ButtonPressed_Event(
                          isProfileUpdateEvent: true,
                          modelObjToAdd: profileObj))
                  : BlocProvider.of<EditProfileBloc>(context).add(
                      EditProfile_ButtonPressed_Event(
                          isProfileUpdateEvent: false,
                          modelObjToAdd: profileObj));
            }
          },
        ));
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ STATES                                 */
/* -------------------------------------------------------------------------- */

  editProfileButton_STATES() {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listener: (context, state) async {
        if (state is EditProfile_success_State) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return SplashScreen();
          }));
        }
      },
      builder: (context, state) {
        if (state is EditProfile_loading_State) {
          return MyComponents.buildLoading();
        } else if (state is EditProfile_error_State) {
          return Column(
            children: [
              submitButton(),
              SizedBox(height: 5),
              Text('${state.error}')
            ],
          );
        }
        return submitButton();
      },
    );
  }

  AppBar myHeader() {
    return AppBar(
        backgroundColor: Colors.white,
        // centerTitle: true,
        elevation: 0.0,

        //# Condition if called from profile screen
        leading: widget.isFromProfileScreen != null
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
            : Container()
        // automaticallyImplyLeading: true, //removes default back arrow on appbar

        // title: Text(
        //   'Home', //give here appBar title
        //   style: TextStyle(color: Colors.black
        //       // fontWeight: FontWeight.bold
        //       // fontSize: 15,
        //       ),
        // ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: IconButton(
        //         onPressed: () {
        //           Navigator.push(context, MaterialPageRoute(builder: (context) {
        //             return Logout_screen();
        //           }));
        //         },
        //         icon: Icon(
        //           Icons.settings,
        //           color: Colors.black,
        //         )),
        //   )
        // ],
        );
  }
}
