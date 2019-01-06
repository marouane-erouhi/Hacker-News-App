import 'package:flutter/material.dart';
import 'dart:async';
import '../components/story_item.dart';
import '../models/item.dart';

class TopStories extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TopStories();
}

class _TopStories extends State{
  ScrollController _scrollController = new ScrollController();
  List<Item> _newsItems = [];
  List<String> _newsItemIds;
  int _itemsLeft = 0;
  bool loading = false;
  bool isPerformingRequest = false;//for scroll controller

  @override
  void initState(){
    super.initState();
    _loadData();
    _scrollController.addListener(() {
      //window.innerHeight + window.scrollY >= document.body.clientHeight
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print('scrolled down');
        _loadMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Stories'),
      ),
      body: Container(
        // onRefresh: loadData,
        child: _renderStories(context),
      ),
    );
  }

  void _loadData() async{
    if(mounted){
      setState(() => loading = true);
      print('load data start');
      //load story ids
      if(_itemsLeft <= 0){
        final newsItemIds = await Item.fetchTopStories();
        //don't need a rebuild here, so I don't have to use setState
        _newsItemIds = newsItemIds;
        _itemsLeft = newsItemIds.length;
      }

      //load stories
      _loadMoreData();
      
    }//mounted
  }

  void _loadMoreData() async{
    if(_itemsLeft > 0 && !isPerformingRequest){
      setState(() {
        loading = true;
        isPerformingRequest = true;
      });
      //take the first 10 items
      final storiesToBeLoaded = _newsItemIds.take(10).toList();
      //remove those elements
      for(int i = 0; i < storiesToBeLoaded.length; i++){
        _newsItemIds.removeAt(0);
      }

      final stories = await Item.fetchStories(storiesToBeLoaded);
      print('loaded more data');
      setState(() {
        _newsItems.addAll(stories);
        _itemsLeft -= 10;
        loading = false;
        isPerformingRequest = false;
      });
    }
  }

  Widget _renderProgressBar(BuildContext context){
    return (this.loading ? LinearProgressIndicator(
      value: null,
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
    ) : Container());
  }

  Widget _renderStories(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _renderProgressBar(context),
        Expanded( child: _renderListView(context) ),
      ],
    );
  }

  Widget _renderListView(BuildContext context){
    return ListView.builder(
      itemCount: _newsItems.length,
      itemBuilder: _listViewItemBuilder,
      controller: _scrollController,
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index){
    final Item newsItem = _newsItems[index];
    return StoryItem(item: newsItem);
  }

  // _updateScrollInfo([_]) {
  //   if (window.innerHeight + window.scrollY >= document.body.clientHeight) {
  //     print("at bottom");
  //   }
  // }
  // window.onScroll.listen(_updateScrollInfo);
  

  


}