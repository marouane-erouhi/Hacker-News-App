import 'package:flutter/material.dart';
import '../models/item.dart';
import '../styles.dart';

//TODO: make the time since the post was posted dynamic from data

class StoryItem extends StatelessWidget{
  final Item item;

  StoryItem({this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.itemDecoration,
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      margin: EdgeInsets.symmetric(vertical: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "${item.title}",
            style: Styles.itemTitleText,
          ),
          Text(
            '${item.url}',
            style: Styles.itemDomainNameText,
          ),
          Text(
            '4d - ${item.userName}',
            style: Styles.itemInfoText,
          ),
        ],
      )
    );
  }

}