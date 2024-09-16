import 'package:flutter/material.dart';
import 'package:news_app/home/model/news_profile_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ParticularNews extends StatefulWidget {
  final List<NewsProfileItem>? dataList;

  const ParticularNews({super.key, this.dataList});

  @override
  State<ParticularNews> createState() => _ParticularNewsState();
}

final Uri _url = Uri.parse('https://google.com');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class _ParticularNewsState extends State<ParticularNews> {
  @override
  Widget build(BuildContext context) {
    var hourlyData =
        ModalRoute.of(context)?.settings.arguments as NewsProfileItem;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed News'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              hourlyData.title,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              hourlyData.imagePath,
            ),
            const SizedBox(height: 5),
            Text(
              hourlyData.subtitle,
            ),
            Text(
              hourlyData.dateAndType,
            ),
            const SizedBox(height: 20),
            const ElevatedButton(
                onPressed: _launchUrl, child: Text('Goto Google'))
          ],
        ),
      ),
    );
  }
}
