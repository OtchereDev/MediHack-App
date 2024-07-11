import 'package:emergency_alert/AppTheme/app_config.dart';
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
      title: "Find Best Musicians All Around Your City",
      description:
          "Thousands of musicians around you are waiting to rock your event.",
    ),
    OnBoard(
      // image: "assets/images/doc.png",
      title: "Fastest Way To Book Great Musicians",
      description:
          "Find the perfect match to perform for your event and make the day remarkable.",
    ),
    OnBoard(
      // image: "assets/images/attention.png",
      title: "Find Top Sessions Pros For Your Event",
      description:
          "Find the perfect match to perform for your event and make the day remarkable.",
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
                onPressed: () {},
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
                  children: [
                    const Spacer(),
                    const Spacer(),
                    CommonText(
                      text: demoData[index].title,
                      fontSize: 35,
                      color: AppColors.WHITE,
                    ),
                    AppSpaces.height16,
                    CommonText(
                      text: demoData[index].description,
                      color: AppColors.WHITE,
                      fontSize: 20,
                    ),
                    const Spacer(),
                  ],
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom:20.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      title: "Get Started",
                      color: AppColors.PRIMARYCOLOR,
                      onTap: () {},
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
