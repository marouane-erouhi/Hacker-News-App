import 'dart:core';

class Endpoint{
  static const apiScheme = 'https';
  static const apiHost = 'hacker-news.firebaseio.com';
  static const prefix = '/v0';
  static const fileExtiontion = '.json';

  static Uri uri(String path, {Map<String, dynamic> queryParameters}){
    final uri = new Uri(
      scheme: apiScheme,
      host: apiHost,
      path: '$prefix$path$fileExtiontion',
      queryParameters: queryParameters
    );
    return uri;
  }
}