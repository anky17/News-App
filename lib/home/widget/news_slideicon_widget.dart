import 'package:flutter/material.dart';
import 'package:news_app/api/api_model.dart';

class NewsSideIcon extends StatelessWidget {
  final Articles? slideList;
  const NewsSideIcon({super.key, required this.slideList});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(20, 30),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        backgroundColor: const Color.fromARGB(255, 37, 112, 39),
      ),
      child: Text(
        slideList?.source?.name ?? "n/a",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
