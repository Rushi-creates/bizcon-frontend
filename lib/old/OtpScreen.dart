// import 'package:bizcon1/MODULES/CREATE_PROFILE/CreateProfileScreen.dart';
// import 'package:flutter/material.dart';

// import '../../COMMON/myComponents.dart';

// //to change class name = right click on className> Rename symbol
// class OtpScreen extends StatefulWidget {
//   const OtpScreen({Key? key}) : super(key: key);

//   @override
//   _OtpScreenState createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   //@ controller
//   TextEditingController otpController = TextEditingController();

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
//             MyComponents.buildTextField(otpController, 'Enter OTP '),
//             SizedBox(height: 20),

// /* -------------------------------------------------------------------------- */
// /*                                     //@                                    */
// /* -------------------------------------------------------------------------- */
//             TextButton(
//               child: Text(
//                 "    Verify otp and Register    ",
//                 style: TextStyle(color: Colors.white),
//               ),
//               style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
//               onPressed: () {
//                 BlocProvider.of<GAuthBloc>(context).add(GAuth_login_Event());
//               },
//             ),

// /* -------------------------------------------------------------------------- */
// /*                                     //@                                    */
// /* -------------------------------------------------------------------------- */

//             authButton_STATES(),
//           ],
//         ),
//       ),
//     ));
//   }

//   authButton_STATES() {
//     return BlocConsumer<GAuthBloc, GAuthState>(
//       listener: (context, state) {
//         if (state is GAuth_login_success_state) {
//           Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) {
//             return SplashScreen();
//           }));
//         }
//       },
//       builder: (context, state) {
//         if (state is GAuth_login_loading_state) {
//           return Text('please wait..');
//         } else if (state is GAuth_login_failure_state) {
//           return Text('Some Error Try again');
//         }
//         return Text('');
//       },
//     );
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
