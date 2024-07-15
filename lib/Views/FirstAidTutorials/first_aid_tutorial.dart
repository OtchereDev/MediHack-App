import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Core/Helpers/navigation_helper.dart';
import 'package:emergency_alert/Views/Chat/chat_gpt.dart';
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
                FirstAidTab(icon: "cpr",title: "CPR & AEDs",onTap: (){
                  AppNavigationHelper.navigateToWidget(context, ChatPage(title: "CPR & AEDs",));
                },),
                FirstAidTab(icon: "bleeding",title: "Bleeding",onTap: (){
                  AppNavigationHelper.navigateToWidget(context, ChatPage(title: "Bleeding",));

                },),
                FirstAidTab(icon: "choking_1821008",title: "Chocking",onTap: (){
                  AppNavigationHelper.navigateToWidget(context, ChatPage(title: "Chocking",));

                },),
             
              ],
            ),
             AppSpaces.height40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              FirstAidTab(icon: "burning-house",title: "Burns",onTap: (){
                  AppNavigationHelper.navigateToWidget(context, ChatPage(title: "Burns",));
              
              },),
                FirstAidTab(icon: "crutches",title: "Broken Bone",onTap: (){
                  AppNavigationHelper.navigateToWidget(context, ChatPage(title: "Broken Bone",));
              
              },),
                FirstAidTab(icon: "choking_1821008",title: "Nosebleeds",onTap: (){
                  AppNavigationHelper.navigateToWidget(context, ChatPage(title: "Nosebleeds",));
              
              },),
              ],
            ),
             AppSpaces.height40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              FirstAidTab(icon: "burning-house",title: "Heart Attack",onTap: (){
                  AppNavigationHelper.navigateToWidget(context, ChatPage(title: "Heart Attack",));
              
              },),
                FirstAidTab(icon: "crutches",title: "Poisoning",onTap: (){
                  AppNavigationHelper.navigateToWidget(context, ChatPage(title: "Poisoning",));
              
              },),
                FirstAidTab(icon: "choking_1821008",title: "Others",onTap: (){
                  AppNavigationHelper.navigateToWidget(context, ChatPage(title: "Others",));
              
              },),
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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset("assets/icons/$icon.png", height: 70,width: 70,),
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
