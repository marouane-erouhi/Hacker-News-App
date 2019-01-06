import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import '../endpoint.dart';

part './item.g.dart';

@JsonSerializable()
class Item{
  final String id;
  final String userName;
  final String url;
  final String type;
  final int score;
  final int descendants;
  final List<int> kids;
  final String title;
  final int time;

  Item({this.id, this.url, this.type, this.title, this.userName, this.descendants, this.score, this.time, this.kids});
  Item.blank() :
    id = '',
    url = '',
    type = '',
    title = '',
    userName = '',
    descendants = 0,
    score = 0,
    time = 0,
    kids = [];

  static Future<List<String>> fetchTopStories() async {
    var uri = Endpoint.uri('/topstories');//make the url
    final resp = await http.get(uri.toString());//get ids of all top stories

    if(resp.statusCode != 200){
      throw('Error getting data:\n${resp.body}');
    }

    List<String> stories = new List<String>();
    for(var story in json.decode(resp.body)){
      stories.add('$story');
    }
    return stories;
  }

  static Future<List<Item>> fetchStories(List<String> storyIds) async{
    List<Item> stories = new List<Item>();
    for(String story in storyIds){
      var uri = Endpoint.uri('/item/$story');
      final resp = await http.get(uri.toString());

      if(resp.statusCode != 200){
        throw('Error getting story data:\n${resp.body}');
      }

      final Map<String, dynamic> itemMap = json.decode(resp.body);
      stories.add(Item.fromJson(itemMap));
    }
    return stories;
  }

  factory Item.fromJson(Map<String, dynamic> json) => 
    _$ItemFromJson(json);
}