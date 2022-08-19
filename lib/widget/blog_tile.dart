import 'package:flutter/material.dart';
import 'package:flutternewsapp/views/article_view.dart';

class BlogTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String url;
  const BlogTile(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(blogImageUrl: url)));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              description,
              maxLines: 3,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
