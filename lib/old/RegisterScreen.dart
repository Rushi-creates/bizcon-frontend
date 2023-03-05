// import 'package:bizcon1/AUTH/Login/LoginScreen.dart';
// import 'package:bizcon1/AUTH/Register/OtpScreen.dart';
// import 'package:bizcon1/MODULES/COMMON/myComponents.dart';
// import 'package:flutter/material.dart';

// //to change class name = right click on className> Rename symbol
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);

//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
// /* -------------------------------------------------------------------------- */
// /*                               //@ controllers                              */
// /* -------------------------------------------------------------------------- */

//   TextEditingController phoneController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   //@
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
//         child: Container(
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           // mainAxisAlignment: MainAxisAlignment.center,

//           children: [
//             MyComponents.buildTextField(phoneController, 'Enter phone number'),
//             MyComponents.buildTextField(emailController, 'Enter email'),
//             MyComponents.buildTextField(passwordController, 'Enter password'),
//             SizedBox(height: 20),

//             //
//             TextButton(
//               child: Text(
//                 "    Send OTP    ",
//                 style: TextStyle(color: Colors.white),
//               ),
//               style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return OtpScreen();
//                 }));
//               },
//             ),
//           ],
//         ),
//       ),
//     ));
//   }

//   AppBar myHeader() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       // elevation: 0.0,
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
//         'Home', //give here appBar title
//         style: TextStyle(color: Colors.black
//             // fontWeight: FontWeight.bold
//             // fontSize: 15,
//             ),
//       ),
//       actions: [
//         TextButton(
//           child: Text(
//             "Login",
//             style: TextStyle(color: Colors.white),
//           ),
//           style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
//           onPressed: () {
//             Navigator.pushReplacement(context,
//                 MaterialPageRoute(builder: (context) {
//               return LoginScreen();
//             }));
//           },
//         ),
//         // Padding(
//         //   padding: const EdgeInsets.all(8.0),
//         //   child: IconButton(
//         //       onPressed: null,
//         //       icon: Icon(
//         //         Icons.search,
//         //         color: Colors.black,
//         //       )),
//         // )
//       ],
//     );
//   }
// }
