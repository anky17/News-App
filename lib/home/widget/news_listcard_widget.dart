// lib/custom_list_item.dart

import 'package:flutter/material.dart';
import 'package:news_app/home/model/news_profile_model.dart';

class NewsListCard extends StatelessWidget {
  final NewsProfileItem item;

  const NewsListCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Image.asset(
              item.imagePath,
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        item.imagePath,
                        height: 20,
                        width: 20,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(item.title),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  item.subtitle,
                  maxLines: 2, // Limit the text to 2 lines
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [Text(item.dateAndType)],
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_outlined,
              color: Color.fromARGB(255, 63, 185, 68),
            ),
          )
        ],
      ),
    );
  }
}
