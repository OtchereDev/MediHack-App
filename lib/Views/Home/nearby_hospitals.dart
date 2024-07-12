import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Utils/utils.dart';
import 'package:emergency_alert/Views/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class NearbyHospital extends StatelessWidget {
  const NearbyHospital({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBack(title: "Nearby Hospital",),
            CustomDivider(),
            AppSpaces.height20,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Column(
                  
                  children: [
                   ...List.generate(5, (int)=>  HospitalTile())
                  ],
                ),
              ),
            )
        
          ],
        ),
      ),
    );
  }
}

class HospitalTile extends StatelessWidget {
  const HospitalTile({
    super.key,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.asset('assets/images/hospital.jpg', width: Utils.screenWidth(context)/2.8,),
              ),
              AppSpaces.width8,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("San Diego Medical Center", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                    AppSpaces.height4,
                    Text("S4077 Fifth Ave, San Diego, CA 92103, United States", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Distance: 19km", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                        Text("Phone: +1 858-832-2478", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                      ],
                    ),
                    Text("⭐⭐⭐⭐⭐ 4.5 / 5", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                  ],
                ),
              )
            ],
          ),
        ),
        AppSpaces.height8,
        CustomDivider(),
        AppSpaces.height8,

      ],
    );
  }
}

class CustomBack extends StatelessWidget {
  final String title;
  const CustomBack({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: Image.asset("assets/icons/back.png", width: 20,)),
          AppSpaces.width16,
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}