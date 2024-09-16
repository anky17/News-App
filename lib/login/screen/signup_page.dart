import 'package:flutter/material.dart';
import 'package:news_app/login/screen/login_page.dart';
import 'package:news_app/login/widget/signup_widget_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 250),
                const Text(
                  "KANTIPUR",
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 118, 62),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 200),
                AuthenticationWidget(
                  image: "assets/images/google.png",
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  labelText: 'Sign up with Google',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
                  },
                ),
                AuthenticationWidget(
                  buttonColor: const Color.fromARGB(255, 52, 35, 29),
                  textColor: Colors.green,
                  labelText: 'Log in to my account',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Text.rich(
                    TextSpan(
                      text: 'By creating an account you accept ',
                      style: TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                          text: 'terms of use',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white70),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: Colors.white70),
                        ),
                        TextSpan(
                          text: 'privacy policy',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white70),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
