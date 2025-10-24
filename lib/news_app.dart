

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics_app/news_model.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {

  NewsModel? news;

  bool isLoading = true;

  @override
  void initState()  {
    super.initState();
    getNews();
  }


  final Dio dio = Dio();

  final apiPath = "https://newsapi.org/v2/everything?domains=techcrunch.com&apiKey=1f61186025724ff99436bd7ca9fa128d";

  Future<void> getNews() async {

   final response = await dio.get(apiPath);

   dynamic jsonResponse  = response.data;

    news = NewsModel.fromJson(jsonResponse);

    isLoading = false ;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator()) :  Center(
        child: Column(
          children: [
            Text('Total Result = ${news?.totalResults ?? 316 }'),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: news!.articles!.length,
                itemBuilder: (context , index){
                  return ListTile(
                    title: Text('${news!.articles![index].title}'),
                    subtitle: Text('${news!.articles![index].description}'),
                  );
              }),
            )
          ],
        ),
      ),
    );
  }
}