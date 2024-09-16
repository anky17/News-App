import 'dart:convert';
import 'package:news_app/api/api_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Articles>?> fetchAlbum() async {
    try {
      final response = await http.get(Uri.parse(
          "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        final List dataList = data['articles'];
        return dataList.map((element) => Articles.fromJson(element)).toList();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }
}
