import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              height: 550,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    data['largeImageURL'],
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AsyncWallpaper.setWallpaper(
            url: data['largeImageURL'],
            goToHome: true,
            wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
            toastDetails: ToastDetails.success(),
            errorToastDetails: ToastDetails.error(),
          );
        },
        child: const Icon(CupertinoIcons.airplane),
      ),
    );
  }
}
