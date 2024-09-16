import 'package:flutter/material.dart';
import 'package:news_app/api/api_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ParticularNews extends StatefulWidget {
  final Articles? dataList;

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
    var hourlyData = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed News'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              hourlyData.title?.toString() ?? "n/a",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Image.network(
              hourlyData.urlToImage?.toString() ?? "n/a",
            ),
            const SizedBox(height: 5),
            Text(
              hourlyData.description?.toString() ?? "n/a",
            ),
            Text(
              hourlyData.publishedAt?.toString() ?? "n/a",
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
