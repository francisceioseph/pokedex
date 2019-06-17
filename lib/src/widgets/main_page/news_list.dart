import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/news_model.dart';
import '../commons.dart';

class NewsList extends StatelessWidget with CommonsMixin {
  final List<NewsModel> news = [];

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 8,
        left: 8,
      ),
      child: Column(
        children: <Widget>[
          _buildNewsHeader(),
          _buildNewsList(),
        ],
      ),
    );
  }

  Widget _buildNewsHeader() {
    return Container(
      margin: EdgeInsets.only(
        top: 24.0,
        bottom: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildPageSubtitle('Pokémon News'),
          FlatButton(
            textColor: Colors.blue,
            child: Text('More...'),
            onPressed: news.length < 1 ? null : () {},
          )
        ],
      ),
    );
  }

  Widget _buildNewsList() {
    if (news.length < 1) {
      return Container(
        margin: EdgeInsets.only(bottom: 24.0),
        child: Text(
          'There is no news available now...',
          style: TextStyle(
            color: Colors.grey[700],
          ),
        ),
      );
    }

    return ListView.separated(
      itemCount: 3,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: _buildNewsItem,
      separatorBuilder: (context, index) => Divider(color: Colors.grey),
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
              buildItemTitle(newsItem.title),
              buildItemSubtitle(createdAt)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/placeholder.png',
                image: newsItem.imageUrl,
                height: 60,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
