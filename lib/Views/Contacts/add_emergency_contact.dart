import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Component/phoneNumberText.dart';
import 'package:emergency_alert/Component/textformfield.dart';
import 'package:emergency_alert/Provider/Profile/profile_provider.dart';
import 'package:emergency_alert/Utils/Loaders/loader_utils.dart';
import 'package:emergency_alert/Utils/formatters.dart';
import 'package:emergency_alert/Views/Contacts/country_select_city.dart';
import 'package:emergency_alert/Views/GetStarted/getstarted.dart';
import 'package:emergency_alert/Views/Home/home_page.dart';
import 'package:emergency_alert/Views/Home/nearby_hospitals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddEmergencyContact extends StatelessWidget {
  AddEmergencyContact({super.key});
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKREDCOLOR,
      body: SafeArea(
        child: Consumer<ProfileProvider>(builder: (context, profile, _) {
          return profile.isLoading
              ? LoadingPage()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomBack(
                      title: "Add Emergency Contact",
                      hasBack: true,
                    ),
                    const CustomDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSpaces.height16,
                              TextFormWidget(
                                nameController,
                                "Fullname",
                                false,
                                hint: 'Enter full name',
                                validate: true,
                                validateMsg: 'Name is required',
                              ),
                              AppSpaces.height20,
                              TextFormWidget(
                                addressController,
                                "Address",
                                true,
                                hint: 'Enter address',
                                validate: true,
                                validateMsg: 'Address is required',
                                onTap: (){
                                  showModalBottomSheet(context: context, builder: (context){
                                    return SearchCommunityBottomSheet(title: "Address", onData: (val){
                                      addressController.text = (val['description']);
                                    },);
                                  });
                                },
                              ),
                              AppSpaces.height20,
                              Text(
                                "Phone Number",
                                style: GoogleFonts.raleway(
                                    color: AppColors.HEADINGCOLOR,
                                    fontSize: 17),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PhoneNumberTextField(
                                controller: phoneController,
                                hintText: 'Enter number',
                              
                              ),
                              AppSpaces.height40,
                              AppSpaces.height40,
                              AppSpaces.height40,
                              SizedBox(
                                  width: double.infinity,
                                  child: CustomButton(
                                    title: 'Save',
                                    color: AppColors.PRIMARYCOLOR,
                                    onTap: () async {
                                      if (formKey.currentState?.validate() ==
                                          true) {
                                       await profile
                                            .addConact(
                                                context,
                                                nameController.text,
                                                addressController.text,
                                                Formatters.formatToInternationNumber(countryCode, phoneController.text))
                                            .then((val) {
                                          if (val == true) {
                                            Navigator.pop(context, true);
                                          }
                                        });
                                      }
                                    },
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
        }),
      ),
    );
  }
}
