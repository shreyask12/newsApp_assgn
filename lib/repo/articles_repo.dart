import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class ArticlesRepository {
  Future<dynamic> getnewsArticles({
    @required title,
  });
}

class ArticlesRepositoryIml extends ArticlesRepository {
  static const url = 'https://api.spaceflightnewsapi.net/v3/articles';

  @override
  Future getnewsArticles({
    title,
  }) async {
    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);

      return data;
    } else {
      print("Exception=======>");
      throw Exception();
    }
  }
}
