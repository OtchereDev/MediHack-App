import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Component/textformfield.dart';
import 'package:emergency_alert/Core/Helpers/navigation_helper.dart';
import 'package:emergency_alert/Core/app_constants.dart';
import 'package:emergency_alert/Utils/utils.dart';
import 'package:emergency_alert/Views/Ambulance/ampbulance_page.dart';
import 'package:emergency_alert/Views/Ambulance/mapview.dart';
import 'package:emergency_alert/Views/Ambulance/searching_nearest_ambulance.dart';
import 'package:emergency_alert/Views/FirstAidTutorials/first_aid_tutorial.dart';
import 'package:emergency_alert/Views/Home/nearby_hospitals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      FeatherIcons.mapPin,
                      color: AppColors.PRIMARYCOLOR,
                      size: 15,
                    ),
                    AppSpaces.width4,
                    Text(
                      "Mccarthy Hill",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    AppSpaces.width4,
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(messi),
                )
              ],
            ),
            AppSpaces.height4,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpaces.height16,
                  const Text(
                    "Welcome to Laebral Express",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                  const Text(
                    "Emergency help needed?",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                  TextFormWidget(
                    textController,
                    "",
                    false,
                    hint: "Search...",
                    icon: FeatherIcons.search,
                  ),
                  AppSpaces.height20,
                  AppSpaces.height16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeTabButton(
                        icon: "sos",
                        color: const Color(0xfff0cbcf),
                        textColor: AppColors.PRIMARYCOLOR,
                        title: "SOS",
                        isSVG: true,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const Dialog(
                                  child: SosDialogContainer(),
                                );
                              });
                        },
                      ),
                      HomeTabButton(
                        icon: "hospital",
                        color: const Color(0xff29044F),
                        textColor: const Color(0xff29044F),
                        title: "Nearby \nHospital",
                        onTap: () {
                          AppNavigationHelper.navigateToWidget(
                              context, const NearbyHospital());
                        },
                      ),
                    ],
                  ),
                  AppSpaces.height20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeTabButton(
                        icon: "first-aid",
                        color: const Color(0xff200D92),
                        textColor: const Color(0xff200D92),
                        title: "First Aid\nTutorials",
                        onTap: () {
                          AppNavigationHelper.navigateToWidget(
                              context, const FirstAidTutorial());
                        },
                      ),
                      const HomeTabButton(
                        icon: "911",
                        color: Color(0xff1DB63A),
                        title: "Emergency\nNumbers",
                        textColor: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SosDialogContainer extends StatelessWidget {
  const SosDialogContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.WHITE),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "-- Choose one --",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const CustomDivider(),
          ListTile(
            title: const Text("911"),
            leading: Image.asset(
              'assets/icons/emergency-call.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Ambulance"),
            leading: Image.asset(
              'assets/icons/ambulance.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: SearchingForNearestAmbulance(
                          title: "Ambulance",
                          onTap: () {
                            AppNavigationHelper.navigateToWidget(
                                context, AmbulanceScreen());
                          },
                        ));
                  });
            },
          ),
          ListTile(
            title: const Text("Fire Station"),
            leading: Image.asset(
              'assets/icons/firefighter.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: SearchingForNearestAmbulance(
                          title: "Fire Station",
                          onTap: () {
                            AppNavigationHelper.navigateToWidget(
                                context, AmbulanceScreen());
                          },
                        ));
                  });
            },
          ),
          ListTile(
            title: const Text("Police"),
            leading: Image.asset(
              'assets/icons/police.png',
              height: 30,
              width: 30,
            ),
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: SearchingForNearestAmbulance(
                          title: "Police Station",
                          onTap: () {
                            AppNavigationHelper.navigateToWidget(
                                context, AmbulanceScreen());
                          },
                        ));
                  });
            },
          ),
          AppSpaces.height20
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 0.5,
      color: Colors.black26,
    );
  }
}

class HomeTabButton extends StatelessWidget {
  final Color color, textColor;
  final String title;
  final VoidCallback? onTap;
  final bool isSVG;
  final String icon;
  const HomeTabButton(
      {super.key,
      required this.color,
      required this.title,
      this.onTap,
      required this.icon,
      required this.textColor,
      this.isSVG = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Utils.screenWidth(context) / 2.4,
        width: Utils.screenWidth(context) / 2.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color.withOpacity(0.2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSVG
                ? SvgPicture.asset(
                    "assets/icons/$icon.svg",
                    height: 60,
                    width: 60,
                  )
                : Image.asset(
                    "assets/icons/$icon.png",
                    height: 60,
                    width: 60,
                  ),
            AppSpaces.height16,
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
