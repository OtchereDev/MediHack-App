import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Views/Home/home_page.dart';
import 'package:emergency_alert/Views/Home/nearby_hospitals.dart';
import 'package:emergency_alert/Widgets/call_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BaseHomePage extends StatefulWidget {
  final int? initialIdex;
  const BaseHomePage({super.key, this.initialIdex});

  @override
  State<BaseHomePage> createState() => _BaseHomePageState();
}

class _BaseHomePageState extends State<BaseHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.initialIdex ?? 0;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      Text("data"),
      Text("data"),
      NearbyHospital(),
    ];
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      floatingActionButton:  Padding(
        padding: const EdgeInsets.only(bottom:4.0),
        child: CallButton()
      ),
      floatingActionButtonLocation : FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        onTap: _onItemTapped,
        
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon:
                SizedBox(width: 23, height: 23, child: Icon(FeatherIcons.home)),
            icon:
                SizedBox(width: 23, height: 23, child: Icon(FeatherIcons.home)),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
         
              child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(FeatherIcons.mapPin)),
            ),
            label: ('Appointments'),
          ),
           BottomNavigationBarItem(
            icon: SizedBox(
         
              child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Container(height: 30,width: 30,)),
            ),
                 label: ('Appointments'),
          ),
          BottomNavigationBarItem(
            icon:
                SizedBox(width: 23, height: 23, child: Icon(FeatherIcons.user)),
            label: ('Contacts'),
          ),
          BottomNavigationBarItem(
            icon:
                SizedBox(width: 23, height: 23, child: Icon(FeatherIcons.settings)),
            label: ('Settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.PRIMARYCOLOR,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        
      ),
    );
  }
}
