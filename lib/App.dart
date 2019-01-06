import 'package:flutter/material.dart';
import './pages/top_stories.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      home: TopStories()
    );
  }
}