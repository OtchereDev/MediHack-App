// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:spectra_health/AppTheme/app_config.dart';
// import 'package:spectra_health/Component/image_viewer.dart';
// import 'package:spectra_health/Provider/Appointment/appointment_provider.dart';

// class CarouselPage extends StatefulWidget {
//   const CarouselPage({super.key});

//   @override
//   State<CarouselPage> createState() => _CarouselPageState();
// }

// class _CarouselPageState extends State<CarouselPage> {

//     @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<AppointmentProvider>(context, listen: false)
//           .getAnnouncements(context);
//     });
//     super.initState();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppointmentProvider>(builder: (context,appoint, _ ) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Accouncement",
//             style: GoogleFonts.raleway(fontWeight: FontWeight.w600),
//           ),
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 160.0,
//               aspectRatio: 3.0,
//               enlargeCenterPage: true,
//               scrollDirection: Axis.horizontal,
//               viewportFraction: 1.0,
//               autoPlay: true,
              
//             ),
//             items: appoint.announcement.map((index) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return Padding(
//                     padding: const EdgeInsets.only(left: 8.0, top: 10),
//                     child: GestureDetector(
//                       onTap: () {
//                         Get.dialog(Dialog(
//                           child: Container(
//                               decoration: BoxDecoration(
//                                   color: AppColors.WHITE,
//                                   borderRadius: BorderRadius.circular(12)),
//                               // height: Utils.screenHeight(context) - 250,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.only(
//                                         topRight: Radius.circular(12),
//                                         topLeft: Radius.circular(12)),
//                                     child: FadeInImage(
//                                         placeholder: AssetImage(
//                                             'assets/images/placeholder.jpg'),
//                                         image: NetworkImage(
//                                             '${index.image}')),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(15.0),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         index.title.isEmpty
//                                             ? SizedBox.shrink()
//                                             : Text(
//                                                 "${index.title}",
//                                                 style: GoogleFonts.raleway(
//                                                     color: AppColors.BLACK,
//                                                     fontSize: 20,
//                                                     fontWeight: FontWeight.bold),
//                                               ),
//                                         index.message.isEmpty
//                                             ? SizedBox.shrink()
//                                             : Text(
//                                                 "${index.message}",
//                                                 style: GoogleFonts.ptSans(
//                                                     color: AppColors.BLACK,
//                                                     fontSize: 14),
//                                               ),
//                                         index.title.isEmpty
//                                             ? SizedBox.shrink()
//                                             : AppSpaces.height16,
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               )),
//                         ));
//                       },
//                       child: Container(
//                         height: 140,
//                         width: double.infinity,
//                         child: Stack(
//                           children: [
//                             ImageViewer(
//                                 url: '${index.image}'),
//                             Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   gradient: LinearGradient(
//                                       colors: [
//                                         Colors.transparent,
//                                         Colors.black.withOpacity(0.6),
//                                       ],
//                                       begin: Alignment.topCenter,
//                                       end: Alignment.bottomCenter)),
//                             ),
//                             Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       // Text(
//                                       //   "${index.title}",
//                                       //   style: TextStyle(
//                                       //       color: AppColors.WHITE,
//                                       //       fontSize: 20,
//                                       //       fontWeight: FontWeight.bold),
//                                       // ),
//                                       // AppSpaces.height16,
//                                       // Text(
//                                       //   "${index.message}",
//                                       //   style: GoogleFonts.ptSans(
//                                       //       color: AppColors.WHITE, fontSize: 14),
//                                       // ),
//                                     ],
//                                   ),
//                                 ))
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//           ),
//         ],
//       );
//     });
//   }
// }
