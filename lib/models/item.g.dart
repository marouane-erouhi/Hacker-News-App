// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return new Item(
      id: '${json['id']}' as String,
      url: json['url'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      userName: json['userName'] as String,
      descendants: json['descendants'] as int,
      score: json['score'] as int,
      time: json['time'] as int,
      kids: (json['kids'] as List)?.map((e) => e as int)?.toList());
}

abstract class _$ItemSerializerMixin {
  String get id;
  String get userName;
  String get url;
  String get type;
  int get score;
  int get descendants;
  List<int> get kids;
  String get title;
  int get time;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'userName': userName,
        'url': url,
        'type': type,
        'score': score,
        'descendants': descendants,
        'kids': kids,
        'title': title,
        'time': time
      };
}
