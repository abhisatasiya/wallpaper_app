import 'package:abhi_wallpaper_app/controllers/api_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: AnimatedTextKit(
          animatedTexts: [
            RotateAnimatedText(
              'wallpaper app',
              textStyle: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          repeatForever: true,
          displayFullTextOnTap: true,
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<ApiController>(builder: (context, pro, _) {
        List data = pro.data;
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onSubmitted: (val) {
                    print("SEARCH: $val");
                    pro.search(val: val);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.builder(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('detail_page', arguments: data[index]);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          data[index]['largeImageURL'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
