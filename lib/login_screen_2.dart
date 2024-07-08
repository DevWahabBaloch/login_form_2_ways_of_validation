import 'package:flutter/material.dart';
import 'package:login_form/utils/validators.dart';

class LoginScreenDesignn extends StatefulWidget {
  const LoginScreenDesignn({super.key});

  @override
  State<LoginScreenDesignn> createState() => _LoginScreenDesignnState();
}

class _LoginScreenDesignnState extends State<LoginScreenDesignn> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  var fromKey = GlobalKey<FormState>();

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
          backgroundColor: Colors.teal,
          title: Text(
            'Login Screen',
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: fromKey,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid email';
                      } else if (value.isEmailNotValid()) {
                        return 'Invalid email';
                      }
                    },
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid password';
                      } else if (value.isPasswordLowercase()) {
                        return 'Password must contain atleast one lowercase letter';
                      } else if (value.isPasswordUppercase()) {
                        return 'Password must contain atleast one uppercase letter';
                      } else if (value.isPasswordDigit()) {
                        return 'Password must contain atleast one digit';
                      } else if (value.isPasswordSpecialChar()) {
                        return 'Password must contain atleast one special character';
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        //yes
                      } else {
                        //no
                      }
                      
                    },
                    color: Colors.teal,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )));
  }
}
