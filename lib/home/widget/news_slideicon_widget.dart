// import 'package:flutter/material.dart';
// import 'package:news_app/api/api_model.dart';
// import 'package:news_app/home/provider/news_slideicon_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

// class NewsSideIcon extends StatefulWidget {
//   final Articles? slideList;
//   const NewsSideIcon({super.key, required this.slideList});

//   @override
//   State<NewsSideIcon> createState() => _NewsSideIconState();
// }

// class _NewsSideIconState extends State<NewsSideIcon> {
//   // bool isClicked = false;

//   Future<void> launchNewsUrl(String link) async {
//     final Uri url = Uri.parse(link);
//     if (!await launchUrl(url)) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (BuildContext context) => NewsSlideIconProvider(),
//       child: Consumer<NewsSlideIconProvider>(builder: (context, provider, _) {
//         return ElevatedButton(
//           onPressed: () {
//             launchNewsUrl(widget.slideList?.url ?? "");
//             // setState(() {
//             //   isClicked = !isClicked;
//             // });
//             provider.toogleClick();
//           },
//           style: ElevatedButton.styleFrom(
//             minimumSize: const Size(20, 30),
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             backgroundColor: provider.isClicked
//                 ? const Color.fromARGB(255, 255, 0, 0)
//                 : const Color.fromARGB(255, 37, 112, 39),
//           ),
//           child: Text(
//             widget.slideList?.source?.name ?? "n/a",
//             style: const TextStyle(color: Colors.white),
//           ),
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:news_app/api/api_model.dart';
import 'package:news_app/home/provider/news_slideicon_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsSlideIcon extends StatelessWidget {
  final Articles? slideList;
  const NewsSlideIcon({super.key, this.slideList});

  Future<void> launchNewsUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NewsSlideIconProvider(),
      child: Consumer<NewsSlideIconProvider>(builder: (context, provider, _) {
        return ElevatedButton(
          onPressed: () {
            launchNewsUrl(slideList?.url ?? "");
            provider.toogleClick();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(20, 30),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: provider.isClicked
                ? const Color.fromARGB(255, 255, 0, 0)
                : const Color.fromARGB(255, 37, 112, 39),
          ),
          child: Text(
            slideList?.source?.name ?? "n/a",
            style: const TextStyle(color: Colors.white),
          ),
        );
      }),
    );
  }
}
