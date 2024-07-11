import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Component/passwordField.dart';
import 'package:emergency_alert/Component/textformfield.dart';
import 'package:emergency_alert/Core/Helpers/navigation_helper.dart';
import 'package:emergency_alert/Core/app_constants.dart';
import 'package:emergency_alert/Views/Auth/signup.dart';
import 'package:emergency_alert/Views/GetStarted/getstarted.dart';
import 'package:emergency_alert/Views/Home/index.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
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
              const Text("Login", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: AppColors.PRIMARYCOLOR),),
              AppSpaces.height8,
              const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),),
             
             AppSpaces.height20,
              TextFormWidget(textController, "Email", false, hint: "Enter email",),
              AppSpaces.height20,
              PasswordField(hintText: "Enter Password",title: "Password", controller: textController, validateMsg: "validateMsg", inputType: TextInputType.text),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(onPressed: (){}, child: const Text("Forgot Password", style: TextStyle(color: AppColors.PRIMARYCOLOR),))),
              AppSpaces.height40,
              SizedBox(
                width: double.infinity,
                child: CustomButton(title: "Login", color: AppColors.PRIMARYCOLOR, onTap: (){
                  AppNavigationHelper.navigateToWidget(context, BaseHomePage());
                },)),
                const Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      AppNavigationHelper.navigateToWidget(context, SignupPage());
                    },
                    child: RichText(text: const TextSpan(children: [
                      TextSpan(text: "Sign Up", style: TextStyle(color: AppColors.PRIMARYCOLOR, decoration: TextDecoration.underline))
                    
                    ], text: "Dont have an account? ", style: TextStyle(color: AppColors.BLACK))),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}