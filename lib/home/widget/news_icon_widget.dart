import 'package:flutter/material.dart';
import 'package:news_app/api/api_model.dart';

class NewsIconWidget extends StatelessWidget {
  final Articles? newsList;

  const NewsIconWidget({super.key, required this.newsList});

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
              color: Color.fromARGB(255, 54, 174, 244),
              offset: Offset(0, 4),
              spreadRadius: 2,
              blurRadius: 6),
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(newsList?.urlToImage ?? "n/a"),
            fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 141, 73, 68),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: const Size(50, 30),
              ),
              child: Text(
                newsList?.author.toString() ?? "n/a",
                style: const TextStyle(color: Colors.white),
              )),
          Text(
            newsList?.publishedAt.toString() ?? "n/a",
            style: const TextStyle(color: Colors.white, fontSize: 17),
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
                    image: NetworkImage(
                      (newsList?.urlToImage ?? "n/a"),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  newsList?.description.toString() ?? "n/a",
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
