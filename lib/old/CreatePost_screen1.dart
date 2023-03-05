// import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
// import 'package:bizcon1/MODULES/Splash_stub/SplashScreen.dart';
// import 'package:bizcon1/Repo/Profile_repo.dart';
// import 'package:bizcon1/service_layer_stub/models/Post.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../PROFILE/__MyPosts_fetch_stub__/MyPosts_fetch_logic/MyPosts_fetch_bloc.dart';
// import 'Post_cud_logic/Post_cud_bloc.dart';

// //to change class name = right click on className> Rename symbol
// class CreatePostScreen1 extends StatefulWidget {
//   const CreatePostScreen1({Key? key}) : super(key: key);

//   @override
//   _CreatePostScreen1State createState() => _CreatePostScreen1State();
// }

// class _CreatePostScreen1State extends State<CreatePostScreen1> {
// /* -------------------------------------------------------------------------- */
// /*                               //@ Controllers                              */
// /* -------------------------------------------------------------------------- */

//   TextEditingController title_controller = TextEditingController();
//   TextEditingController description_controller = TextEditingController();
//   TextEditingController salaryMethod_controller = TextEditingController();
//   TextEditingController goals_controller = TextEditingController();
//   TextEditingController qualifications_req_controller = TextEditingController();
//   TextEditingController skills_req_controller = TextEditingController();
//   TextEditingController maxUsers_controller = TextEditingController();

// /* -------------------------------------------------------------------------- */
// /*                                  //@ build                                 */
// /* -------------------------------------------------------------------------- */

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // resizeToAvoidBottomInset: false,
//       appBar: myHeader(),
//       body: myBody(),
//     );
//   }

//   myBody() {
//     return SafeArea(
//         child: SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 10),
//               MyComponents.buildTextField(
//                   title_controller, 'Give title to your idea'),
//               MyComponents.buildTextField(
//                   description_controller, 'Explain your idea'),
//               MyComponents.buildTextField(
//                   salaryMethod_controller, 'Salary methods'),
//               MyComponents.buildTextField(
//                   goals_controller, 'Goals of your idea'),
//               MyComponents.buildTextField(qualifications_req_controller,
//                   'Qualifications required to join'),
//               MyComponents.buildTextField(
//                   skills_req_controller, 'Skills required to join'),
//               MyComponents.buildTextField(
//                   maxUsers_controller, 'Max number of users who can join',
//                   isKbNumber: true),
//               SizedBox(height: 20),
//               createPost_STATES()
//             ],
//           ),
//         ),
//       ),
//     ));
//   }

//   createPost_STATES() {
//     return BlocConsumer<PostCudBloc, PostCudState>(
//       listener: (context, state) async {
//         if (state is Post_create_Loaded_State) {
//           Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) {
//             return SplashScreen();
//           }));
//         }
//       },
//       builder: (context, state) {
//         if (state is Post_create_Loading_State) {
//           return MyComponents.buildLoading();
//         } else if (state is Post_create_Error_State) {
//           return Column(
//             children: [
//               createPostButton(),
//               SizedBox(height: 5),
//               Text('${state.error}')
//             ],
//           );
//         }
//         return createPostButton();
//       },
//     );
//   }

//   createPostButton() {
//     return SizedBox(
//       width: MyComponents.screenSize(context).width,
//       child: TextButton(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             "   CREATE POST   ",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         style: TextButton.styleFrom(backgroundColor: Colors.black),
//         onPressed: () {
//           Post post = Post(
//               title: title_controller.text,
//               description: description_controller.text,
//               salary_method: salaryMethod_controller.text,
//               goals: goals_controller.text,
//               qualifications_req: qualifications_req_controller.text,
//               skills_req: skills_req_controller.text,
//               max_users: int.tryParse(maxUsers_controller.text)!,
//               isOpen: true,
//               isCompanyRegistered: true,
//               recordDate: DateTime.now().toString(),
//               post_fk: Profile_sp_repo.get_profile()!.p_uid);

//           BlocProvider.of<PostCudBloc>(context)
//               .add(Post_create_onButtonPressed_Event(post));

//           BlocProvider.of<MyPostsFetchBloc>(context)
//               .add(MyPosts_Fetch_onInit_Event());
//         },
//       ),
//     );
//   }

//   AppBar myHeader() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       elevation: 0.0,
//       //leading: IconButton(
//       //  icon: Icon(
//       //   Icons.arrow_back,
//       //   color: Colors.black,
//       //   ),
//       //   onPressed: (){
//       //       Navigator.pop(context);
//       //   }
//       // ),
//       // automaticallyImplyLeading: true,  //removes default back arrow on appbar

//       title: Text(
//         'Create Post', //give here appBar title
//         style: TextStyle(
//           color: Colors.black,
//           // fontWeight: FontWeight.bold
//           fontSize: 22,
//         ),
//       ),
//       //actions: [

//       //  Padding(
//       //    padding: const EdgeInsets.all(8.0),
//       //   child: IconButton(
//       //       onPressed: null,
//       //       icon: Icon(
//       //         Icons.search,
//       //         color: Colors.black,
//       //       )), )
//       // ],
//     );
//   }
// }
