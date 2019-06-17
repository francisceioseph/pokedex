import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/news_model.dart';

class NewsList extends StatelessWidget {
  final List<NewsModel> news = [
    NewsModel(
      id: 'abc',
      title: 'Pokemon Rumble Rush Arrives Soon',
      createdAt: DateTime.now(),
      imageUrl:
          'https://thumbs.web.sapo.io/?epic=YmI5KfwogBPNAKhIHQgOx6FUpdsnl2dSPybwweoe/EDpJIsz74Covdgj12Cq43DY+krYSyjyBBcsydT+B8CdGW9sgzf3H+zKtG/D9WgS8AcIW0E=&W=800&H=0&delay_optim=1',
    )
  ];

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: news.length,
        itemBuilder: _buildNewsItem,
      ),
    );
  }

  Widget _buildNewsItem(BuildContext context, int index) {
    final newsItem = news[index];
    final createdAt = DateFormat('dd MMM yyyy').format(newsItem.createdAt);

    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                newsItem.title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                createdAt,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Image.network(
                newsItem.imageUrl,
                height: 150,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
