import 'package:emergency_alert/Views/Home/home_page.dart';
import 'package:emergency_alert/Views/Home/nearby_hospitals.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class MyContacts extends StatelessWidget {
  const MyContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
              CustomBack(title: "My Emergency Contact", hasBack: false,),
                  CustomDivider(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:20.0),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(FeatherIcons.user),
                            title: Text("Father"),
                            subtitle: Text("0541555505"),
                            trailing: IconButton(onPressed: (){}, icon: Icon(FeatherIcons.phone)),
                          )
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