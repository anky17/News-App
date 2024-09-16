import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';

import 'package:news_app/home/widget/news_icon_widget.dart';
import 'package:news_app/home/widget/news_slideicon_widget.dart';
import 'package:news_app/home/widget/news_listcard_widget.dart';

class MainNewsPage extends StatefulWidget {
  const MainNewsPage({super.key});

  @override
  State<MainNewsPage> createState() => _MainNewsPageState();
}

class _MainNewsPageState extends State<MainNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'KANTIPUR',
          style: TextStyle(
              color: Color.fromARGB(255, 22, 210, 119),
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.notifications, size: 30),
          SizedBox(width: 5),
          Icon(
            Icons.search,
            size: 30,
          ),
          SizedBox(width: 30),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder(
                builder: (context, snapshot) {
                  return SizedBox(
                    height: 230,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return NewsIconWidget(newsList: snapshot.data![index]);
                      },
                    ),
                  );
                },
                future: ApiService().fetchAlbum(),
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  return Container(
                    margin: const EdgeInsets.only(left: 8, top: 8, bottom: 5),
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return NewsSideIcon(slideList: snapshot.data?[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 10);
                      },
                    ),
                  );
                },
                future: ApiService().fetchAlbum(),
              ),
              const SizedBox(height: 13),
              FutureBuilder(
                builder: (context, snapshot) {
                  return SizedBox(
                    height: 480,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/mainNewsPage',
                                  arguments: snapshot.data?[index]);
                            },
                            child: NewsListCard(item: snapshot.data?[index]));
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                    ),
                  );
                },
                future: ApiService().fetchAlbum(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
