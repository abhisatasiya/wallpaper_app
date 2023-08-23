import 'dart:convert';
import 'package:abhi_wallpaper_app/models/post_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();

  String api = "https://jsonplaceholder.typicode.com/posts";

  Future<List?> getWallpapers({String query = "0"}) async {
    String wallpaperApi =
        "https://pixabay.com/api/?key=38981358-ea42b3ab41381b90f98b30d82&q=$query&orientation=vertical&safesearch=true&category=wallpaper";
    http.Response response =
        await http.get(Uri.parse(wallpaperApi), headers: {});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List allData = data['hits'];

      return allData;
    }
  }

  Future<Posts?> getSingleResponse() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      Posts post = Posts.fromMap(data: data);

      return post;
    }
  }

  Future<List<Posts>?> getMultipleResponse() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      List allData = jsonDecode(response.body);

      List<Posts> allPosts =
          allData.map((e) => Posts.fromMap(data: e)).toList();

      return allPosts;
    }
  }
}
