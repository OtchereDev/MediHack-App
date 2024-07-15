import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Component/passwordField.dart';
import 'package:emergency_alert/Component/textformfield.dart';
import 'package:emergency_alert/Core/Helpers/navigation_helper.dart';
import 'package:emergency_alert/Core/app_constants.dart';
import 'package:emergency_alert/EMAUser/call_hoe_page.dart';
import 'package:emergency_alert/Provider/Auth/epa_user_provider.dart';
import 'package:emergency_alert/Provider/Auth/login_provider.dart';
import 'package:emergency_alert/Utils/Loaders/loader_utils.dart';
import 'package:emergency_alert/Views/Auth/signup.dart';
import 'package:emergency_alert/Views/GetStarted/getstarted.dart';
import 'package:emergency_alert/Views/Home/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponderLoginPage extends StatelessWidget {
  ResponderLoginPage({super.key});
  final textController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<EPAUserAuthProvider>(builder: (context, auth, _) {
            return auth.loadPage
                ? const LoadingPage()
                : Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Image.asset(
                          logo,
                          scale: 3,
                        )),
                        const Text(
                          "Login as responder",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: AppColors.PRIMARYCOLOR),
                        ),
                        AppSpaces.height8,
                        const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        AppSpaces.height20,
                        TextFormWidget(
                          textController,
                          "Email",
                          false,
                          hint: "Enter email",
                          validate: true,
                          validateEmail: true,
                        ),
                        AppSpaces.height20,
                        PasswordField(
                            hintText: "Enter Password",
                            title: "Password",
                            controller: passwordController,
                            validateMsg: "validateMsg",
                            validate: true,
                            inputType: TextInputType.text),
                        Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forgot Password",
                                  style:
                                      TextStyle(color: AppColors.PRIMARYCOLOR),
                                ))),
                        AppSpaces.height40,
                        SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                              title: "Login",
                              color: AppColors.PRIMARYCOLOR,
                              onTap: () async {
                              if (formKey.currentState?.validate() == true){
                                 await auth
                                    .performLogin(context,
                                        email: textController.text,
                                        password: passwordController.text)
                                    .then((value) {
                                  if (value == true) {
                                    AppNavigationHelper.navigateToWidget(
                                        context, const ResponderHomeScreen());
                                  }
                                });
                              }
                              },
                            )),
                        const Spacer(),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              AppNavigationHelper.navigateToWidget(
                                  context, SignupPage());
                            },
                            child: RichText(
                                text: const TextSpan(
                                    children: [
                                  TextSpan(
                                      text: "Sign Up",
                                      style: TextStyle(
                                          color: AppColors.PRIMARYCOLOR,
                                          decoration: TextDecoration.underline))
                                ],
                                    text: "Dont have an account? ",
                                    style: TextStyle(color: AppColors.BLACK))),
                          ),
                        )
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
