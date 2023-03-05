// import 'package:flutter/material.dart';

// //to change class name = right click on className> Rename symbol
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
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
//       child: Center(child: Text('Hello world')),
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
