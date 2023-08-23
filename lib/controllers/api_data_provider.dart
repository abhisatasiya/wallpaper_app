import 'package:abhi_wallpaper_app/controllers/helpers/api_helper.dart';
import 'package:abhi_wallpaper_app/models/post_model.dart';
import 'package:flutter/cupertino.dart';

class ApiController extends ChangeNotifier {
  Posts? post;
  List data = [];

  ApiController() {
    search();
  }

  Future<void> getData() async {
    post = await ApiHelper.apiHelper.getSingleResponse();
    notifyListeners();
  }

  search({String val = ""}) async {
    data = await ApiHelper.apiHelper.getWallpapers(query: val) ?? [];
    notifyListeners();
    return 0;
  }
}
