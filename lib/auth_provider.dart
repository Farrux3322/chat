import 'package:chat/universal_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_service.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider({required this.firebaseServices});

  final AuthService firebaseServices;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  loginButtonPressed() {
    passwordController.clear();
    emailController.clear();
    userNameController.clear();
  }

  signUpButtonPressed() {
    passwordController.clear();
    emailController.clear();
  }

  Future<void> logInUser(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    UniversalData universalData =
    await firebaseServices.loginUser(email: email, password: password);
  }

  Future<void> logOutUser(BuildContext context) async {
    UniversalData universalData = await firebaseServices.logOutUser();
    passwordController.clear();
    confirmPasswordController.clear();
    userNameController.clear();
    emailController.clear();
  }
  Future<void> signInWithGoogle(BuildContext context) async {
    UniversalData universalData = await firebaseServices.signInWithGoogle();
  }

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();

  Future<void> signUpUser(BuildContext context) async {
    if (passwordController.text == confirmPasswordController.text) {
      String email = emailController.text;
      String password = passwordController.text;
      UniversalData universalData =
          await firebaseServices.signUpUser(email: email, password: password);
    }
  }
}
