// lib/custom_list_item.dart

import 'package:flutter/material.dart';
import 'package:news_app/api/api_model.dart';

class NewsListCard extends StatelessWidget {
  final Articles? item;

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
