import 'package:chat/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../global_button.dart';
import '../widgets/global_text_fields.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.onChanged});

  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: ListView(
        children: [
          Lottie.asset("assets/images/sign.json",height: 220.h),
          const SizedBox(
            height: 24,
          ),
          GlobalTextField(
            hintText: "Username",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            textAlign: TextAlign.start,
            controller: context.read<AuthProvider>().userNameController,
          ),
          const SizedBox(
            height: 24,
          ),
          GlobalTextField(
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            textAlign: TextAlign.start,
            controller: context.read<AuthProvider>().emailController,
          ),
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
          GlobalTextField(
            obscureText: true,
            hintText: "Confirm Password",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            textAlign: TextAlign.start,
            controller: context.read<AuthProvider>().confirmPasswordController,
          ),
          const SizedBox(height: 24),
          GlobalButton(
              title: "Sign up",
              onTap: () {
                context.read<AuthProvider>().signUpUser(context);
              }),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    onChanged.call();
                    context.read<AuthProvider>().loginButtonPressed();
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 18.spMin),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
