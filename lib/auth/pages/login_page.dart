import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../auth_provider.dart';
import '../widgets/global_button.dart';
import '../widgets/global_text_fields.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.onChanged});

  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: ListView(
          children: [
            Lottie.asset("assets/images/login.json"),
            const SizedBox(height: 60),
            GlobalTextField(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller: context.read<AuthProvider>().emailController),
            const SizedBox(height: 24),
            GlobalTextField(
              obscureText: true,
              hintText: "Password",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.start,
              controller: context.read<AuthProvider>().passwordController,
            ),
            const SizedBox(height: 24),
            GlobalButton(
                title: "Log In",
                onTap: () {
                  context.read<AuthProvider>().logInUser(context);
                }),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      onChanged.call();
                      context.read<AuthProvider>().signUpButtonPressed();
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18.spMin),
                    ))
              ],
            ),
            const SizedBox(height: 90),
          ],
        ));
  }
}
