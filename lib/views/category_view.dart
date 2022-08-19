import 'package:flutter/material.dart';

import '../helper/news.dart';
import '../widget/blog_tile.dart';

class CategoryView extends StatefulWidget {
  final String category;
  const CategoryView({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  var newslist;
  bool _loading = true;

  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getCategoryNews(widget.category);
    newslist = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return (newslist["articles"][index]["description"] != null &&
                          newslist["articles"][index]["title"] != null &&
                          newslist["articles"][index]["urlToImage"] != null &&
                          newslist["articles"][index]["url"] != null)
                      ? BlogTile(
                          title: newslist["articles"][index]["title"],
                          description: newslist["articles"][index]
                              ["description"],
                          imageUrl: newslist["articles"][index]["urlToImage"],
                          url: newslist["articles"][index]["url"],
                        )
                      : SizedBox(
                          height: 1,
                        );
                },
                itemCount: newslist["articles"].length,
              ),
            ),
    );
  }
}
