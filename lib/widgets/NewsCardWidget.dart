import 'package:flutter/material.dart';

import '../Model/Article.dart';

class NewsCardWidget extends StatelessWidget {
  final Article article;

  const NewsCardWidget({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
        semanticContainer: true,
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),

        child:Image.network('${article.urlToImage}'),
          
    ),
            Text('${article.title}',style:TextStyle(fontSize:20),),
            Text('${article.description}',
              maxLines: 3,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),



],
    );

  }
}
