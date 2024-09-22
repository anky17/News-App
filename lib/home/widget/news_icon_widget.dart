import 'package:flutter/material.dart';
import 'package:news_app/api/api_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsIconWidget extends StatefulWidget {
  final Articles? newsList;
  const NewsIconWidget({super.key, required this.newsList});

  @override
  State<NewsIconWidget> createState() => _NewsIconWidgetState();
}

class _NewsIconWidgetState extends State<NewsIconWidget> {
  bool isClicked = true;
  Future<void> launchNewsUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 330,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: widget.newsList?.urlToImage != null
              ? NetworkImage(widget.newsList!.urlToImage!)
              : const AssetImage('assets/images/mt.png') as ImageProvider,
          fit: BoxFit.fill,
          opacity: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              launchNewsUrl(widget.newsList?.url ?? "");
              setState(() {
                isClicked = !isClicked;
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: isClicked ? Colors.green : Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: const Size(50, 30),
            ),
            child: Text(
              widget.newsList?.author ?? "Unknown Author",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Text(
            widget.newsList?.title ?? "No title available",
            style: const TextStyle(color: Colors.white, fontSize: 17),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: widget.newsList?.urlToImage != null
                        ? NetworkImage(widget.newsList!.urlToImage!)
                        : const AssetImage('assets/images/mt.png')
                            as ImageProvider,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  widget.newsList?.description ?? "No description available",
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
