import 'package:flutter/material.dart';
import 'package:login_form/login_screen_2.dart';
import 'package:login_form/utils/custom_snackbar.dart';
import 'package:login_form/utils/validators.dart';

class LoginScreenDesign extends StatefulWidget {
  const LoginScreenDesign({super.key});

  @override
  State<LoginScreenDesign> createState() => _LoginScreenDesignState();
}

class _LoginScreenDesignState extends State<LoginScreenDesign> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Login Screen',
          style: TextStyle(color: Colors.black),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailTextController,
              decoration: InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TextFormField(
              controller: passwordTextController,
              decoration: InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            MaterialButton(
              onPressed: () {
                if (emailTextController.text.isEmpty) {
                  showCustomSnackbar(
                      context: context, message: 'Email can not be empty!');
                } else if (emailTextController.text.isEmailNotValid()) {
                  showCustomSnackbar(
                      context: context, message: 'Invalid email!');
                } else if (passwordTextController.text.isEmpty) {
                  showCustomSnackbar(
                      context: context, message: 'Password can not be empty!');
                } else if (passwordTextController.text.isPasswordLowercase()) {
                  showCustomSnackbar(
                      context: context, message: 'contain aleast 1 lowercase');
                } else if (passwordTextController.text.isPasswordUppercase()) {
                  showCustomSnackbar(
                      context: context, message: 'contain aleast 1 uppercase');
                } else if (passwordTextController.text.isPasswordDigit()) {
                  showCustomSnackbar(
                      context: context, message: 'contain aleast 1 digit');
                } else if (passwordTextController.text
                    .isPasswordSpecialChar()) {
                  showCustomSnackbar(
                      context: context,
                      message: 'contain aleast 1 special character');
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreenDesignn(),
                    ),
                  );
                }
                setState(() {});
              },
              color: Colors.greenAccent,
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
