import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Core/Helpers/navigation_helper.dart';
import 'package:emergency_alert/Provider/Profile/profile_provider.dart';
import 'package:emergency_alert/Utils/Loaders/loader_utils.dart';
import 'package:emergency_alert/Views/Contacts/add_emergency_contact.dart';
import 'package:emergency_alert/Views/Home/home_page.dart';
import 'package:emergency_alert/Views/Home/nearby_hospitals.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyContacts extends StatefulWidget {
  const MyContacts({super.key});

  @override
  State<MyContacts> createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().getMyContact(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ProfileProvider>(builder: (context, profile, _) {
          return profile.isLoading
              ? const LoadingPage()
              : Column(
                  children: [
                    const CustomBack(
                      title: "My Emergency Contact",
                      hasBack: false,
                    ),
                    const CustomDivider(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            ...List.generate(
                                profile.emergencyContact.response?.contacts
                                        ?.length ??
                                    0, (index) {
                              var data = profile
                                  .emergencyContact.response?.contacts?[index];
                              return Column(
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: const CircleAvatar(
                                      backgroundColor: AppColors.PRIMARYCOLOR,
                                      child: Icon(
                                        FeatherIcons.user,
                                        color: AppColors.WHITE,
                                      ),
                                    ),
                                    title: Text("${data?.name}"),
                                    subtitle: Text(
                                        "${data?.address}  (${data?.phone})"),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.phone)),
                                  ),
                                  const CustomDivider()
                                ],
                              );
                            })
                          ],
                        ),
                      ),
                    )
                  ],
                );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isSuccess = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddEmergencyContact()));
          if (isSuccess == true) {
            context.read<ProfileProvider>().getMyContact(context);
          }
        },
        child: const Icon(
          Icons.add,
          color: AppColors.WHITE,
        ),
        backgroundColor: AppColors.PRIMARYCOLOR,
        shape: const CircleBorder(),
      ),
    );
  }
}
