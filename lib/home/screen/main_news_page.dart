import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/home/model/news_card_model.dart';
import 'package:news_app/home/model/news_icon_model.dart';
import 'package:news_app/home/model/news_profile_model.dart';
import 'package:news_app/home/widget/news_icon_widget.dart';
import 'package:news_app/home/widget/news_slideicon_widget.dart';
import 'package:news_app/home/widget/news_listcard_widget.dart';

class MainNewsPage extends StatefulWidget {
  const MainNewsPage({super.key});

  @override
  State<MainNewsPage> createState() => _MainNewsPageState();
}

class _MainNewsPageState extends State<MainNewsPage> {
  List<NewsProfileItem> newsProfileItems = [
    NewsProfileItem(
      dateAndType: '2024-09-01 | World News',
      title: 'Marlina Kampret',
      subtitle:
          'China is set to shatter its wind and solar target five years early',
      imagePath: 'assets/images/thumbup.png',
    ),
    NewsProfileItem(
      dateAndType: '2024-09-02 | Technology',
      title: 'Tech Innovations',
      subtitle: 'New advancements in AI are changing the industry landscape',
      imagePath: 'assets/images/thumbup.png',
    ),
    NewsProfileItem(
      dateAndType: '2024-09-03 | Sports',
      title: 'Local Team Wins Championship',
      subtitle: 'The local cricket team has secured the championship title',
      imagePath: 'assets/images/thumbup.png',
    ),
    NewsProfileItem(
      dateAndType: '2024-09-04 | Health',
      title: 'New Breakthrough in Medicine',
      subtitle:
          'A revolutionary treatment for chronic diseases has been announced',
      imagePath: 'assets/images/thumbup.png',
    ),
    NewsProfileItem(
      dateAndType: '2024-09-05 | Entertainment',
      title: 'Movie Premiere',
      subtitle: 'The latest blockbuster hits the theaters this weekend',
      imagePath: 'assets/images/thumbup.png',
    ),
    NewsProfileItem(
      dateAndType: '2024-09-06 | Environment',
      title: 'Climate Change Conference',
      subtitle:
          'World leaders gather to discuss new strategies for climate action',
      imagePath: 'assets/images/thumbup.png',
    ),
    NewsProfileItem(
      dateAndType: '2024-09-07 | Education',
      title: 'New Learning Technologies',
      subtitle: 'Innovative tools are transforming the education sector',
      imagePath: 'assets/images/thumbup.png',
    ),
    NewsProfileItem(
      dateAndType: '2024-09-08 | Finance',
      title: 'Market Trends Analysis',
      subtitle: 'Experts provide insights into the current financial trends',
      imagePath: 'assets/images/thumbup.png',
    ),
  ];
  List<NewsIconList> newsListData = [
    NewsIconList(
      imagePath: 'assets/images/mt.png',
      roundedProfile: 'assets/images/thumbup.png',
      profileName: 'Chari Don',
      iconText: 'Environment',
      subtitle:
          'Collapse of a mountain peak in Nepal amid thawing permafrost triggers a huge rockfall',
    ),
    NewsIconList(
      imagePath: 'assets/images/mt.png',
      roundedProfile: 'assets/images/thumbup.png',
      profileName: 'Jane Doe',
      iconText: 'Technology',
      subtitle:
          'New AI breakthrough promises to revolutionize tech industries worldwide',
    ),
    NewsIconList(
      imagePath: 'assets/images/mt.png',
      roundedProfile: 'assets/images/thumbup.png',
      profileName: 'Chari Don',
      iconText: 'Environment',
      subtitle:
          'Collapse of a mountain peak in Nepal amid thawing permafrost triggers a huge rockfall',
    ),
    NewsIconList(
      imagePath: 'assets/images/mt.png',
      roundedProfile: 'assets/images/thumbup.png',
      profileName: 'John Smith',
      iconText: 'Health',
      subtitle: 'Recent studies show the benefits of a plant-based diet',
    ),
    NewsIconList(
      imagePath: 'assets/images/mt.png',
      roundedProfile: 'assets/images/thumbup.png',
      profileName: 'Amit Kumar',
      iconText: 'Sports',
      subtitle:
          'Nepal secures historic win in cricket tournament against a major team',
    ),
  ];
  List<NewsSlideIconModel> newsSlideIcons = [
    NewsSlideIconModel(iconText: 'Environment'),
    NewsSlideIconModel(iconText: 'Technology'),
    NewsSlideIconModel(iconText: 'Health'),
    NewsSlideIconModel(iconText: 'Sports'),
    NewsSlideIconModel(iconText: 'Science'),
    NewsSlideIconModel(iconText: 'Politics'),
    NewsSlideIconModel(iconText: 'Business'),
    NewsSlideIconModel(iconText: 'Entertainment'),
  ];

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
              Container(
                margin: const EdgeInsets.only(left: 8, top: 8, bottom: 5),
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: newsSlideIcons.length,
                  itemBuilder: (context, index) {
                    return NewsSideIcon(slideList: newsSlideIcons[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 10);
                  },
                ),
              ),
              const SizedBox(height: 13),
              SizedBox(
                height: 480,
                width: 420,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: newsProfileItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/mainNewsPage',
                              arguments: newsProfileItems[index]);
                        },
                        child: NewsListCard(item: newsProfileItems[index]));
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
