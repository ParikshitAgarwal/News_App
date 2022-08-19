import 'package:flutter/material.dart';
import 'package:flutternewsapp/helper/data.dart';
import 'package:flutternewsapp/models/category_model.dart';
import 'package:flutternewsapp/widget/blog_tile.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/news.dart';
import '../models/article_model.dart';
import '../widget/category_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category = [];
  var newslist;
  bool _loading = true;

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    newslist = newsClass.news;
    print(newslist["articles"]);
    print(newslist["articles"].length);
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Flutter",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
            Text("News",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        imageURl: category[index].imageUrl,
                        categoryName: category[index].categoryName,
                      );
                    },
                    itemCount: category.length,
                    shrinkWrap: true,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return (newslist["articles"][index]["description"] !=
                                    null &&
                                newslist["articles"][index]["title"] != null &&
                                newslist["articles"][index]["urlToImage"] !=
                                    null &&
                                newslist["articles"][index]["url"] != null)
                            ? BlogTile(
                                title: newslist["articles"][index]["title"],
                                description: newslist["articles"][index]
                                    ["description"],
                                imageUrl: newslist["articles"][index]
                                    ["urlToImage"],
                                url: newslist["articles"][index]["url"],
                              )
                            : SizedBox(
                                height: 1,
                              );
                      },
                      itemCount: newslist["articles"].length,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
