import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/news/news_item.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class searchScreen extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[IconButton(onPressed: (){
      showResults(context);
    }, icon:const Icon(Icons.search) )];
  }

  @override
  Widget? buildLeading(BuildContext context) {
  return IconButton(onPressed: (){
    Navigator.pop(context);
  }, icon:const Icon(Icons.arrow_back) ,);
  }

  @override

  Widget buildResults(BuildContext context) {
     return FutureBuilder(
      future: APIService.getSearchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        }
        final newsList = snapshot.data?.news ?? [];
        return ListView.builder(
          itemBuilder: (_, index) => NewsItem(newsList[index]),
          itemCount: newsList.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     return FutureBuilder(
      future: APIService.getSearchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        }
        final newsList = snapshot.data?.news ?? [];
        return ListView.builder(
          itemBuilder: (_, index) => NewsItem(newsList[index]),
          itemCount: newsList.length,
        );
      },
    );
  }
  
}