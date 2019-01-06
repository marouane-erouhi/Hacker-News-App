import 'package:flutter/material.dart';
import '../styles.dart';

class DefaultAppBar extends AppBar{
  @override
  final IconThemeData iconTheme = IconThemeData(
    color: Colors.black
  );
  @override
  final Color backgroundColor = Styles.navBarBackgroundColor;
  @override
  final List<Widget> actions = [
    IconButton(
      icon: Icon(Icons.search),
      tooltip: 'Search',
      onPressed: _searchButtonAction,
    ),
    IconButton(
      icon: Icon(Icons.more_vert),
      tooltip: 'More Options',
      onPressed: _moreOptions,
    )
  ];

  DefaultAppBar(String titleText) : super(
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:[
        Text(
          titleText,
          style: Styles.navBarTitle
        ),
        Text(
          'Last updated 3 min ago',
          style: Styles.navBarSubtitle,
        ),
      ]
    )
  );

  void hasBeenUpdated(){
    print('the content has been updated');
  }

  static void _searchButtonAction(){
    print('search button clicked');
  }
  static void _moreOptions(){
    print('more option button pressed');
  }
}