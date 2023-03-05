import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
import 'package:bizcon1/MODULES/Splash_stub/SplashScreen.dart';
import 'package:bizcon1/Repo/Profile_repo.dart';
import 'package:bizcon1/service_layer_stub/models/Post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../PROFILE/__MyPosts_fetch_stub__/MyPosts_fetch_logic/MyPosts_fetch_bloc.dart';
import 'Post_cud_logic/Post_cud_bloc.dart';

//to change class name = right click on className> Rename symbol
class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
/* -------------------------------------------------------------------------- */
/*                               //@ Controllers                              */
/* -------------------------------------------------------------------------- */

  TextEditingController title_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();
  TextEditingController salaryMethod_controller = TextEditingController();
  TextEditingController goals_controller = TextEditingController();
  TextEditingController qualifications_req_controller = TextEditingController();
  TextEditingController skills_req_controller = TextEditingController();
  TextEditingController maxUsers_controller = TextEditingController();

/* -------------------------------------------------------------------------- */
/*                                  //@ build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: myBody(),
    );
  }

  myBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myHeaderTitle(),
                  headerDescription(),
                ],
              ),
              SizedBox(height: 25),
              aboutIdeaCard(),
              SizedBox(height: 10),
              aboutTeamCard(),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: createPost_STATES(),
              )
            ],
          ),
        ),
      ),
    ));
  }

  createPost_STATES() {
    return BlocConsumer<PostCudBloc, PostCudState>(
      listener: (context, state) async {
        if (state is Post_create_Loaded_State) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return SplashScreen();
          }));
        }
      },
      builder: (context, state) {
        if (state is Post_create_Loading_State) {
          return MyComponents.buildLoading();
        } else if (state is Post_create_Error_State) {
          return Column(
            children: [
              createPostButton(),
              SizedBox(height: 5),
              Text('${state.error}')
            ],
          );
        }
        return createPostButton();
      },
    );
  }

  createPostButton() {
    return SizedBox(
      width: MyComponents.screenSize(context).width * 0.5,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),

          // side: BorderSide(width: 2.0, color: Colors.deepPurpleAccent,
          // ),
          // backgroundColor: Color.fromARGB(255, 15, 0, 68),
        ),
        onPressed: () {
          Post post = Post(
              title: title_controller.text,
              description: description_controller.text,
              salary_method: salaryMethod_controller.text,
              goals: goals_controller.text,
              qualifications_req: qualifications_req_controller.text,
              skills_req: skills_req_controller.text,
              max_users: int.tryParse(maxUsers_controller.text)!,
              isOpen: true,
              isCompanyRegistered: true,
              recordDate: DateTime.now().toString(),
              post_fk: Profile_sp_repo.get_profile()!.p_uid);

          BlocProvider.of<PostCudBloc>(context)
              .add(Post_create_onButtonPressed_Event(post));

          BlocProvider.of<MyPostsFetchBloc>(context)
              .add(MyPosts_Fetch_onInit_Event());
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(colors: [
                // Color.fromARGB(255, 45, 2, 202),
                // Color.fromARGB(255, 45, 2, 202),
                Color.fromARGB(255, 29, 0, 90),
                Color.fromARGB(255, 15, 1, 46),

                // Color.fromARGB(255, 45, 2, 202),
                // Color.fromARGB(255, 26, 0, 119),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          //   Color.fromARGB(255, 49, 0, 155),
          //   Color.fromARGB(255, 13, 0, 59),
          // ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: SizedBox(
            width: MyComponents.screenSize(context).width,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                "Create Post",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white
                    // color: Color.fromARGB(255, 18, 0, 68),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // createPostButton() {
  //   return SizedBox(
  //     width: MyComponents.screenSize(context).width * 0.75,
  //     child: TextButton(
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Text(
  //           "Create Post",
  //           style: TextStyle(
  //               color: Color(0xff08003C), fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       style: TextButton.styleFrom(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           backgroundColor: Colors.white),
  //       onPressed: () {
  //         Post post = Post(
  //             title: title_controller.text,
  //             description: description_controller.text,
  //             salary_method: salaryMethod_controller.text,
  //             goals: goals_controller.text,
  //             qualifications_req: qualifications_req_controller.text,
  //             skills_req: skills_req_controller.text,
  //             max_users: int.tryParse(maxUsers_controller.text)!,
  //             isOpen: true,
  //             isCompanyRegistered: true,
  //             recordDate: DateTime.now().toString(),
  //             post_fk: Profile_sp_repo.get_profile()!.p_uid);

  //         BlocProvider.of<PostCudBloc>(context)
  //             .add(Post_create_onButtonPressed_Event(post));

  //         BlocProvider.of<MyPostsFetchBloc>(context)
  //             .add(MyPosts_Fetch_onInit_Event());
  //       },
  //     ),
  //   );
  // }

/* -------------------------------------------------------------------------- */
/*                              //@ Custom header                             */
/* -------------------------------------------------------------------------- */
  myHeaderTitle() {
    return Text(
      "Create Your Idea",
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
        fontSize: 30.0,
      ),
    );
  }

  headerDescription() {
    return Text(
      "Share your ideas with others",
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
        fontSize: 15.0,
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ About Idea Card                            */
/* -------------------------------------------------------------------------- */

  aboutIdeaCard() {
    return SizedBox(
        width: MyComponents.screenSize(context).width,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 189, 158, 255),
                Color.fromARGB(255, 45, 2, 202),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "About Idea",
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                child: Column(
                  children: [
                    customTextFieldUi(
                        title_controller, 'Give title to your idea'),
                    customTextFieldUi(
                        description_controller, 'Explain your idea'),
                    customTextFieldUi(goals_controller, 'Goals of your idea'),
                  ],
                ),
              )
            ]),
          ),
        ));
  }

  aboutTeamCard() {
    return SizedBox(
        width: MyComponents.screenSize(context).width,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 189, 158, 255),
                Color.fromARGB(255, 45, 2, 202),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "About Team",
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                child: Column(
                  children: [
                    customTextFieldUi(
                        salaryMethod_controller, 'Salary methods'),
                    customTextFieldUi(qualifications_req_controller,
                        'Qualifications required to join'),
                    customTextFieldUi(
                        skills_req_controller, 'Skills required to join'),
                    customTextFieldUi(
                        maxUsers_controller, 'Max number of users who can join',
                        isKbNumber: true),
                  ],
                ),
              )
            ]),
          ),
        ));
  }

  customTextFieldUi(
    controllerArg,
    String labelTextArg, {
    bool isKbNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: MyComponents.screenSize(context).height * 0.05,
        // width: MyComponents.screenSize(context).width,
        child: TextFormField(
          style: TextStyle(color: Colors.white, fontSize: 12),
          textAlignVertical: TextAlignVertical.center,
          cursorColor: Colors.white,
          textAlign: TextAlign.start,
          controller: controllerArg,
          keyboardType:
              isKbNumber ? TextInputType.number : TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            labelText: labelTextArg,
            //hint text here
            labelStyle: TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 219, 165, 255)),
            ),
          ),
        ),
      ),
    );
  }
}
