import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Core/Helpers/navigation_helper.dart';
import 'package:emergency_alert/Views/Auth/login.dart';
import 'package:emergency_alert/Views/GetStarted/getstarted.dart';
import 'package:emergency_alert/Views/Onboarding/onboard_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  }

  final List<OnBoard> demoData = [
    OnBoard(
      // image: "assets/images/attention.png",
      title: "Familiarize Yourself with the SOS Button",
      description:
          "The SOS button is your lifeline. Press and hold it in case of an emergency to send an instant alert to your emergency contacts and local authorities.",
    ),
    OnBoard(
      // image: "assets/images/doc.png",
      title: "Explore Safety Features",
      description:
          "Real-Time Tracking: Let your loved ones track your location in real-time when you feel unsafe.",
    ),
    OnBoard(
      // image: "assets/images/attention.png",
      title: "Share with Loved Ones",
      description:
          "Your safety is our mission. With Laerdal Express, you’re never alone in an emergency. Let’s get started and stay safe together!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: Stack(
        children: [
          GetStarted(),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: TextButton(
                child: Text("Skip", style: TextStyle(color: AppColors.PRIMARYCOLOR),),
                onPressed: () {
                        AppNavigationHelper.navigateToWidget(context, LoginPage());

                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: PageView.builder(
              itemCount: demoData.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                currentPage = index;
                setState(() {});
              },
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Spacer(),
                    CommonText(
                      text: demoData[index].title,
                      fontSize: 25,
                      color: AppColors.WHITE,
                      isHeader: true,
                    ),
                    AppSpaces.height16,
                    CommonText(
                      text: demoData[index].description,
                      color: AppColors.WHITE,
                      fontSize: 15,
                      isHeader: false,
                    ),
                    AppSpaces.height40,
                    AppSpaces.height40,
                    AppSpaces.height40,
                    AppSpaces.height40,
                    // const Spacer(),
                  ],
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom:40.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      title: currentPage == 2 ?  "Get Started" : "Next",
                      color: AppColors.PRIMARYCOLOR,
                      onTap: () {
                        if(currentPage == 2){

                        AppNavigationHelper.navigateToWidget(context, LoginPage());
                        }else{

                        }
                      },
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 20,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        demoData.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 5,
                          width: currentPage == index
                              ? 15
                              : 5, // Adjust the size of the active dot
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? Colors.red
                                : Colors
                                    .grey, // Adjust active and inactive dot colors
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
