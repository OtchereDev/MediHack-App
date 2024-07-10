// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:oya_passenger/AppTheme/app_config.dart';

// class AppShowCaseUtil {
//   static void showCase(BuildContext context, {Function? nextAction}) async {
//     showDialog(
//         context: context,
//         builder: (BuildContext alertDialogContext) {
//           return AlertDialog(
//             content: SizedBox(
//               height: 380,
//               child: Column(children: [
//                 const Text('Welcome',
//                     textAlign: TextAlign.center,
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
//                 AppSpaces.height16,
//                 Container(
//                   width: 200,
//                   height: 204,
//                   alignment: Alignment.center,
//                   child: Lottie.asset(
//                     'assets/congrats.json',
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(top: 4.0, bottom: 16.0),
//                   child: Text(
//                     "Let's give you a quick tour of major features.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: TextButton(
//                             style: TextButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 side: BorderSide(
//                                   color: AppColors.primaryColor,
//                                   width: 1.0,
//                                 ),
//                                 borderRadius: BorderRadius.circular(4.0),
//                               ),
//                             ),
//                             child: Text(
//                               'Okay',
//                               style: TextStyle(color: AppColors.primaryColor),
//                             ),
//                             onPressed: () {
//                               Navigator.pop(alertDialogContext);
//                               nextAction!();
//                             }),
//                       ),
//                       Expanded(
//                         child: Container(
//                           // height: 40,
//                           margin: const EdgeInsets.only(left: 16.0),
//                           child: TextButton(
//                             style: TextButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 side: BorderSide(
//                                     color: AppColors.primaryColor, width: 1.0),
//                                 borderRadius: BorderRadius.circular(4.0),
//                               ),
//                             ),
//                             child: Text(
//                               'Cancel',
//                               style: TextStyle(color: AppColors.primaryColor),
//                             ),
//                             onPressed: () => Navigator.pop(alertDialogContext),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ]),
//             ),
//           );
//         });
//   }
// }
