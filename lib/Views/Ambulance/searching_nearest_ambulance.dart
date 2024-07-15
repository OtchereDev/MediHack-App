import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Provider/Ambulance/ampbulance_provider.dart';
import 'package:emergency_alert/Views/Ambulance/mapview.dart';
import 'package:emergency_alert/Views/GetStarted/getstarted.dart';
import 'package:emergency_alert/Views/Maps/myLocation_map.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SearchingForNearestAmbulance extends StatefulWidget {
  final VoidCallback? onTap;
  final String title;
  const SearchingForNearestAmbulance(
      {super.key, this.onTap, required this.title});

  @override
  State<SearchingForNearestAmbulance> createState() =>
      _SearchingForNearestAmbulanceState();
}

class _SearchingForNearestAmbulanceState
    extends State<SearchingForNearestAmbulance> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context
          .read<AmbulanceStatusProvider>()
          .searchAmbulance(context, {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AmbulanceStatusProvider>(builder: (context, ambulance, _) {
        return Stack(
          children: [
            MyLocationMap(),
            ambulance.loadingRide
                ? Container(
                    color: Colors.transparent,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: LottieBuilder.asset(
                          'assets/images/searching.json',
                        ),
                      ),
                    )),
                  )
                : SizedBox.shrink(),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.WHITE,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppSpaces.height20,

                     ambulance.loadingRide ?  Text(
                        "Searching for nearest available ${widget.title}",
                        style: const TextStyle(fontSize: 17),
                      ): SizedBox.shrink(),
                      Text("${ambulance.rideSearchResponse?.msg}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                      AppSpaces.height20,
                      Text("Making request for a/an ${widget.title}, please wait", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                      AppSpaces.height20,
                      AppSpaces.height20,


                    ],
                  ),
                ))
          ],
        );
      }),
    );
  }
}
