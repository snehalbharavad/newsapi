import 'package:flutter/material.dart';

import 'Model/Article.dart';

class NewsDescriptionPage extends StatelessWidget {
  final Article article;
  const NewsDescriptionPage({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('News details')),
        body: Column(
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
            Text('content:-${article.content}'),
          Text('Author:-${article.author}'),




    ],
        ),
    );

  }
}

