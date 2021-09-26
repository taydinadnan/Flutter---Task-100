import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:tech387task/Widgets/social_buttons.dart';
import 'package:neon/neon.dart';

import '/screens/AuthScreen/forgot_password.dart';
import '/screens/AuthScreen/signup.dart';
import '/screens/home_screen.dart';

class LoginAuth extends StatefulWidget {
  const LoginAuth(email, {Key? key}) : super(key: key);

  @override
  _LoginAuthState createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  final _formKey = GlobalKey<FormState>();
  var email = "";
  var password = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

//user login function
  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print('No user found for the email');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text(
              'No user found for that email!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.amber,
              ),
            ),
          ),
        );
      } else if (error.code == 'wrong-password') {
        print('Wrong password provided by the user!');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text(
              'Wrong password provided by the user!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.amber,
              ),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          gradient: const LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              colors: [
                Color(0xFFCCCCFF),
                Color(0xFF96DED1),
                Color(0XFFB6D0E2),
                Color(0XFFB6D0E2),
                Color(0XFFB6D0E2),
                Color(0xFF96DED1),
              ],
              stops: [
                0.0,
                0.3,
                0.3,
                0.7,
                0.7,
                1.0
              ]),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/mowee.png",
                    height: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Neon(
                    text: 'MöweeHome',
                    color: Colors.purple,
                    fontSize: 35,
                    font: NeonFont.Beon,
                    flickeringText: true,
                    flickeringLetters: null,
                    glowingDuration: const Duration(seconds: 1),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 15.0),
                      errorStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: 15,
                      ),
                      contentPadding: EdgeInsets.all(10),
                    ),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      } else if (!value.contains('@')) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 15.0),
                      errorStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: 15,
                      ),
                      contentPadding: EdgeInsets.all(10),
                    ),
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      } else if (value.length < 6) {
                        return 'Must be more than 6 charater';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = emailController.text;
                              password = passwordController.text;
                            });
                            userLogin();
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPassword()));
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do not have an account ?',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => Signup(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                            (route) => false);
                      },
                      child: const Text(
                        'Create an account',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const SocalButtns(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
