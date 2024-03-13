import 'package:flutter/material.dart';

import 'loginScreen.dart';
import 'muTextField.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController repetPasswordController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
              child: Image.asset('assets/signUp_image.jpg')),
          Text('Hi there!'),
          Text(
            'Let\'s get started',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyTextFeild(emailController, (value) {
                        if (value == null || value.trim() == '')
                          return null;
                      }, false, 'email address',
                          Icon(Icons.alternate_email_outlined),TextInputType.emailAddress),
                      MyTextFeild(passwordController, (value) {
                        if (value == null || value.trim() == '')
                          return 'Please enter your password';
                        return null;
                      }, visible, 'password',
                        Icon(Icons.password),
                        TextInputType.visiblePassword,
                        suffix: InkWell(
                            onTap: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            child: Icon(Icons.remove_red_eye_outlined))
                        ,),
                      MyTextFeild(repetPasswordController, (value) {
                        if (value == null || value.trim() == '')
                          return 'Please enter your repeat password';
                        if (value != passwordController.text)
                          return 'Passwords do not match';
                        else
                          return null;
                      }, true, 'Repeat Password',
                          Icon(Icons.password),
                          TextInputType.visiblePassword
                      ),
                      MyTextFeild(addressController, (value) {
                        if (value == null || value.trim() == '')
                          return 'Please enter your address';
                        return null;
                      } ,false, 'address',
                          Icon(Icons.home_outlined),
                      TextInputType.text),
                      MyTextFeild(phoneController, (value) {
                        if (value == null || value.trim() == '')
                          return 'Please enter your phone number';
                        return null;
                      }, false, 'phone number',
                          Icon(Icons.phone),
                        TextInputType.phone),
                      MyTextFeild(dateController, (value) {
                        if (value == null || value.trim() == '')
                          return 'Please enter your date';
                        return null;
                      }, false, 'date of birth: dd/mm/yy',
                          Icon(Icons.date_range),
                          TextInputType.datetime),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: const TextSpan(
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              children: [
                                TextSpan(
                                    text: 'By signing up, you agree to our'
                                ),
                                TextSpan(
                                    text: 'Terms & Conditions ',
                                    style: TextStyle(
                                        color: Colors.blue
                                    )),
                                TextSpan(
                                    text: 'and'
                                ),
                                TextSpan(
                                    text: ' Privacy Policy', style: TextStyle(
                                    color: Colors.blue
                                ))
                              ]
                          )
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              )),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print(
                                  'password:$passwordController repeated:$repetPasswordController');
                              Navigator.pushNamed(context, LoginScreen
                                  .routeName);
                            }
                          },
                          child: Text('Sign Up')),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
