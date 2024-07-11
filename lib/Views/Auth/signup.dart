import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Component/passwordField.dart';
import 'package:emergency_alert/Component/textformfield.dart';
import 'package:emergency_alert/Core/Helpers/navigation_helper.dart';
import 'package:emergency_alert/Core/app_constants.dart';
import 'package:emergency_alert/Views/Auth/login.dart';
import 'package:emergency_alert/Views/GetStarted/getstarted.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});
   final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.WHITE,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(logo, scale: 3,)),
              const Text("Sign Up", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: AppColors.PRIMARYCOLOR),),
              AppSpaces.height8,
              const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),),
             
             AppSpaces.height20,
              TextFormWidget(textController, "Name", false, hint: "Enter name",),
              AppSpaces.height20,
              TextFormWidget(textController, "Email", false, hint: "Enter email",),
              AppSpaces.height20,
              PasswordField(hintText: "Enter Password",title: "Password", controller: textController, validateMsg: "validateMsg", inputType: TextInputType.text),
               AppSpaces.height40,
              SizedBox(
                width: double.infinity,
                child: CustomButton(title: "Sign up", color: AppColors.PRIMARYCOLOR, onTap: (){},)),
                const Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      AppNavigationHelper.navigateToWidget(context, LoginPage());
                    },
                    child: RichText(text: const TextSpan(children: [
                      TextSpan(text: "Sign In", style: TextStyle(color: AppColors.PRIMARYCOLOR, decoration: TextDecoration.underline))
                    
                    ], text: "Already have an account? ", style: TextStyle(color: AppColors.BLACK))),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}