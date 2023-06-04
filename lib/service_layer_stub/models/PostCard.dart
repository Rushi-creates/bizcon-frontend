// import 'package:flutter/material.dart';

// class PostCard extends StatelessWidget {
//   final int? id;
//   final String? title;
//   final String? description;
//   final String? salary_method;
//   final String? goals;
//   final String? qualifications_req;
//   final String? skills_req;
//   final int? max_users;
//   final bool? isOpen;
//   final bool? isCompanyRegistered;
//   final String? recordDate;

//   const PostCard({
//     Key? key,
//     this.id,
//     this.title,
//     this.description,
//     this.salary_method,
//     this.goals,
//     this.qualifications_req,
//     this.skills_req,
//     this.max_users,
//     this.isOpen,
//     this.isCompanyRegistered,
//     this.recordDate,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Colors.purple.shade700,
//                 Colors.purple.shade500,
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       title ?? "Job Title",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Icon(
//                     Icons.bookmark_outline,
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Text(
//                 description ?? "Job Description",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.payments,
//                           color: Colors.white,
//                         ),
//                         SizedBox(width: 5),
//                         Text(
//                           salary_method ?? "Salary Method",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.person,
//                           color: Colors.white,
//                         ),
//                         SizedBox(width: 5),
//                         Text(
//                           max_users.toString(),
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(width: 5),
//                         Text(
//                           'Positions',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.location_on,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 5),
//                               Text(
//                                 'Location:',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             'Kathmandu, Nepal',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.work,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 5),
//                               Text(
//                                 'Experience:',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             '3+ Years',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.school,
//                               color: Colors.white,
//                             ),
//                             SizedBox(width: 5),
//                             Text(
//                               'Qualifications:',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           qualifications_req ?? "Qualification Requirements",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.star,
//                               color: Colors.white,
//                             ),
//                             SizedBox(width: 5),
//                             Text(
//                               'Skills:',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           skills_req ?? "Skills Requirements",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
