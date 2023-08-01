import 'package:flutter/material.dart';
import 'package:newsapi/services/ApiService.dart';
import 'package:newsapi/widgets/NewsCardWidget.dart';

import 'Model/Article.dart';
import 'NewsDescriptionPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('News API'),
      backgroundColor: Colors.blue),
      body: FutureBuilder(




        future: ApiService().getArticle(),
        builder:(BuildContext context,AsyncSnapshot<List<Article>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount:snapshot.data!.length ,
                itemBuilder:(BuildContext context ,index) {
                  return InkWell(
                    onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsDescriptionPage(article: snapshot.data![index],)),

                      );

                    },
                    child:  NewsCardWidget(article: snapshot.data![index])

                      );


                },
            );
          }
          return Center(child: CircularProgressIndicator());




        }
        ),



    );
  }
}



