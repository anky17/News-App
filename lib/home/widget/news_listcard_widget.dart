// import 'package:flutter/material.dart';
// import 'package:news_app/api/api_model.dart';
// import 'package:news_app/home/provider/news_listcard_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

// class NewsListCard extends StatefulWidget {
//   final Articles? item;

//   const NewsListCard({
//     super.key,
//     required this.item,
//   });

//   @override
//   NewsListCardState createState() => NewsListCardState();
// }

// class NewsListCardState extends State<NewsListCard> {
//   // bool isBookmarked = false;

//   Future<void> launchNewsUrl(String link) async {
//     final Uri url = Uri.parse(link);
//     if (!await launchUrl(url)) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     //  final newsProvider = Provider.of<NewsListCardProvider>(context);
//     return ChangeNotifierProvider(
//       create: (BuildContext context) => NewsListCardProvider(),
//       child: Container(
//         margin: const EdgeInsets.all(8),
//         height: 100,
//         width: 400,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(11),
//         ),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10.0),
//               child: Image.network(
//                 widget.item?.urlToImage ?? "n/a",
//                 height: 100,
//                 width: 100,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             const SizedBox(width: 7),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         height: 20,
//                         width: 20,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image:
//                                 NetworkImage(widget.item?.urlToImage ?? "n/a"),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 5),
//                       Text(
//                         widget.item?.source?.name ?? "n/a",
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     widget.item?.description ?? "n/a",
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 5),
//                   Row(
//                     children: [Text(widget.item?.publishedAt ?? "n/a")],
//                   )
//                 ],
//               ),
//             ),
//             Consumer<NewsListCardProvider>(builder: (context, provider, _) {
//               return IconButton(
//                 onPressed: () {
//                   // setState(() {
//                   //   isBookmarked = !isBookmarked;
//                   // });
//                   provider.toogleBookmark();
//                 },
//                 icon: Icon(
//                   provider.isBookmarked
//                       ? Icons.bookmark
//                       : Icons.bookmark_outline,
//                   color: provider.isBookmarked
//                       ? const Color.fromARGB(255, 63, 185, 68)
//                       : Colors.grey,
//                 ),
//               );
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:news_app/api/api_model.dart';
import 'package:news_app/home/provider/news_listcard_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsListCard extends StatelessWidget {
  final Articles? item;
  const NewsListCard({super.key, this.item});

  Future<void> launchNewsUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final newsProvider = Provider.of<NewsListCardProvider>(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => NewsListCardProvider(),
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 100,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                item?.urlToImage ?? "n/a",
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item?.urlToImage ?? "n/a"),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        item?.source?.name ?? "n/a",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item?.description ?? "n/a",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [Text(item?.publishedAt ?? "n/a")],
                  )
                ],
              ),
            ),
            Consumer<NewsListCardProvider>(builder: (context, provider, _) {
              return IconButton(
                onPressed: () {
                  provider.toogleBookmark();
                },
                icon: Icon(
                  provider.isBookmarked
                      ? Icons.bookmark
                      : Icons.bookmark_outline,
                  color: provider.isBookmarked
                      ? const Color.fromARGB(255, 63, 185, 68)
                      : Colors.grey,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
