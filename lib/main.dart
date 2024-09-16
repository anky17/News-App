import 'package:flutter/material.dart';

import 'package:news_app/login/screen/signup_page.dart';
import 'package:news_app/home/navigated%20screen/particular_news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/mainNewsPage': (context) => const ParticularNews(),
      },
      debugShowCheckedModeBanner: false,
      title: 'News',
      home: const SignUpPage(),
    );
  }
}
