import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Views/Home/home_page.dart';
import 'package:emergency_alert/Views/Home/nearby_hospitals.dart';
import 'package:flutter/material.dart';

class FirstAidTutorial extends StatelessWidget {
  const FirstAidTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.BACKREDCOLOR,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBack(
              title: "First Aid",
            ),
            CustomDivider(),
             AppSpaces.height40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FirstAidTab(icon: "cpr",title: "CPR & AEDs",),
                FirstAidTab(icon: "bleeding",title: "Bleeding",),
                FirstAidTab(icon: "choking_1821008",title: "Chocking",),
             
              ],
            ),
             AppSpaces.height40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              FirstAidTab(icon: "burning-house",title: "Burns",),
                FirstAidTab(icon: "crutches",title: "Broken Bone",),
                FirstAidTab(icon: "choking_1821008",title: "Nosebleeds",),
              ],
            ),
             AppSpaces.height40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              FirstAidTab(icon: "burning-house",title: "Heart Attack",),
                FirstAidTab(icon: "crutches",title: "Poisoning",),
                FirstAidTab(icon: "choking_1821008",title: "Shock",),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FirstAidTab extends StatelessWidget {
  final String title, icon;
  final VoidCallback? onTap;
  const FirstAidTab({
    super.key, required this.title, required this.icon, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/icons/$icon.png", height: 70,width: 70,),
        Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
      ],
    );
  }
}
