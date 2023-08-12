import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapi/Model/Article.dart';

class ApiService{
  final endPoint="https://newsapi.org/v2/everything?q=apple&from=2023-08-11&to=2023-08-11&sortBy=popularity&apiKey=d1f8c28e22874ed2beb7fc243212a190";

  Future<List<Article>> getArticle() async {
    Response response =await get(Uri.parse(endPoint));

    if(response.statusCode==200){
      Map<String, dynamic>body= jsonDecode(response.body);//information get
      List<dynamic>article=body['articles'];//
      List<Article> data = article.map((dynamic item) => Article.fromJson(item)).toList();
      return data;

    }else{
      throw "Something wrong";
    }
  }
}