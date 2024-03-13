import 'package:flutter/material.dart';
import 'package:login/muTextField.dart';
import 'package:login/signupScreen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName='loginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset('assets/login_image.jpg')),
          Text('welcome back!'),
          Text(
            'Please, Log In.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Form(
            key:formKey,
              child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyTextFeild(emailController,(value) {
                  if (value == null || value.trim() == '')
                    return 'Please enter your email address';
                   return null;
                }, false, 'email address',
                    Icon(Icons.alternate_email_outlined),TextInputType.emailAddress),
                MyTextFeild(passwordController,(value) {
                  if (value == null || value.trim() == '')
                    return 'Please enter your password.';
                  else return null;
                }, visible, 'password',
                    Icon(Icons.password),
                    TextInputType.visiblePassword,
                    suffix: InkWell(
                        onTap: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        child: Icon(Icons.remove_red_eye_outlined))),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text('Forget Password?',
                          style: TextStyle(fontWeight: FontWeight.bold))),
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
                      if(formKey.currentState!.validate()){
                        //GoTo Home
                      }
                    },
                    child: Text('Log In')),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
