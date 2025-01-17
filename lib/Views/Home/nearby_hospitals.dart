import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Component/image_viewer.dart';
import 'package:emergency_alert/Model/Response/hospital_response.dart';
import 'package:emergency_alert/Provider/Ambulance/ampbulance_provider.dart';
import 'package:emergency_alert/Utils/Loaders/loader_utils.dart';
import 'package:emergency_alert/Views/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class NearbyHospital extends StatefulWidget {
  const NearbyHospital({super.key});

  @override
  State<NearbyHospital> createState() => _NearbyHospitalState();
}

class _NearbyHospitalState extends State<NearbyHospital> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      context.read<AmbulanceStatusProvider>().getNearestHospital(context, const LatLng(51.564699, -0.248392));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Consumer<AmbulanceStatusProvider>(
          builder: (context, emergency, _) {
            return emergency.loadingPage ? const LoadingPage() : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBack(title: "Nearby Hospital",),
                const CustomDivider(),
                AppSpaces.height20,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        
                        children: [
                         ...List.generate(emergency.hospitalResponse?.hospitals?.length ?? 0, (index)=>  HospitalTile(hos: emergency.hospitalResponse!.hospitals![index],))
                        ],
                      ),
                    ),
                  ),
                )
            
              ],
            );
          }
        ),
      ),
    );
  }
}

class HospitalTile extends StatelessWidget {
  final  Hospital hos;
  const HospitalTile({
    super.key, required this.hos,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // decoration: BoxDecoration(
           
          // ),
          child: Row(
            children: [
              ImageViewer(url: context.read<AmbulanceStatusProvider>().getImageLink((hos.photos!.isNotEmpty ? hos.photos![0].photoReference : ""))),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(3),
              //   child: Image.asset('assets/images/hospital.jpg', width: Utils.screenWidth(context)/2.8,),
              // ),
              AppSpaces.width8,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${hos.name}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                    AppSpaces.height4,
                    Text("${hos.vicinity}", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Open: ${(hos.openingHours?.openNow == true ? "Yes" : "No")}", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                        const Text("Phone: +1 858-832-2478", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                      ],
                    ),
                    Text("⭐⭐⭐⭐⭐ ${hos.rating ?? 0}", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                  ],
                ),
              )
            ],
          ),
        ),
        AppSpaces.height8,
        const CustomDivider(),
        AppSpaces.height8,

      ],
    );
  }
}

class CustomBack extends StatelessWidget {
  final String title;
  final bool hasBack;
  const CustomBack({
    super.key, required this.title,
    this.hasBack = true
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:20.0,right: 20 ,top: Platform.isIOS ?0 : 20, bottom: 10 ),
      child: Row(
        children: [
        hasBack ?  GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: Image.asset("assets/icons/back.png", width: 20,)) : const SizedBox.shrink(),
          hasBack ?  AppSpaces.width16  : const SizedBox.shrink(),
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}